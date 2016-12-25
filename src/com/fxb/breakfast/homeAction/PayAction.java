package com.fxb.breakfast.homeAction;

import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.action.Action;
import com.fxb.breakfast.action.ActionResult;
import com.fxb.breakfast.action.ResultContent;
import com.fxb.breakfast.action.ResultType;
import com.fxb.breakfast.dao.impl.OrderDaoImpl;
import com.fxb.breakfast.dao.impl.ProductDaoImpl;
import com.fxb.breakfast.dao.impl.UserInfoDaoImpl;
import com.fxb.breakfast.model.Order;
import com.fxb.breakfast.model.Product;
import com.fxb.breakfast.model.User;

public class PayAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cookie[] cookies=req.getCookies();
		String [][] info=null;
		int prices=0;
		for (int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("mini_car")){
			String car=URLDecoder.decode(cookies[i].getValue(), "UTF-8");
			String[] s1 = car.replaceAll("],", "]#").split("#");
	        String[][] arr = new String[s1.length][6];
	        for(int j=0;j<arr.length;j++) {
	            String[] s2 = s1[j].split(",");
	            arr[j] = new String[s2.length+1];
	            for(int k=0;k<s2.length;k++) {
	                arr[j][k] = s2[k].replaceAll("\\[|\\]", "");
                     if(k==1){
                    	 arr[j][k]=arr[j][k].substring(arr[j][k].indexOf('"')+1, arr[j][k].lastIndexOf('"'));
                     }
	            }
	            prices+=Integer.parseInt(arr[j][2])*Integer.parseInt(arr[j][3]);
	            arr[j][4]=String.valueOf(Integer.parseInt(arr[j][2])*Integer.parseInt(arr[j][3]));
	          }
	        info=arr;
			}
		}
	    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=new Date();
		String time=String.valueOf(date.getTime());
		int userId=(int)req.getSession().getAttribute("userId");
		User user=new UserInfoDaoImpl().getAll(userId);
		String orderID=time+userId;
		boolean flag=false;
		List<Integer> sellerIds=new ArrayList<Integer>();
		List<String> orders=new ArrayList<String>();
		List<Order> orderList=new ArrayList<Order>();
		List<List<Product>> productList=new ArrayList<List<Product>>();
		OrderDaoImpl orderDaoImpl=new OrderDaoImpl();
		ProductDaoImpl productDaoImpl=new ProductDaoImpl();
		for(int i=0;i<info.length;i++){
			int goodId=Integer.valueOf(info[i][0].substring(info[i][0].indexOf('"')+1, info[i][0].lastIndexOf('"')));
			int sellerId=productDaoImpl.findId(goodId);
			boolean nn=true;
			for(int j=0;j<sellerIds.size();j++){
				if(sellerIds.get(j)==sellerId){
					 Product prd=new Product(info[i][1], Integer.valueOf(info[i][2]), Integer.valueOf(info[i][3]));
					 productList.get(i).add(prd);
					 orderDaoImpl.insertPdt(goodId, orders.get(j), Integer.valueOf(info[i][3]), Float.valueOf(info[i][4]));
			       nn=false;
			       break;
				}
			}
			if(nn){
				String orderNum=time+userId+""+sellerId;
				orderDaoImpl.insertPdt(goodId, orderNum, Integer.valueOf(info[i][3]), Float.valueOf(info[i][4]));
				Product product=new Product(info[i][1], Integer.valueOf(info[i][2]), Integer.valueOf(info[i][3]));
				List<Product> listPrd=new ArrayList<Product>();
				listPrd.add(product);
				productList.add(listPrd);
				orders.add(orderNum);
				sellerIds.add(sellerId);
			}
			
			
		}
		/*int goodId=Integer.valueOf(info[i][0].substring(info[i][0].indexOf('"')+1, info[i][0].lastIndexOf('"')));
		orderID+=goodId;
		int num=Integer.valueOf(info[i][3]);*/
		for(int i=0;i<sellerIds.size();i++){
			int countPrice=0;
			for(int j=0;j<productList.get(i).size();j++){
				countPrice+=(productList.get(i).get(j).getNum()*productList.get(i).get(j).getPice());
			}
			orderList.add(new Order(countPrice, productList.get(i), 6, orders.get(i), time));
			 flag=orderDaoImpl.insertOrder(orders.get(i), userId, sellerIds.get(i), 0, 0, user.getName(), user.getPhone(), user.getAddress(), 6, time);
		}
	  
		if(flag){
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("mini_car")){
					Cookie cookie = new Cookie(cookies[i].getName(), null);  
				 cookie.setMaxAge(0);
				 resp.addCookie(cookie);
				 break;
				}
				
		    }
		}
		
		req.setAttribute("orderId", orderID);
		req.setAttribute("time", simpleDateFormat.format(date));
		req.setAttribute("price", prices);
		req.setAttribute("address", user.getAddress());
		req.setAttribute("phone", user.getPhone());
		req.setAttribute("orderList", orderList);
		return new ActionResult(new ResultContent("pay.jsp"),ResultType.Forward) ;
	}

}

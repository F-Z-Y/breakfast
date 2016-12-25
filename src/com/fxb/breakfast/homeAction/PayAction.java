package com.fxb.breakfast.homeAction;

import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.action.Action;
import com.fxb.breakfast.action.ActionResult;
import com.fxb.breakfast.action.ResultContent;
import com.fxb.breakfast.action.ResultType;
import com.fxb.breakfast.dao.impl.OrderDaoImpl;
import com.fxb.breakfast.dao.impl.UserInfoDaoImpl;
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
	            	    System.out.println("===="+arr[j][k]);
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
		for(int i=0;i<info.length;i++){
			int goodId=Integer.valueOf(info[i][0].substring(info[i][0].indexOf('"')+1, info[i][0].lastIndexOf('"')));
			new OrderDaoImpl().insertPdt(goodId, orderID, Integer.valueOf(info[i][3]), Float.valueOf(info[i][4]));
		}
		/*int goodId=Integer.valueOf(info[i][0].substring(info[i][0].indexOf('"')+1, info[i][0].lastIndexOf('"')));
		orderID+=goodId;
		int num=Integer.valueOf(info[i][3]);*/
	   flag=new OrderDaoImpl().insertOrder(orderID, userId, 0, 0, 0, user.getName(), user.getPhone(), user.getAddress(), 6, time);
		if(flag){
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("mini_car")){
				System.out.println("=====cookie");
					Cookie cookie = new Cookie(cookies[i].getName(), null);  
				 cookie.setMaxAge(0);
				 System.out.println("=====aaaaaaaaaa");
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
		req.setAttribute("orderList", info);
		return new ActionResult(new ResultContent("pay.jsp"),ResultType.Forward) ;
	}

}

package com.fxb.breakfast.homeAction;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.action.Action;
import com.fxb.breakfast.action.ActionResult;
import com.fxb.breakfast.action.ResultContent;
import com.fxb.breakfast.action.ResultType;
import com.fxb.breakfast.dao.impl.UserDaoImpl;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class OrderAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int price=0;
		Cookie[] cookies=req.getCookies();
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
	            }
	            arr[j][1]=arr[j][1].substring(arr[j][1].indexOf('"')+1, arr[j][1].lastIndexOf('"'));
	            price+=Integer.parseInt(arr[j][2])*Integer.parseInt(arr[j][3]);
	            arr[j][4]=String.valueOf(Integer.parseInt(arr[j][2])*Integer.parseInt(arr[j][3]));
	          }
	        req.setAttribute("orderList", arr);
	        req.setAttribute("price", price);
			}
		}
		req.setAttribute("userInfo", new UserDaoImpl().findId((int)req.getSession().getAttribute("userId")));
		return new ActionResult(new ResultContent("order.jsp"), ResultType.Forward);
	}

}

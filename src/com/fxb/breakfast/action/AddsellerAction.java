package com.fxb.breakfast.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.dao.impl.SellerInfoDaoImpl;


public class AddsellerAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = 0;
		if(req.getParameter("seller") != null){
			id = Integer.valueOf(req.getParameter("seller"));
			req.setAttribute("sellerInfo", new SellerInfoDaoImpl().getInfo(id));
		}else{
			req.setAttribute("sellerInfo", new SellerInfoDaoImpl().getInfo(0));
		}
		return new ActionResult(new ResultContent("addSeller.jsp"), ResultType.Forward);
	}

}

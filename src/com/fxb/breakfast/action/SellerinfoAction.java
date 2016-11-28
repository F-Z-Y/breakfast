package com.fxb.breakfast.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.dao.impl.SellerInfoDaoImpl;


public class SellerinfoAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.valueOf(req.getParameter("seller_info"));
		req.setAttribute("sellerInfo", new SellerInfoDaoImpl().getInfo(id));
		//SellerInfo list=new SellerInfoDaoImpl().getInfo(id);
		//System.out.println("??????????????==="+list.getName());
		return new ActionResult(new ResultContent("sellerInfo.jsp"), ResultType.Forward);
	}

}

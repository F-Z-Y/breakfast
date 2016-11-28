package com.fxb.breakfast.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.dao.impl.GoodInfoDaoImpl;


public class GoodinfoAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.valueOf(req.getParameter("good_info"));
		req.setAttribute("goodInfo", new GoodInfoDaoImpl().getInfo(id));
		//SellerInfo list=new SellerInfoDaoImpl().getInfo(id);
		//System.out.println("??????????????==="+list.getName());
		return new ActionResult(new ResultContent("goodInfo.jsp"), ResultType.Forward);
	}

}

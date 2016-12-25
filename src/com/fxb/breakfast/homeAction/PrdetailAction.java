package com.fxb.breakfast.homeAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.action.Action;
import com.fxb.breakfast.action.ActionResult;
import com.fxb.breakfast.action.ResultContent;
import com.fxb.breakfast.action.ResultType;
import com.fxb.breakfast.dao.impl.GoodInfoDaoImpl;
import com.fxb.breakfast.dao.impl.ProductDaoImpl;
import com.fxb.breakfast.model.GoodInfo;

public class PrdetailAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 int id=Integer.valueOf(req.getParameter("id"));
		 System.out.println("===="+id);
		 GoodInfo goodInfo=new GoodInfoDaoImpl().getInfo(id);
		 req.setAttribute("GoodInfo",goodInfo);
		return new ActionResult(new ResultContent("prdetail.jsp"), ResultType.Forward);
	}

}

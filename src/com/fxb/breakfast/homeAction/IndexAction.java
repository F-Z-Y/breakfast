package com.fxb.breakfast.homeAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.action.Action;
import com.fxb.breakfast.action.ActionResult;
import com.fxb.breakfast.action.ResultContent;
import com.fxb.breakfast.action.ResultType;
import com.fxb.breakfast.dao.impl.ProductDaoImpl;
import com.fxb.breakfast.dao.impl.SellerDaoImpl;

public class IndexAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("banner", "f");
		req.setAttribute("productList", new ProductDaoImpl().getAll());
		req.setAttribute("shopList", new SellerDaoImpl().getAll());
		return new ActionResult(new ResultContent("index.jsp"),ResultType.Forward);
	}

}

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

public class ProductAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("productList", new ProductDaoImpl().getAll());
		return new ActionResult(new ResultContent("product.jsp"),ResultType.Forward);
	}

}

package com.fxb.breakfast.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.dao.impl.TransactionDaoImpl;


public class UserrechangeAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("transaction", new TransactionDaoImpl().getAll(1));
		req.setAttribute("status", 1);
		return new ActionResult(new ResultContent("transaction.jsp"), ResultType.Forward);
	}

}

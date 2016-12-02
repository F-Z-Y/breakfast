package com.fxb.breakfast.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.dao.impl.SellerInfoDaoImpl;


public class PatrimonysetAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		return new ActionResult(new ResultContent("patrimonySet.jsp"), ResultType.Forward);
	}

}

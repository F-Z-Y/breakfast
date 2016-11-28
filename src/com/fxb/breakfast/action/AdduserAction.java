package com.fxb.breakfast.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.dao.impl.RecoveryDaoImpl;
import com.fxb.breakfast.model.Product;


public class AdduserAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		return new ActionResult(new ResultContent("addUser.jsp"), ResultType.Forward);
	}

}

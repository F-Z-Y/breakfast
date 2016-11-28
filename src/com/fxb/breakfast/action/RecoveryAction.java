package com.fxb.breakfast.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.dao.impl.RecoveryDaoImpl;
import com.fxb.breakfast.model.Product;


public class RecoveryAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("recoveryList", new RecoveryDaoImpl().getAll());
		List<Product> list=new RecoveryDaoImpl().getAll();
		for (int i = 0; i < list.size(); i++) {
			System.out.println("??????????????==="+list.get(i).getSellerName());
		}
		return new ActionResult(new ResultContent("recovery.jsp"), ResultType.Forward);
	}

}

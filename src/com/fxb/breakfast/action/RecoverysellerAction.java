package com.fxb.breakfast.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.dao.impl.RecoverySellerDaoImpl;
import com.fxb.breakfast.model.Seller;


public class RecoverysellerAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("sellerList", new RecoverySellerDaoImpl().getAll());
		List<Seller> list=new RecoverySellerDaoImpl().getAll();
		for (int i = 0; i < list.size(); i++) {
			System.out.println("??????????????==="+list.get(i).getName());
		}
		return new ActionResult(new ResultContent("recoverySeller.jsp"), ResultType.Forward);
	}

}

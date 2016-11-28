package com.fxb.breakfast.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.dao.impl.SellerDaoImpl;
import com.fxb.breakfast.model.Seller;


public class SellerAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("sellerList", new SellerDaoImpl().getAll());
		List<Seller> list=new SellerDaoImpl().getAll();
		for (int i = 0; i < list.size(); i++) {
			System.out.println("??????????????==="+list.get(i).getName());
		}
		return new ActionResult(new ResultContent("seller.jsp"), ResultType.Forward);
	}

}

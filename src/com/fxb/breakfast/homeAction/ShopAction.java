package com.fxb.breakfast.homeAction;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.action.Action;
import com.fxb.breakfast.action.ActionResult;
import com.fxb.breakfast.action.ResultContent;
import com.fxb.breakfast.action.ResultType;
import com.fxb.breakfast.dao.impl.SellerDaoImpl;
import com.fxb.breakfast.model.Seller;

public class ShopAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Seller> shopList=new SellerDaoImpl().getAll();
		req.setAttribute("shopList", shopList);
		return new ActionResult(new ResultContent("shop.jsp"),ResultType.Forward);
	}

}

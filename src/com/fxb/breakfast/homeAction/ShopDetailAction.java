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
import com.fxb.breakfast.dao.impl.SellerInfoDaoImpl;
import com.fxb.breakfast.model.SellerInfo;

public class ShopDetailAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path=req.getRequestURI();
		System.out.println("==!==="+path);
		int id=Integer.valueOf(req.getParameter("id"));
		SellerInfo sellerInfo=new SellerInfoDaoImpl().getInfo(id);
		req.setAttribute("shopDetail",sellerInfo);
		req.setAttribute("productList", new ProductDaoImpl().getIDAll(id));
		return new ActionResult(new ResultContent("shopDetail.jsp"),ResultType.Forward);
	}
         
}

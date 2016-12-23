package com.fxb.breakfast.homeAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fxb.breakfast.action.Action;
import com.fxb.breakfast.action.ActionResult;
import com.fxb.breakfast.action.ResultContent;
import com.fxb.breakfast.action.ResultIndicator;
import com.fxb.breakfast.action.ResultType;
import com.fxb.breakfast.dao.impl.OrderDaoImpl;
import com.fxb.breakfast.dao.impl.UserDaoImpl;
import com.fxb.breakfast.model.User;

public class OrderPayAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession seession=req.getSession();
		String orderID=req.getParameter("orderID");
		System.out.println("-----"+orderID);
		float prices=Float.valueOf(req.getParameter("price"));
		System.out.println("===="+prices);
		User user =new UserDaoImpl().findId((int)seession.getAttribute("userId"));
		ResultIndicator ri=new ResultIndicator();
		if(user.getMoney()<prices){
			ri.code=1;
			ri.msg="余额不足，请充值！！！";
		}else{
			boolean flag=new OrderDaoImpl().updatePay(orderID, prices,0);
			boolean fg=new UserDaoImpl().updateMoney((int)seession.getAttribute("userId"), prices,0);
			if(flag&&fg){
				ri.code=0;
				ri.msg="支付成功！！！";
			}else{
				ri.code=1;
				ri.msg="支付失败！！！";
			}
		}
		
		
		
		
		return new ActionResult(new ResultContent(ri),ResultType.Ajax);
	}

}

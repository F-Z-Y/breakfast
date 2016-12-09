package com.fxb.breakfast.homeAction;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fxb.breakfast.action.Action;
import com.fxb.breakfast.action.ActionResult;
import com.fxb.breakfast.action.ResultContent;
import com.fxb.breakfast.action.ResultIndicator;
import com.fxb.breakfast.action.ResultType;
import com.fxb.breakfast.dao.impl.TransactionDaoImpl;

public class RechargeAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session=req.getSession();
	    int userId=(int)session.getAttribute("userId");
	    float money=Float.valueOf(req.getParameter("price"));
	    Date date=new Date();
	    long time= date.getTime();
		boolean flag=new TransactionDaoImpl().insert(money, 1, 0, userId, time);
		ResultIndicator rt=new ResultIndicator();
		if(flag){
			rt.setCode(0);
			rt.setMsg("充值成功，等待审核！！！");
		}else{
			rt.setCode(1);
			rt.setMsg("充值失败！！！");
		}
		return new ActionResult(new ResultContent(rt),ResultType.Ajax);
	}

}

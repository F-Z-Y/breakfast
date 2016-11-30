package com.fxb.breakfast.homeAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.fxb.breakfast.action.Action;
import com.fxb.breakfast.action.ActionResult;
import com.fxb.breakfast.action.ResultContent;
import com.fxb.breakfast.action.ResultIndicator;
import com.fxb.breakfast.action.ResultType;
import com.fxb.breakfast.dao.impl.LoginDaoImpl;
import com.fxb.breakfast.model.LogIn;
import com.fxb.breakfast.model.User;


public class LoginAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LogIn user=(new LoginDaoImpl().findAll(req.getParameter("username"), req.getParameter("password"), Integer.valueOf(req.getParameter("type"))));
		ResultIndicator result=new ResultIndicator();
		if(user!=null){
			result.setCode(0);
			result.setMsg("登录成功!!!");
			HttpSession session=req.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("account", user.getAccount());
		}else{
			result.setCode(1);
			result.setMsg("用户名或密码错误!!!");
		}
		return new ActionResult(new ResultContent(result), ResultType.Ajax);
	}

}

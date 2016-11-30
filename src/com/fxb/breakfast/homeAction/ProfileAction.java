package com.fxb.breakfast.homeAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fxb.breakfast.action.Action;
import com.fxb.breakfast.action.ActionResult;
import com.fxb.breakfast.action.ResultContent;
import com.fxb.breakfast.action.ResultType;
import com.fxb.breakfast.dao.impl.UserDaoImpl;
import com.fxb.breakfast.model.User;

public class ProfileAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		ResultType type=null;
		String url="home/login.jsp";
		if(session.getAttribute("userId")==null){
			type=ResultType.Redirect;
		}else{
		  int userId=(int)session.getAttribute("userId");
		  url="profile.jsp";
		  type=ResultType.Forward;
		  User user=new UserDaoImpl().findId(userId);
		  req.setAttribute("userInfo", user);
		}
		return new ActionResult(new ResultContent(url),type);
	}

}

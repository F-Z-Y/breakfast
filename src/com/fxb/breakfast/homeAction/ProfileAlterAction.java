package com.fxb.breakfast.homeAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.action.Action;
import com.fxb.breakfast.action.ActionResult;
import com.fxb.breakfast.action.ResultContent;
import com.fxb.breakfast.action.ResultType;
import com.fxb.breakfast.dao.impl.UserDaoImpl;
import com.fxb.breakfast.dao.impl.UserInfoDaoImpl;

public class ProfileAlterAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userId=(int)req.getSession().getAttribute("userId");
		req.setAttribute("userInfo", new UserInfoDaoImpl().getAll(userId));
		return new ActionResult(new ResultContent("profileAlter.jsp"),ResultType.Forward);
	}

}

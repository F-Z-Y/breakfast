package com.fxb.breakfast.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.dao.impl.UserDaoImpl;
import com.fxb.breakfast.model.User;


public class UserAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("userList", new UserDaoImpl().getAll());
		List<User> list=new UserDaoImpl().getAll();
		for (int i = 0; i < list.size(); i++) {
			System.out.println("??????????????==="+list.get(i).getName());
		}
		return new ActionResult(new ResultContent("user.jsp"), ResultType.Forward);
	}

}

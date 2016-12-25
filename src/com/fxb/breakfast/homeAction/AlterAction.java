package com.fxb.breakfast.homeAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fxb.breakfast.action.Action;
import com.fxb.breakfast.action.ActionResult;
import com.fxb.breakfast.action.ResultContent;
import com.fxb.breakfast.action.ResultIndicator;
import com.fxb.breakfast.action.ResultType;
import com.fxb.breakfast.dao.impl.UserDaoImpl;

public class AlterAction implements Action {

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String username=req.getParameter("username");
		String phone=req.getParameter("phone");
		String address=req.getParameter("address");
		int userId=(int)req.getSession().getAttribute("userId");
		boolean flag=new UserDaoImpl().updateInfo(userId, name, username, phone, address);
		ResultIndicator rt=new ResultIndicator();
		if(flag){
			rt.code=0;
			rt.msg="修改成功！！！";
		}else{
			rt.code=1;
			rt.msg="修改失败！！！";
		}
		return new ActionResult(new ResultContent(rt),ResultType.Ajax);
	}

}

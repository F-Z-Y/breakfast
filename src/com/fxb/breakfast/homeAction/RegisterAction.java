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
import com.fxb.breakfast.dao.impl.LoginDaoImpl;
import com.fxb.breakfast.dao.impl.UserDaoImpl;
import com.fxb.breakfast.dao.impl.UserInfoDaoImpl;
import com.fxb.breakfast.util.MD5Util;

public class RegisterAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String account=req.getParameter("account").trim();
		String userName=req.getParameter("username").trim();
		String name=req.getParameter("name").trim();
		String password=req.getParameter("password").trim();
		String rePassword=req.getParameter("repassword");
		String phone=req.getParameter("phone").trim();
		String address=req.getParameter("address").trim();
		ResultIndicator rt=new ResultIndicator();
		if(!password.equals(rePassword)){
			rt.code=1;
			rt.msg="两次密码不一致！！！";
		}else{
			boolean isCheck=new LoginDaoImpl().findUser(account);
			if(isCheck){
				rt.code=1;
				rt.msg="此用户名已注册过";
			}else{
				rePassword=MD5Util.encode(rePassword);
				int id= new UserInfoDaoImpl().insertInfo(name, userName, phone, address);
				new LoginDaoImpl().insertUser(account, rePassword, 3, id);
				rt.code=0;
				rt.msg="注册成功！！！";
			}
		}
		return new ActionResult(new ResultContent(rt),ResultType.Ajax);
	}

}

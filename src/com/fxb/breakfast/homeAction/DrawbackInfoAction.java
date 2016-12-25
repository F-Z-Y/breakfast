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
import com.fxb.breakfast.dao.impl.OrderDaoImpl;
import com.fxb.breakfast.dao.impl.TransactionDaoImpl;
import com.fxb.breakfast.dao.impl.UserDaoImpl;

public class DrawbackInfoAction implements Action{

	@Override
	public ActionResult execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		String num=req.getParameter("orderID");
		float price=0;
		ResultIndicator rt=new ResultIndicator();
		boolean flag=false;
		if(req.getParameter("type")==null){
			price=Float.valueOf(req.getParameter("price"));
			new UserDaoImpl().updateMoney((int)session.getAttribute("userId"), price, 1);
			 flag=new OrderDaoImpl().updatePay(num, price,2);
			 if(flag){
					rt.setCode(0);
					rt.setMsg("�˿�ɹ�������");
				}else{
					rt.setCode(1);
					rt.setMsg("�˿�ʧ�ܣ�����");
				}
		}else{
			if(req.getParameter("type").equals("2")){
				boolean statu=new OrderDaoImpl().updateStatus(num, 3);
				if(statu){
					rt.setCode(0);
					rt.setMsg("��������ɣ�����");
				}else{
					rt.setCode(1);
					rt.setMsg("ʧ�ܣ�����");
				}
			}else{
			price=Float.valueOf(req.getParameter("price"));
			Date date=new Date();
			long time=date.getTime();
			flag=new TransactionDaoImpl().insert(price, 2, 0, (int)session.getAttribute("userId"), time);
			 if(flag){
					rt.setCode(0);
					rt.setMsg("�˿��������ύ����Ҫ��ˣ�����");
				}else{
					rt.setCode(1);
					rt.setMsg("�˿�ʧ�ܣ�����");
				}
			}
		}
		
		
		
		return new ActionResult(new ResultContent(rt),ResultType.Ajax);
	}

}

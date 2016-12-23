package com.fxb.breakfast.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.fxb.breakfast.util.DbResourceManager;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/SetApply")
public class SetApply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SetApply() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		int set_status = Integer.parseInt(request.getParameter("status"));
		int status = 0;
		if(set_status==0){
			status = 1;
		}
		PreparedStatement presta=null;
		ResultSet rest=null;
		Connection conn=null;
		boolean res = false;
		try {
			conn=DbResourceManager.getConnection();
			
			String check_sql="select * from transaction where id=?";
			presta=conn.prepareStatement(check_sql);
			presta.setInt(1, id);
			rest=presta.executeQuery();
			int nowStatus=1,type=0,apply_money=0,user_id=0;
			while (rest.next()) {
				nowStatus = rest.getInt("status");
				type  = rest.getInt("type");
				apply_money = rest.getInt("money");
				user_id = rest.getInt("relation_id");
			}
			
			if(nowStatus==0 && type==1 && user_id!=0){
				String update_sql="update transaction set status=?,update_time=? where id=?; ";
				presta=conn.prepareStatement(update_sql);
				presta.setInt(1, 1);
				presta.setLong(2, System.currentTimeMillis());
				presta.setInt(3, id);
				presta.executeUpdate();
				
				String set_money = "update user set money=money+? where id=?; ";
				presta=conn.prepareStatement(set_money);
				presta.setInt(1, apply_money);
				presta.setInt(2, user_id);
				int apply_res = presta.executeUpdate();
				if(apply_res==1){
					res = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(presta!=null){
					presta.close();
				}
				if(conn!=null){
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		response.setHeader("content-type","text/html;charset=UTF-8");  
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		int code = 1;
		boolean msg = false;
		if(res){
			code = 0;
			msg = true;
		}
		obj.put("code", code);
		obj.put("msg", msg);
		out.println(obj);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

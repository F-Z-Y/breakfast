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
 * Servlet implementation class CheckAccount
 */
@WebServlet("/CheckAccount")
public class CheckAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String account = request.getParameter("account");
		int status = 3;
		PreparedStatement presta=null;
		ResultSet rest=null;
		Connection conn=null;
		JSONObject user_info = new JSONObject();
		String sql="select u.* from user as u,login as l where u.id=l.relation_id and l.account=? and l.type=? limit 1; ";
		boolean res = false;
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql);
			presta.setString(1, account);
			presta.setInt(2, status);
			rest=presta.executeQuery();
			while(rest.next()){
				res = true;
				int userid=rest.getInt("id");
				String name=rest.getString("name");	
				String phone=rest.getString("phone");
				String address=rest.getString("address");
				float money = rest.getFloat("money");
				user_info.put("id", userid);
				user_info.put("name", name);
				user_info.put("phone", phone);
				user_info.put("address", address);
				user_info.put("money", money);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rest!=null){
					rest.close();
				}
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
		obj.put("data", user_info);
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

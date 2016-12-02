package com.fxb.breakfast.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet("/PatriCorrect")
public class PatriCorrect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatriCorrect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		float money = Float.valueOf(request.getParameter("money"));
		int obj_id = Integer.valueOf(request.getParameter("obj_id"));
		PreparedStatement presta=null;
		int rest = 0;
		Connection conn=null;
		String sql="update user set money=? where id=?; ";
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql);
			presta.setFloat(1, money);
			presta.setInt(2, obj_id);
			rest=presta.executeUpdate();
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
		if(rest==1){
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

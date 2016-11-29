package com.fxb.breakfast.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.fxb.breakfast.util.DbResourceManager;

/**
 * Servlet implementation class addSeller
 */
@WebServlet("/SaveSeller")
public class SaveSeller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveSeller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String introduction = request.getParameter("introduction");
		int id = Integer.valueOf(request.getParameter("obj_id"));
		PreparedStatement presta=null;
		int rest=0;
		Connection conn=null;
		String sql="update seller set name=?,address=?,introduction=?,phone=? where id=?;";
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			presta.setString(1, name);
			presta.setString(2, address);
			presta.setString(3, introduction);
			presta.setString(4, phone);
			presta.setInt(5, id);
			rest = presta.executeUpdate();
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
		int msg = 0;
		if(rest!=0){
			code = 0;
			msg = id;
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

	public String refFormatNowDate() {
		Date nowTime = new Date(System.currentTimeMillis());
		SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String retStrFormatNowDate = sdFormatter.format(nowTime);
		return retStrFormatNowDate;
	}
	
}

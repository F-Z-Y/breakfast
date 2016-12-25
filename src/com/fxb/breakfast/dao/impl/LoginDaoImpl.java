package com.fxb.breakfast.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fxb.breakfast.dao.LoginDao;
import com.fxb.breakfast.model.LogIn;
import com.fxb.breakfast.model.Seller;
import com.fxb.breakfast.model.User;
import com.fxb.breakfast.util.DbResourceManager;
import com.fxb.breakfast.util.MD5Util;

public class LoginDaoImpl implements LoginDao{

	public LogIn findAll(String username,String password,int type) {
		PreparedStatement presta=null;
		ResultSet rest=null;
		Connection conn=null;
		String pwd=MD5Util.encode(password);
		String sql="select login.* from login  where  account='"+username+"'and password='"+pwd+"' and type="+type+" and status=0;";
		System.out.println(sql);
		LogIn login=null;
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql);
			rest=presta.executeQuery();
			
			while(rest.next()){
				login=new LogIn(rest.getInt("relation_id"),rest.getString("account"));
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
		return login;
	}

	@Override
	public boolean findUser(String username) {
		PreparedStatement presta=null;
		ResultSet rest=null;
		Connection conn=null;
		String sql="select * from login where account='"+username+"';";
		boolean flag=false;
		conn=DbResourceManager.getConnection();
		try {
			presta=conn.prepareStatement(sql);
			rest=presta.executeQuery();
			if(rest.next())flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		
		return flag;
	}

	@Override
	public int insertUser(String account, String password, int type, int relation_id) {
		Connection conn=null;
		PreparedStatement prepare=null;
		String sql="insert into login (account,password,type,relation_id,status) value('"+account+"','"+password+"',"+type+","+relation_id+",0)";
		conn=DbResourceManager.getConnection();
		int sta=0;
		try {
			prepare=conn.prepareStatement(sql);
			sta=prepare.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{

			try {
				if(prepare!=null){
					prepare.close();
				}
				if(conn!=null){
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		return sta;
	}
	

}

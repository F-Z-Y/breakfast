package com.fxb.breakfast.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.dao.UserDao;
import com.fxb.breakfast.model.User;
import com.fxb.breakfast.util.DbResourceManager;


public class UserInfoDaoImpl implements UserDao{

	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public User getAll(int id) {
		User UserInfo = null;
		if(id==0){
			UserInfo = new User(0,null,null, null,null);
			return UserInfo;
		}
		PreparedStatement presta=null;
		ResultSet rest=null;
		Connection conn=null;
		String sql="select * from user where id=?; ";
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql);
			presta.setInt(1, id);
			rest=presta.executeQuery();
			while(rest.next()){
				int userid=rest.getInt("id");
				String name=rest.getString("name");	
				String phone=rest.getString("phone");
				String address=rest.getString("address");
				String userName=rest.getString("user_name");
				UserInfo = new User(userid,name,address, phone,userName);
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
		return UserInfo;
	}

	@Override
	public PageBean findByPage(int page, int size) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageBean findByPage(QueryBean queryBean, int page, int size) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public User findId(int id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean updateInfo(int userId, String name, String username, String phone, String address) {
		// TODO Auto-generated method stub
		return false;
	}




	@Override
	public int insertInfo(String name, String username, String phone, String address) {
		Connection conn=null;
		Statement prepare=null;
		ResultSet rs=null;
		String sql="insert into user (name,user_name,phone,address) value('"+name+"','"+username+"','"+phone+"','"+address+"')";
		conn=DbResourceManager.getConnection();
		int Id=0;
		try {
			prepare=conn.createStatement();
			prepare.execute(sql, Statement.RETURN_GENERATED_KEYS);
			rs=prepare.getGeneratedKeys();
			if(rs.next())
				Id=rs.getInt(1);	
		} catch (SQLException e) {
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
		
		return Id;
	}


	@Override
	public boolean updateMoney(int userId, float prices) {
		// TODO Auto-generated method stub
		return false;
	}




}

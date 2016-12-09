package com.fxb.breakfast.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
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


public class UserDaoImpl implements UserDao{

	@Override
	public User getAll(int id) {
		return null;
	}
	
	@Override
	public List<User> getAll() {
		List<User> users=new ArrayList<User>();
		PreparedStatement presta=null;
		ResultSet rest=null;
		Connection conn=null;
		String sql="select l.account,u.* from user as u left join login as l on u.id=l.relation_id where l.status=0 and l.type=3; ";
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql);
			rest=presta.executeQuery();
			while(rest.next()){
				int userid=rest.getInt("id");
				String acconut=rest.getString("account");
				String name=rest.getString("name");	
				String userName=rest.getString("user_name");
				String phone=rest.getString("phone");	
				float money=rest.getFloat("money");
				users.add(new User(userid, acconut, name, userName,phone,money));
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
		return users;
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
		User users=null;
		PreparedStatement presta=null;
		ResultSet rest=null;
		Connection conn=null;
		String sql="select l.account,u.* from user as u left join login as l on u.id=l.relation_id where u.id="+id+" and l.status=0 and l.type=3; ";
		System.out.println("==="+sql);
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql);
			rest=presta.executeQuery();
			while(rest.next()){
				String acconut=rest.getString("account");
				String address=rest.getString("address");
				String name=rest.getString("name");	
				String userName=rest.getString("user_name");
				String phone=rest.getString("phone");	
				float money=rest.getFloat("money");
				String headImg=rest.getString("photo");
				users=new User(id,address, acconut, name, userName,phone,money,headImg);
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
		return users;
	}

	@Override
	public boolean updateInfo(int userId, String name, String username, String phone, String address) {
	    Connection conn=null;
	    PreparedStatement presta=null;
	    conn=DbResourceManager.getConnection();
	    String sql="update user set name='"+name+"',user_name='"+username+"',phone='"+phone+"',address='"+address+"' where id="+userId+";";
	    boolean flag=false;
	    try {
			presta=conn.prepareStatement(sql);
			int status=presta.executeUpdate();
			if(status>0) flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	    
		return flag;
	}

	@Override
	public int insertInfo(String name, String username, String phone, String address) {
		
		
		return 0;
	}

	@Override
	public boolean updateMoney(int userId,float prices) {
		Connection conn=null;
		Statement statem=null;
		String sql="update user set money=money-"+prices+" where id="+userId;
		boolean flag=false;
		conn=DbResourceManager.getConnection();
		try {
			statem=conn.createStatement();
			int status=statem.executeUpdate(sql);
			if(status>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}

}

package com.fxb.breakfast.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.dao.OrderDao;
import com.fxb.breakfast.model.Order;
import com.fxb.breakfast.model.Product;
import com.fxb.breakfast.util.DbResourceManager;


public class OrderDaoImpl implements OrderDao{

	@Override
	public List<Order> getAll() {
		List<Order> orders=new ArrayList<Order>();
		PreparedStatement presta=null;
		ResultSet rest=null;
		Connection conn=null;
		String sql="select o.*,u.name as user_name,g.name as good_name,l.account from orders as o INNER JOIN user as u on o.user_id=u.id INNER JOIN goods as g on o.goods_id=g.id INNER JOIN login as l on l.relation_id=u.id where l.type=3;";
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql);
			rest=presta.executeQuery();
			while(rest.next()){
				int order_id=rest.getInt("id");
				int user_id=rest.getInt("user_id");
				int good_id=rest.getInt("goods_id");
				String phone=rest.getString("phone");	
				float money=rest.getFloat("money");
				int num=rest.getInt("num");
				String user_name=rest.getString("user_name");
				String good_name=rest.getString("good_name");
				String account=rest.getString("account");
				int status = rest.getInt("status");
				String orderNum = rest.getString("order_number");
				orders.add(new Order(order_id,user_id,good_id,status,num,money,user_name,good_name,account,phone,orderNum));
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
		return orders;
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
	public boolean insertOrder(String orderID, int userId, int goodId, int num, float money, String name, String phone,
			String address, int status, String time) {
		boolean flag=false;
		PreparedStatement presta=null;
		Connection conn=null;
		String sql="insert into orders (order_number,user_id,goods_id,num,money,name,phone,address,status,create_time) values('"+orderID+"',"+userId+","+goodId+","+num+","+money+",'"+name+"','"+phone+"','"+address+"',"+status+",'"+time+"')";
		conn=DbResourceManager.getConnection();
		try {
			presta=conn.prepareStatement(sql);
			int connt=presta.executeUpdate();
			if(connt>0){
				flag=true;
			}
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
	public boolean updatePay(String orderID,float money) {
		boolean flag=false;
		PreparedStatement presta=null;
		Connection conn=null;
		String sql="update orders set money="+money+" where order_number='"+orderID+"';";
		 System.out.println("===="+sql);
		conn=DbResourceManager.getConnection();
		try {
			presta=conn.prepareStatement(sql);
			int connt=presta.executeUpdate();
			if(connt>0){
				flag=true;
			}
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
	public List<Order> findUserId(int userId) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Order> orders=new ArrayList<Order>();
		PreparedStatement presta=null;
		ResultSet rest=null;
		ResultSet re=null;
		Connection conn=null;
		String sql="select orders.*,goods.name from orders left join goods on orders.goods_id=goods.id where user_id="+userId;
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql);
			rest=presta.executeQuery();
			while(rest.next()){
				float money=0;
				int status=rest.getInt("status");
				String orderNum=rest.getString("order_number");
				String  createtime=simpleDateFormat.format(new Date(Long.parseLong(String.valueOf(rest.getString("create_time")))));
				String productSQL="select order_group.*,goods.name,goods.price from order_group left join goods on order_group.good_Id=goods.id where order_num='"+rest.getString("order_number")+"'";
			      System.out.println("======+++"+productSQL);
				presta=conn.prepareStatement(productSQL);
				re=presta.executeQuery();
				List<Product> products=new ArrayList<Product>();
				while(re.next()){
					money+=re.getFloat("price");
					products.add(new Product(re.getString("name"), re.getFloat("price"), re.getInt("num")));
				}
				Order order=new Order(money, products, status, orderNum, createtime);
						order.setStatusInfo(status);
						orders.add(order);
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
		return orders;
	}
	@Override
	public boolean insertPdt(int good_id, String orderNum, int num, float price) {
	    Connection conn=null;
	    Statement steme=null;
	    String sql="insert into order_group (good_id,order_num,num,price) values("+good_id+",'"+orderNum+"',"+num+","+price+")";
	    conn=DbResourceManager.getConnection();
	    boolean flag=false;
	    try {
			steme=conn.createStatement();
			int status=steme.executeUpdate(sql);
			if(status>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
				try {
					if (steme!=null) {
					   steme.close();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					if (conn!=null) {
					   conn.close();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
	   
		return flag;
	}

	
}
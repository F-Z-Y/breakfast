package com.fxb.breakfast.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.dao.OrderDao;
import com.fxb.breakfast.model.Order;
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

}

package com.fxb.breakfast.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.dao.ProductDao;
import com.fxb.breakfast.model.Product;
import com.fxb.breakfast.util.DbResourceManager;


public class RecoveryDaoImpl implements ProductDao{

	@Override
	public List<Product> getAll() {
		List<Product> products=new ArrayList<Product>();
		PreparedStatement presta=null;
		ResultSet rest=null;
		Connection conn=null;
		String sql="select g.id,g.name,s.id as seller_id,s.name as seller_name,g.price,g.volume from  goods as g,seller as s where g.seller_id=s.id  and g.status=3; ";
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql);
			rest=presta.executeQuery();
			while(rest.next()){
				int id=rest.getInt("id");
				int sellerId=rest.getInt("seller_id");
				String productName=rest.getString("name");
				float price=rest.getFloat("price");
				int mark=rest.getInt("volume");
				String sellerName=rest.getString("seller_name");
				products.add(new Product(id, productName, price, mark,sellerId,sellerName));
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
		return products;
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
	public List<Product> getIDAll(int shopId) {
		// TODO Auto-generated method stub
		return null;
	}

}

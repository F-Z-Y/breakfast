package com.fxb.breakfast.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.dao.GoodInfoDao;
import com.fxb.breakfast.model.GoodInfo;
import com.fxb.breakfast.util.DbResourceManager;


public class GoodInfoDaoImpl implements GoodInfoDao{

	@Override
	public GoodInfo getInfo(int obj_id) {
		GoodInfo goodInfo = null;
		PreparedStatement presta=null;
		ResultSet rest=null;
		Connection conn=null;
		String sql="select s.name as seller_name,s.id as seller_id,g.* from seller as s,goods as g where g.seller_id=s.id and g.id=? limit 1 ; ";
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql);
			presta.setInt(1, obj_id);
			rest=presta.executeQuery();
			while(rest.next()){
				int id=rest.getInt("id");
				int seller_id=rest.getInt("seller_id");
				String seller_name=rest.getString("seller_name");
				int status=rest.getInt("status");
				int volume=rest.getInt("volume");
				String name=rest.getString("name");
				String photo=rest.getString("photo");
				float price=rest.getFloat("price");
				goodInfo = new GoodInfo(id,seller_id,seller_name,status,volume,name,photo,price);
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
		return goodInfo;
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

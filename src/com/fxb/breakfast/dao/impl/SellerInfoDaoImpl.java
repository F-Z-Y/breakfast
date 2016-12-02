package com.fxb.breakfast.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.dao.SellerInfoDao;
import com.fxb.breakfast.model.SellerInfo;
import com.fxb.breakfast.util.DbResourceManager;


public class SellerInfoDaoImpl implements SellerInfoDao{

	@Override
	public SellerInfo getInfo(int obj_id) {
		SellerInfo sellerInfo = null;
		if(obj_id == 0){
			sellerInfo = new SellerInfo(0,null,null,null,null);
			return sellerInfo;
		}
		PreparedStatement presta=null;
		ResultSet rest=null;
		Connection conn=null;
		String sql="select s.*,l.account,l.status from seller as s,login as l where l.type=2 and l.relation_id=s.id and s.id=? limit 1 ; ";
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql);
			presta.setInt(1, obj_id);
			rest=presta.executeQuery();
			while(rest.next()){
				int id=rest.getInt("id");
				int status=rest.getInt("status");
				String account=rest.getString("account");
				String name=rest.getString("name");
				String phone=rest.getString("phone");
				String introduction=rest.getString("introduction");
				String photo=rest.getString("photo");
				String address=rest.getString("address");
				float money=rest.getFloat("money");
				sellerInfo = new SellerInfo(id, account, name, phone, money,introduction,photo,address,status);
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
		return sellerInfo;
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

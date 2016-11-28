package com.fxb.breakfast.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.dao.SellerDao;
import com.fxb.breakfast.model.Seller;
import com.fxb.breakfast.util.DbResourceManager;


public class RecoverySellerDaoImpl implements SellerDao{

	@Override
	public List<Seller> getAll() {
		List<Seller> sellers=new ArrayList<Seller>();
		PreparedStatement presta=null;
		ResultSet rest=null;
		Connection conn=null;
		String sql="select l.account,u.* from user as u left join login as l on u.id=l.relation_id where l.status=0 and l.type=2; ";
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql);
			rest=presta.executeQuery();
			while(rest.next()){
				int id=rest.getInt("id");
				String account=rest.getString("account");
				String name=rest.getString("name");	
				String phone=rest.getString("phone");	
				float money=rest.getFloat("money");
				sellers.add(new Seller(id,account,name,phone,money));
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
		return sellers;
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

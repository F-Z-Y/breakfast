package com.fxb.breakfast.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.dao.TransactionDao;
import com.fxb.breakfast.model.Transaction;
import com.fxb.breakfast.util.DbResourceManager;


public class TransactionDaoImpl implements TransactionDao{

	@Override
	public List<Transaction> getAll(int type) {
		List<Transaction> transactions=new ArrayList<Transaction>();
		PreparedStatement presta=null;
		ResultSet rest=null;
		Connection conn=null;
		String sql="select t.*,u.name,u.phone,l.account from transaction as t,user as u,login as l where t.relation_id=u.id and u.id=l.relation_id and l.type=3 and t.type=? order by t.update_time desc; ";
		try {
			conn=DbResourceManager.getConnection();
			presta=conn.prepareStatement(sql);
			presta.setInt(1, type);
			rest=presta.executeQuery();
			while(rest.next()){
				int id=rest.getInt("id");
				float money=rest.getFloat("money");
				int status = rest.getInt("status");
				String remarks = rest.getString("remarks");
				String name = rest.getString("name");
				String phone = rest.getString("phone");
				String account = rest.getString("account");
				transactions.add(new Transaction(id, money, status, remarks,name,phone,account));
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
		return transactions;
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

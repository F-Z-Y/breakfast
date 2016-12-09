package com.fxb.breakfast.dao;

import java.util.List;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.model.LogIn;
import com.fxb.breakfast.model.User;

public interface LoginDao {

	public LogIn findAll(String username,String password,int type);
    public boolean findUser(String username);
    public int insertUser(String account,String password,int type,int relation_id);
}

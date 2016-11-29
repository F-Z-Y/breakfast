package com.fxb.breakfast.dao;

import java.util.List;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.model.User;


public interface UserDao{
	/**
	 * 锟斤拷询锟斤拷锟叫的诧拷品
	 */
	public List<User> getAll();
	public User getAll(int id);
	public PageBean findByPage(int page, int size);

	/**
	 * 锟斤拷页锟斤拷锟斤拷业锟斤拷实锟斤拷锟斤拷锟�
	 * @param queryBean 锟斤拷询锟斤拷锟斤拷锟斤拷锟斤拷
	 * @param page 页锟斤拷
	 * @param size 页锟斤拷锟叫�
	 * @return 锟斤拷前页锟斤拷业锟斤拷实锟斤拷锟斤拷锟斤拷锟叫憋拷锟斤拷锟斤拷
	 */
	public PageBean findByPage(QueryBean queryBean, int page, int size);
	
}

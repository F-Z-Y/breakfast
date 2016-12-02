package com.fxb.breakfast.dao;

import java.util.List;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.model.Order;


public interface OrderDao{
	/**
	 * 查询所有的产品
	 */
	public List<Order> getAll();
	public PageBean findByPage(int page, int size);

	/**
	 * 分页查找业务实体对象
	 * @param queryBean 查询条件对象
	 * @param page 页码
	 * @param size 页面大小
	 * @return 当前页的业务实体对象的列表容器
	 */
	public PageBean findByPage(QueryBean queryBean, int page, int size);
	
}

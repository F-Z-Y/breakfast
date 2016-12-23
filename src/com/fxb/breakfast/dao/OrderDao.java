package com.fxb.breakfast.dao;

import java.util.List;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.model.Order;


public interface OrderDao{
	/**
	 * ��ѯ���еĲ�Ʒ
	 */
	public List<Order> getAll();
	public PageBean findByPage(int page, int size);

	/**
	 * ��ҳ����ҵ��ʵ�����
	 * @param queryBean ��ѯ��������
	 * @param page ҳ��
	 * @param size ҳ���С
	 * @return ��ǰҳ��ҵ��ʵ�������б�����
	 */
	public PageBean findByPage(QueryBean queryBean, int page, int size);
	public boolean insertOrder(String orderID,int userId,int goodId,int num,float money,String name,String phone,String address,int status,String time);
    public boolean updatePay(String orderID,float money,int status);
    public List<Order> findUserId(int userId);
    public boolean insertPdt(int good_id,String orderNum,int num ,float price);
    public boolean updateStatus(String orderID,int status);
}

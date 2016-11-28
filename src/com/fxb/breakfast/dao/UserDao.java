package com.fxb.breakfast.dao;

import java.util.List;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.model.User;


public interface UserDao{
	/**
	 * ��ѯ���еĲ�Ʒ
	 */
	public List<User> getAll();
	public PageBean findByPage(int page, int size);

	/**
	 * ��ҳ����ҵ��ʵ�����
	 * @param queryBean ��ѯ��������
	 * @param page ҳ��
	 * @param size ҳ���С
	 * @return ��ǰҳ��ҵ��ʵ�������б�����
	 */
	public PageBean findByPage(QueryBean queryBean, int page, int size);
	
}

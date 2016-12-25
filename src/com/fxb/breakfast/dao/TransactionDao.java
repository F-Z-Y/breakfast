package com.fxb.breakfast.dao;

import java.util.List;

import com.fxb.breakfast.beans.PageBean;
import com.fxb.breakfast.beans.QueryBean;
import com.fxb.breakfast.model.Transaction;


public interface TransactionDao{
	/**
	 * 閿熸枻鎷疯閿熸枻鎷烽敓鍙殑璇ф嫹鍝�
	 */
	public List<Transaction> getAll(int type);
	public PageBean findByPage(int page, int size);

	/**
	 * 閿熸枻鎷烽〉閿熸枻鎷烽敓鏂ゆ嫹涓氶敓鏂ゆ嫹瀹為敓鏂ゆ嫹閿熸枻鎷烽敓锟�
	 * @param queryBean 閿熸枻鎷疯閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷烽敓鏂ゆ嫹
	 * @param page 椤甸敓鏂ゆ嫹
	 * @param size 椤甸敓鏂ゆ嫹閿熷彨锟�
	 * @return 閿熸枻鎷峰墠椤甸敓鏂ゆ嫹涓氶敓鏂ゆ嫹瀹為敓鏂ゆ嫹閿熸枻鎷烽敓鏂ゆ嫹閿熷彨鎲嬫嫹閿熸枻鎷烽敓鏂ゆ嫹
	 */
	public PageBean findByPage(QueryBean queryBean, int page, int size);
	public boolean insert(float money,int type,int status,int relationId,long time);
}

package com.fxb.breakfast.action;

/**
 * Actionִ�н������
 * 
 *
 */
public enum ResultType {
	/**
	 * �ض���
	 */
	Redirect, 
	/**
	 * ת��
	 */
	Forward, 
	/**
	 * �첽����
	 */
	Ajax,
	/**
	 * ������
	 */
	Stream,
	/**
	 * ��ת������һ��������
	 */
	Chain,
	/**
	 * �ض�����һ��������
	 */
	RedirectChain
}

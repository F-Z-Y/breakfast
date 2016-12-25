package com.fxb.breakfast.model;

import java.util.List;

public class Order {
	private int id;
	private int userId;
	private int goodId;
	private int status;
	private int num;
	private float money;
	private List<Product> products;
	private String userName;
	private String goodName;
	private String acconut;
	private String phone;
	private String statusInfo;
	private String orderNum;
	private String createtime;
	public Order(int id, int userId, int goodId, int status,int num,float money,String userName, String goodName, String account,String phone,String orderNum) {
		super();
		this.setId(id);
		this.setUserId(userId);
		this.setGoodId(goodId);
		this.setStatus(status);
		this.setNum(num);
		this.setMoney(money);
		this.setUserName(userName);
		this.setGoodName(goodName);
		this.setAcconut(account);
		this.setStatusInfo(status);
		this.setPhone(phone);
		this.setOrderNum(orderNum);
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public int getGoodId() {
		return goodId;
	}


	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public float getMoney() {
		return money;
	}


	public void setMoney(float money) {
		this.money = money;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getGoodName() {
		return goodName;
	}


	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}


	public String getAcconut() {
		return acconut;
	}


	public void setAcconut(String acconut) {
		this.acconut = acconut;
	}


	public String getStatusInfo() {
		return statusInfo;
	}


	public void setStatusInfo(int status) {
		String convert;
		switch (status) {
		case 0:
			convert="待接单";
			break;
		case 1:
			convert="商家已接单";
			break;
		case 2:
			convert="商家已拒绝";
			break;
		case 3:
			convert="订单完成";
			break;
		case 4:
			convert="订单自动关闭";
			break;
		case 5:
			convert="配送中";
			break;
		case 6:
			convert="未支付";
			break;
		default:
			convert="订单有误";
			break;
		}
		this.statusInfo = convert;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getOrderNum() {
		return orderNum;
	}


	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}


	public List<Product> getProducts() {
		return products;
	}


	public void setProducts(List<Product> products) {
		this.products = products;
	}


	public String getCreatetime() {
		return createtime;
	}


	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}


	public void setStatusInfo(String statusInfo) {
		this.statusInfo = statusInfo;
	}


	public Order(float money, List<Product> products, int status, String orderNum, String createtime) {
		super();
		this.money = money;
		this.products = products;
		this.status = status;
		this.orderNum = orderNum;
		this.createtime = createtime;
	}

}

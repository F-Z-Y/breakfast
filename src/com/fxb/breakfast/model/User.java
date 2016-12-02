package com.fxb.breakfast.model;

public class User {
	private int id;
	private String address;
	private String account;
	private String name;
	private String userName;
	private String phone;
	private float money;
	private String headImg;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public User(int id, String account, String name, String userName, String phone,float money) {
		super();
		this.setId(id);
		this.setAccount(account);
		this.setName(name);
		this.setUserName(userName);
		this.setPhone(phone);
		this.setMoney(money);
	}
	
	public User(int id ,String name, String address,String phone) {
		super();
		this.setId(id);
		this.setName(name);
		this.setPhone(phone);
		this.setAddress(address);
	}
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}


}

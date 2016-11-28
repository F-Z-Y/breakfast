package com.fxb.breakfast.model;

public class User {
	private int id;
	
	private String account;
	private String name;
	private String userName;
	private String phone;
	private float money;
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

}
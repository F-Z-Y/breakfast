package com.fxb.breakfast.model;

public class Seller {
	private int id;
	
	private String name;
	private String account;
	private String phone;
	private float money;

	public Seller(int id,String account,String name,String phone,float money) {
		super();
		this.setId(id);
		this.setAccount(account);
		this.setName(name);
		this.setPhone(phone);
		this.setMoney(money);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}

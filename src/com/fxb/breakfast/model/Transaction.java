package com.fxb.breakfast.model;

public class Transaction {
	private int id;
	
	private float money;
	private int status;
	private String remarks;
	private String statusInfo;
	private String name;
	private String phone;
	private String account;

	public Transaction(int id ,Float money, int status,String remarks,String name,String phone,String account) {
		super();
		this.setId(id);
		this.setMoney(money);
		this.setStatus(status);
		this.setStatusInfo(status);
		this.setRemarks(remarks);
		this.setName(name);
		this.setPhone(phone);
		this.setAccount(account);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getStatusInfo() {
		return statusInfo;
	}

	public void setStatusInfo(int statusInfo) {
		String convert = "待处理";
		if(status==1){
			convert = "已处理";
		}
		this.statusInfo = convert;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
}

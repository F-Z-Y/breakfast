package com.fxb.breakfast.model;

public class SellerInfo {
	private int id;
	private int sellerStatus;
	private String status;
	
	private String name;
	private String account;
	private String phone;
	private String introduction;
	private String photo;
	private String address;
	private float money;

	public SellerInfo(int id,String account,String name,String phone,float money,String introduction,String photo,String address,int status) {
		super();
		this.setId(id);
		this.setAccount(account);
		this.setName(name);
		this.setPhone(phone);
		this.setMoney(money);
		this.setAddress(address);
		this.setIntroduction(introduction);
		this.setPhoto(photo);
		this.setStatus(status);
		this.setSellerStatus(status);
	}
	
	public SellerInfo(int id,String name,String phone,String introduction,String address) {
		super();
		this.setId(id);
		this.setName(name);
		this.setPhone(phone);
		this.setAddress(address);
		this.setIntroduction(introduction);
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

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(int status) {
		String convert = "正常";
		if(status==1){
			convert = "歇业整顿";
		}
		this.status = convert;
	}

	public int getSellerStatus() {
		return sellerStatus;
	}

	public void setSellerStatus(int sellerStatus) {
		this.sellerStatus = sellerStatus;
	}

}

package com.fxb.breakfast.model;

public class Product {
	private int id;
	private int sellerId;
	private int count;
	private String productName;
	private String sellerName;
	private float pice;
	private int mark;
	private int num;
	private String time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public float getPice() {
		return pice;
	}
	public void setPice(float pice) {
		this.pice = pice;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}


	public Product(int id, String name, float pice, int mark,int sellerId,String sellerName) {
		super();
		this.id = id;
		this.sellerId = sellerId;
		this.productName = name;
		this.sellerName = sellerName;
		this.pice = pice;
		this.mark = mark;
	}
	public int getNum() {
		return num;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Product(String productName, float pice, int num) {
		super();
		this.productName = productName;
		this.pice = pice;
		this.num = num;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

}

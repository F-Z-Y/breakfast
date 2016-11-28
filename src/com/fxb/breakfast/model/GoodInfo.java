package com.fxb.breakfast.model;

public class GoodInfo {
	
	private int id;
	private int seller_id;
	private String seller_name;
	private int status;
	private String status_info;
	private int volume;
	private String name;
	private String photo;
	private float price;

	public GoodInfo(int id,int seller_id,String seller_name,int status,int volume,String name,String photo,float price) {
		super();
		this.setId(id);
		this.setSeller_id(seller_id);
		this.setSeller_name(seller_name);
		this.setStatus(status);
		this.setStatus_info(status);
		this.setVolume(volume);
		this.setName(name);
		this.setPhoto(photo);
		this.setPrice(price);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}

	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getStatus_info() {
		return status_info;
	}

	public void setStatus_info(int status_info) {
		String convert = "正常";
		if(status_info==1){
			convert = "商户已下架";
		}else if (status_info==2) {
			convert = "商户已删除";
		}else if(status_info == 3){
			convert = "管理员已下架";
		}
		this.status_info = convert;
	}

}

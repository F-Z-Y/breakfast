package com.fxb.breakfast.model;

public class LogIn {
  private int id;
  private String account;
public LogIn(int id, String account) {
	super();
	this.id = id;
	this.account = account;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getAccount() {
	return account;
}
public void setAccount(String account) {
	this.account = account;
}
  
}

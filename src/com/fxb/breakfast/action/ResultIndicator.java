package com.fxb.breakfast.action;

/**
 * 指示用户操作是否执行成功的指示器
 * @author 骆昊
 *
 */
public class ResultIndicator {
	
	public int code;
	public String msg;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}

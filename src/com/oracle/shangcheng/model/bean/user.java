package com.oracle.shangcheng.model.bean;

public class user {
	private int user_id;
	private String user_name;
	private String password;
	private String address;
	private String phone;
	private String touxiang;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public user(int user_id) {
		super();
		this.user_id = user_id;
	}
	
	public String gettouxiang() {
		return touxiang;
	}
	public void settouxiang(String touxiang) {
		this.touxiang = touxiang;
	}
	@Override
	public String toString() {
		return "user [user_id=" + user_id + ", user_name=" + user_name + ", password=" + password + ", address="
				+ address + ", phone=" + phone + ", touxiang=" + touxiang + "]";
	}
	public user(int user_id, String user_name, String password, String address, String phone, String touxiang) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.password = password;
		this.address = address;
		this.phone = phone;
		this.touxiang = touxiang;
	}
	public user() {
		super();
	}
	
	
}

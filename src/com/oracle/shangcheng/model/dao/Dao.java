package com.oracle.shangcheng.model.dao;

public interface Dao {
	public String  dirverClass="com.mysql.jdbc.Driver";
	public String  url="jdbc:mysql://localhost:3306/market?useSSL=false";
	public String username="root";
	public String password="123456";
	
	//Ìí¼Ó
	public boolean add(Object o);
	
	public boolean  delete(Object id);
	
	public boolean update(Object  o);
	
	public Object    list();

}

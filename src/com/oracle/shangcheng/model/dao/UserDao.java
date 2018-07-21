package com.oracle.shangcheng.model.dao;

import com.oracle.shangcheng.model.bean.user;

public interface UserDao extends Dao {
//登陆方法
	public user login(String name,String password);
	//注册方法	
	public boolean register(String username,String password,String address,String phone) ;
	//检测用户名是否存在
	public boolean checkName(String username);
	//根据id查询用户
	public user getUserInfoByUserId(int id);
}
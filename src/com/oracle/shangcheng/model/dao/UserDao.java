package com.oracle.shangcheng.model.dao;

import com.oracle.shangcheng.model.bean.user;

public interface UserDao extends Dao {
//��½����
	public user login(String name,String password);
	//ע�᷽��	
	public boolean register(String username,String password,String address,String phone) ;
	//����û����Ƿ����
	public boolean checkName(String username);
	//����id��ѯ�û�
	public user getUserInfoByUserId(int id);
}
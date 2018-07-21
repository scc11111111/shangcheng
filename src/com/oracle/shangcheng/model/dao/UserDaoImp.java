package com.oracle.shangcheng.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.oracle.shangcheng.model.bean.user;


public class UserDaoImp extends DaoImp implements UserDao {

	@Override
	public user login(String name,String password) {
		
		ResultSet rs=null;
		if(!name.equals("")&&!password.equals("")) {
			user u=null;
			try {
				rs=getSta().executeQuery("select *  from  user where user_name= '"+name+"' and password= '"+password+"'");
				while(rs.next()) {
					u=new user();
					u.setUser_id(rs.getInt("user_id"));
					u.setUser_name(rs.getString("user_name"));
					u.setPassword(rs.getString("password"));
					u.setAddress(rs.getString("address"));
					u.setPhone(rs.getString("phone"));
					u.settouxiang(rs.getString("touxiang"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
			disposeResource(getSta(), rs, getCon());
			return u;
		}
		else {
			return null;
		}
	
		
	}
	public boolean register(String username,String password,String address,String phone) {
		String sql="insert into user(user_name,password,address,phone) value('"+username+"','"+password+"','"+address+"','"+phone+"')";
		try {
			int i=getSta().executeUpdate(sql);
			if(i>0) {
				return true;
			}
			else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean checkName(String username) {
		ResultSet rs=null;
		String sql="select user_name from user where user_name='"+username+"'";
		System.out.println(sql);
		try {
			rs=getSta().executeQuery(sql);
			if(rs.next()) {
				return true;
			}
			else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public user getUserInfoByUserId(int id) {
		
		ResultSet rs=null;
		
			user u=null;
			try {
				rs=getSta().executeQuery("select *  from  user where user_id="+id);
				while(rs.next()) {
					u=new user();
					u.setUser_id(rs.getInt("user_id"));
					u.setUser_name(rs.getString("user_name"));
					u.setPassword(rs.getString("password"));
					u.setAddress(rs.getString("address"));
					u.setPhone(rs.getString("phone"));
					u.settouxiang(rs.getString("touxiang"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
			disposeResource(getSta(), rs, getCon());
			return u;
	
	
	}
	//修改时没有修改头像
	public user update_1(user user) {
		
		int count=0;
		String sql=null;
		sql="update user set user_name='"+user.getUser_name()+"', address='"+user.getAddress()+"', phone='"+user.getPhone()+"' where user_id="+user.getUser_id();
		try {
			count=getSta().executeUpdate(sql);
			if(count>0) {
				user uu=getUserInfoByUserId(user.getUser_id());
				return uu;
			}
			else {
				return null;
			}
		} catch (SQLException e) {
			return null;
		}
	}
	//修改头像
	public boolean update(user user) {
		
		int count=0;
		String sql=null;
		
		sql="update user set user_name='"+user.getUser_name()+"', address='"+user.getAddress()+"', phone='"+user.getPhone()+"', touxiang='"+user.gettouxiang()+"' where user_id="+user.getUser_id();
	
		
		try {
			count=getSta().executeUpdate(sql);
			if(count>0) {
				return true;
			}
			else
				return false;
		} catch (SQLException e) {
			return false;
		}
	}
	
	
	
	
	@Override
	public boolean add(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Object id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object list() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean update(Object o) {
		// TODO Auto-generated method stub
		return false;
	}



}

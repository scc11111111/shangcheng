package com.oracle.shangcheng.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.oracle.shangcheng.model.bean.wine;

public class WineDaoImp extends DaoImp implements WineDao {
	//根据id查询酒
	public wine selectById(int id){
		wine wi=new wine();
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery("select *  from  wine where wine_id="+id);
			while(rs.next()) {
				wi.setWine_id(rs.getInt("wine_id"));
				wi.setWine_name(rs.getString("wine_name"));
				wi.setKind(rs.getString("kind"));
				wi.setPrice(rs.getFloat("price"));
				wi.setDetail(rs.getString("detail"));
				wi.setPath(rs.getString("path"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return  wi;
	}
	//查询所有的酒
	public ArrayList<wine> selectAlljiu(int page, int count){
		ArrayList<wine> wines=new ArrayList<wine>();
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery("select *  from  wine limit "+(page-1)*count+" , "+count);
			while(rs.next()) {
				wine w=new wine();
				w.setWine_id(rs.getInt("wine_id"));
				w.setWine_name(rs.getString("wine_name"));
				w.setKind(rs.getString("kind"));
				w.setPrice(rs.getFloat("price"));
				w.setDetail(rs.getString("detail"));
				w.setPath(rs.getString("path"));
				wines.add(w);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return  wines;
		
	}
	//查詢一共有多少酒（數量）
	public int getAllCountOfwines() {
		int  n=0;
		ResultSet  rs=null;
		try {
			  rs=getSta().executeQuery("select count(wine_id)  from  wine");
			  rs.next();
			  n=rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	//查询首页显示的9个酒；
	public ArrayList<wine> selectNinewine(String kind,int x){
		ArrayList<wine> wines=new ArrayList<wine>();
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery("select *  from  wine where kind='"+kind+"' order by  wine_id desc  limit "+x);
			while(rs.next()) {
				wine w=new wine();
				w.setWine_id(rs.getInt("wine_id"));
				w.setWine_name(rs.getString("wine_name"));
				w.setKind(rs.getString("kind"));
				w.setPrice(rs.getFloat("price"));
				w.setDetail(rs.getString("detail"));
				w.setPath(rs.getString("path"));
				wines.add(w);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return  wines;
		
	}
	//根据kind查看所有酒类
	public  ArrayList<wine> queryAlljiu(String kind){
		ArrayList<wine> wines=new ArrayList<wine>();
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery("select *  from  wine where kind='"+kind+"' order by  wine_id desc ");
			while(rs.next()) {
				wine w=new wine();
				w.setWine_id(rs.getInt("wine_id"));
				w.setWine_name(rs.getString("wine_name"));
				w.setKind(rs.getString("kind"));
				w.setPrice(rs.getFloat("price"));
				w.setDetail(rs.getString("detail"));
				w.setPath(rs.getString("path"));
				wines.add(w);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return  wines;
		
	}
	//根据类别查询促销的酒
	public ArrayList<wine> cuxiao(String kind,int x) {
		ArrayList<wine> wines=new ArrayList<wine>();
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery("select *  from  wine where  kind= '"+kind+"'"+" and tuisong="+1+" order by  wine_id desc limit "+x);
			while(rs.next()) {
				wine w=new wine();
				w.setWine_id(rs.getInt("wine_id"));
				w.setWine_name(rs.getString("wine_name"));
				w.setKind(rs.getString("kind"));
				w.setPrice(rs.getFloat("price"));
				w.setDetail(rs.getString("detail"));
				w.setPath(rs.getString("path"));
				wines.add(w);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return  wines;
	}
	//查询大图推送的酒
	public ArrayList<wine> tuiAlljiu(int x) {
		ArrayList<wine> wines=new ArrayList<wine>();
		ResultSet rs=null;
		try {
			rs=getSta().executeQuery("select *  from  wine where tuisong="+1+" order by  wine_id desc limit "+x);
			while(rs.next()) {
				wine w=new wine();
				w.setWine_id(rs.getInt("wine_id"));
				w.setWine_name(rs.getString("wine_name"));
				w.setKind(rs.getString("kind"));
				w.setPrice(rs.getFloat("price"));
				w.setDetail(rs.getString("detail"));
				w.setPath(rs.getString("path"));
				wines.add(w);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return  wines;
	}
	//按条件搜索
	public ArrayList<wine> sousuo(String kind,String min,String max){
		String SQL="select *  from  wine  where  1=1";
		if(kind!=null&&!kind.equals("")) {
			SQL+="   and  kind='" +kind+"'";
		}
		if(min!=null&&!min.equals("")) {
			SQL+="   and  price>="+min;
		}
		if(max!=null&&!max.equals("")) {
			SQL+="   and  price<="+max;
		}
		
		
		System.out.println(SQL);
		
		ArrayList<wine>  wines=new  ArrayList<wine>();
		ResultSet rs=null;
	try {
		rs=getSta().executeQuery(SQL);
		while(rs.next())
		{
			wine  w=new wine();
			w.setWine_id(rs.getInt("wine_id"));
			w.setWine_name(rs.getString("wine_name"));
			w.setKind(rs.getString("kind"));
			w.setPrice(rs.getFloat("price"));
			w.setDetail(rs.getString("detail"));
			w.setPath(rs.getString("path"));
			w.setTuisong(rs.getInt("tuisong"));
			wines.add(w);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	disposeResource(getSta(), rs, getCon());
		return  wines;
	}
	
	
	public WineDaoImp() {
		super();
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
	public boolean update(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object list() {
		// TODO Auto-generated method stub
		return null;
	}
	


}

package com.oracle.shangcheng.model.dao;

import java.util.ArrayList;

import com.oracle.shangcheng.model.bean.wine;

public interface WineDao extends Dao {
	//根据id查询酒
	public wine selectById(int id);
	//查询所有的酒
	public ArrayList<wine> selectAlljiu(int page, int count);
	//查询所有白酒；
	public ArrayList<wine> selectNinewine(String kind,int x);
	//根据类别查询酒
	public  ArrayList<wine> queryAlljiu(String kind);
	//查询推送的酒
	public 	ArrayList<wine> tuiAlljiu(int x);
	//根据条件查询酒
	public ArrayList<wine> sousuo(String kind,String min,String max);
	//根据类别查询促销的酒
	public ArrayList<wine> cuxiao(String kind,int x);
}

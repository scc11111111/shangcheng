package com.oracle.shangcheng.model.dao;

import java.util.ArrayList;

import com.oracle.shangcheng.model.bean.wine;

public interface WineDao extends Dao {
	//����id��ѯ��
	public wine selectById(int id);
	//��ѯ���еľ�
	public ArrayList<wine> selectAlljiu(int page, int count);
	//��ѯ���а׾ƣ�
	public ArrayList<wine> selectNinewine(String kind,int x);
	//��������ѯ��
	public  ArrayList<wine> queryAlljiu(String kind);
	//��ѯ���͵ľ�
	public 	ArrayList<wine> tuiAlljiu(int x);
	//����������ѯ��
	public ArrayList<wine> sousuo(String kind,String min,String max);
	//��������ѯ�����ľ�
	public ArrayList<wine> cuxiao(String kind,int x);
}

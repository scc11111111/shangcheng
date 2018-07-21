package com.oracle.shangcheng.model.dao;

import com.oracle.shangcheng.control.UserServlet;
import com.oracle.shangcheng.model.bean.user;

public class test {
	public static String  dirverClass="com.mysql.jdbc.Driver";
	public static String  url="jdbc:mysql://localhost:3306/market?useSSL=false";
	public static String username="root";
	public static String password="123456";
public static void main(String[] args) {
//	ArrayList<wine> wines=new ArrayList<wine>();
//	try {
//		Class.forName(dirverClass);
//		Connection con=DriverManager.getConnection(url, username, password);
//		Statement sta=con.createStatement();
//		ResultSet rs=sta.executeQuery("select *  from wine order by  wine_id limit "+9);
//		
//		while(rs.next()) {
//			wine w=new wine();
//			w.setWine_id(rs.getInt("wine_id"));
//			w.setWine_name(rs.getString("wine_name"));
//			w.setKind(rs.getString("kind"));
//			w.setPrice(rs.getFloat("price"));
//			w.setDetail(rs.getString("detail"));
//			w.setPath(rs.getString("path"));
//			wines.add(w);
//		}
//	} catch (ClassNotFoundException | SQLException e) {
//		e.printStackTrace();
//	}
//	
//	for(wine a:wines) {
//		System.out.println(a.toString());
//	}
	
//	WineDaoImp wd=new WineDaoImp();
//	ArrayList<wine> wines_1=wd.sousuo("°×¾Æ", "52", "300");
//	for(wine ww:wines_1) {
//		System.out.println(ww.toString());
//	}
//
//System.out.println(	"select *  from  user where user_name= '"+username+"' and password= '"+password+"'");
//	 WineDaoImp wd=new WineDaoImp(); 
//	 ArrayList<wine> tuis=wd.tuiAlljiu(5);
//	System.out.println("select *  from  wine where  kind= '"+"°×¾Æ"+"'"+" and tuisong="+1+" order by  wine_id desc limit "+5);
//	WineDaoImp wd=new WineDaoImp();
//	 ArrayList<wine> baijiu5=wd.sousuo("", "20","60");
//	for(wine w:baijiu5) {
//		System.out.println(w.toString());
//	}
    UserDaoImp u=new UserDaoImp();
//    user user=u.login("u1", "123456789");
//    System.out.println(user);
//    boolean b=u.register("dsa", "123", "dsadasdsadadsa", "12345678977");
//    System.out.println(b);
//    user user=u.login("u1", "123456789");
//    System.out.println(user);
    user user=u.getUserInfoByUserId(1);
    System.out.println(user);
}
}

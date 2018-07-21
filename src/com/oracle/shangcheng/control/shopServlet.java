package com.oracle.shangcheng.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.shangcheng.model.bean.wine;
import com.oracle.shangcheng.model.dao.WineDaoImp;

/**
 * Servlet implementation class shopServlet
 */
@WebServlet("/shopServlet")
public class shopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WineDaoImp wd;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shopServlet() {
    	wd=new WineDaoImp();
    }
	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wine_id=request.getParameter("wine_id_d");//获取前端页面点击'加入收藏'按钮时传过来的商品ID
		//根据id查询酒并将其存入map中 并用session封装
		if(request.getSession().getAttribute("collects")==null) {
			System.out.println(request.getSession().getAttribute("collects")==null);
			//判断之前是否有购物车
			HashMap<wine, Integer> collects=new HashMap<>();
			wine w=	wd.selectById(Integer.parseInt(wine_id));
			collects.put(w, 1);
			request.getSession().setAttribute("collects", collects);
			System.out.println(request.getSession().getAttribute("collects"));
		}
		else {
			HashMap<wine, Integer> collects=(HashMap<wine, Integer>)request.getSession().getAttribute("collects");
			if(collects.containsKey(wd.selectById(Integer.parseInt(wine_id)))) {
				int nowcount=collects.get(wd.selectById(Integer.parseInt(wine_id)))+1;
				collects.put(wd.selectById(Integer.parseInt(wine_id)), nowcount);
			}
			else {
				collects.put(wd.selectById(Integer.parseInt(wine_id)), 1);
			}
			//3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
			request.getSession().setAttribute("collects", collects);
			//4.为了提升用户体验度，我们除了讲用户购物车的数据放入session，同时再存入cookie，方便用户关闭页面时再打开能看到之前的购物车商品
			for(wine w:collects.keySet()) {
				System.out.println(w);
				System.out.println(collects.get(w));
			}
			for(wine w:collects.keySet()) {
				Cookie  r=new Cookie("wine"+w.getWine_id(), w.getWine_id()+"#"+collects.get(w));
				r.setMaxAge(1000*60*60*24*15);
				response.addCookie(r);
			}
		}
		response.sendRedirect("ddtj.jsp");//当数据添加到购物车之后，直接跳转到购物车页面，让用户看一下购物车的信息
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		switch (method) {
		case "add":
		{	
			add(request, response);
			break;
		}

		default:
			break;
		}
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

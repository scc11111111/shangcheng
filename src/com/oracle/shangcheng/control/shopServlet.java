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
		String wine_id=request.getParameter("wine_id_d");//��ȡǰ��ҳ����'�����ղ�'��ťʱ����������ƷID
		//����id��ѯ�Ʋ��������map�� ����session��װ
		if(request.getSession().getAttribute("collects")==null) {
			System.out.println(request.getSession().getAttribute("collects")==null);
			//�ж�֮ǰ�Ƿ��й��ﳵ
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
			//3.Ϊ�˱�֤���ﳵ�ܹ��ڶ�β�������Ȼ�ܶ�ȡ��������ݣ�������Ҫ��session���洢���ﳵ������
			request.getSession().setAttribute("collects", collects);
			//4.Ϊ�������û�����ȣ����ǳ��˽��û����ﳵ�����ݷ���session��ͬʱ�ٴ���cookie�������û��ر�ҳ��ʱ�ٴ��ܿ���֮ǰ�Ĺ��ﳵ��Ʒ
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
		response.sendRedirect("ddtj.jsp");//��������ӵ����ﳵ֮��ֱ����ת�����ﳵҳ�棬���û���һ�¹��ﳵ����Ϣ
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

package com.oracle.shangcheng.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.shangcheng.model.bean.PageBean;
import com.oracle.shangcheng.model.bean.wine;
import com.oracle.shangcheng.model.dao.WineDaoImp;

/**
 * Servlet implementation class wineServlet
 */
@WebServlet("/wineServlet")
public class wineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private WineDaoImp wd;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wineServlet() {
    	wd=new WineDaoImp();
    }
    protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 response.setContentType("text/html;charset=utf-8");	
    	wd=new WineDaoImp();
		 ArrayList<wine> tuis=wd.tuiAlljiu(5);
		 
		 ArrayList<wine> baijiu5=wd.cuxiao("白酒", 5);
		 ArrayList<wine> huangjiu5=wd.cuxiao("黄酒", 5);
		 ArrayList<wine> putaojiu5=wd.cuxiao("葡萄酒", 5);
		 ArrayList<wine> yangjiu5=wd.cuxiao("洋酒", 5);
		 
		 ArrayList<wine> baijiu9=wd.selectNinewine("白酒", 9);
		 ArrayList<wine> huangjiu9=wd.selectNinewine("黄酒", 9);
		 ArrayList<wine> putaojiu9=wd.selectNinewine("葡萄酒", 9);
		 ArrayList<wine> yangjiu9=wd.selectNinewine("洋酒", 9);
	     
	     request.setAttribute("tuis", tuis);
	     
	     request.setAttribute("baijiu5", baijiu5);
	     request.setAttribute("huangjiu5", huangjiu5);
	     request.setAttribute("putaojiu5", putaojiu5);
	     request.setAttribute("yangjiu5", yangjiu5);
	     
	     request.setAttribute("baijiu9", baijiu9);
	     request.setAttribute("huangjiu9", huangjiu9);
	     request.setAttribute("putaojiu9", putaojiu9);
	     request.setAttribute("yangjiu9", yangjiu9);
	     request.getRequestDispatcher("index.jsp").forward(request, response);
	}
//    protected void selectAlljiu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	ArrayList<wine> allwines=wd.selectAlljiu();
//    	request.setAttribute("allwines", allwines);
//    	request.getRequestDispatcher("tplist.jsp").forward(request, response);
//    }
    protected void listByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String  page=request.getParameter("page");
		String count=request.getParameter("count");
		System.out.println(page+count);
		ArrayList<wine> wines=wd.selectAlljiu(Integer.parseInt(page),Integer.parseInt(count));
		//ͨ�����㽫��ҳ������Ҫ�õ�������ȫ�������
		int nowPage=Integer.parseInt(page);//��ǰҳ
		int allCount=wd.getAllCountOfwines();//��Ϊ��ҳ��ҳ����Ҫ֪�����ҳ�����ԣ�����Ҫ����dao�в�ѯ���������ķ��������wine�ж�����
		int pageOfCount=Integer.parseInt(count);//ÿҳ��ʾ����
		int allPages=(allCount%pageOfCount==0)?allCount/pageOfCount:(allCount/pageOfCount+1);//����ҳ��
		int perviousPage=nowPage<=1?1:(nowPage-1);//��ҳ
		int nextPage=nowPage>=allPages?allPages:(nowPage+1);//��ҳ
		//��װΪpagebean
		PageBean  pageBean=new PageBean();
		pageBean.setNowPage(nowPage);
		pageBean.setPreviousPage(perviousPage);
		pageBean.setNextPage(nextPage);
		pageBean.setAllCount(allCount);
		pageBean.setAllPages(allPages);
		pageBean.setEverPageCount(pageOfCount);
		
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("wines", wines);
		request.getRequestDispatcher("tplist.jsp").forward(request, response);
    }
    
    protected void sousuo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 response.setContentType("text/html;charset=utf-8");//�����ַ���
    	//��ȡ�������е�����
    	String  kind=request.getParameter("kind");//Ʒ��
    	kind=new String(kind.getBytes("iso-8859-1"),"UTF-8");
    	String  min=request.getParameter("minprice");//��ͼ�
    	String max=request.getParameter("maxprice");//��߼�
    	ArrayList<wine> sswines=wd.sousuo(kind, min, max);
    	request.setAttribute("sswines", sswines);
    	//������ͨ��request������һ��ҳ��
    	request.getRequestDispatcher("sousuo.jsp").forward(request, response);
    	
    	
    }	
    protected void xiangqing(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   	 response.setContentType("text/html;charset=utf-8");//�����ַ���
   	//��ȡ�������е�����
   	 WineDaoImp w=new WineDaoImp();
   	 wine wi=w.selectById(Integer.parseInt(request.getParameter("wine_id")));
   	 request.setAttribute("xyjiu", wi);
   	 request.getRequestDispatcher("cpxq.jsp").forward(request, response);
   	
   }	
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String methodname=request.getParameter("method");
		
		switch (methodname) {
		case "index":
			index(request, response);
			break;

		case "listByPage":
			listByPage(request,response);
			break;
		case "sousuo":{
			sousuo(request,response);
			break;
		}
		case "xiangqing":
			xiangqing(request,response);
			break;
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

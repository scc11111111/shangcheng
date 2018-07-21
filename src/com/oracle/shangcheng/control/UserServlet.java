package com.oracle.shangcheng.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.oracle.shangcheng.model.bean.user;
import com.oracle.shangcheng.model.dao.UserDaoImp;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDaoImp u;
    private  ServletConfig  config;
	@Override
	public void init(ServletConfig config) throws ServletException {
		this.config=config;
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
    	u=new UserDaoImp();
    }
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");//�����ַ���
		String id=request.getParameter("name");
		String password=request.getParameter("password");
		String yanzhengma=request.getParameter("code").toUpperCase();
		String yzm=request.getSession().getAttribute("generateCode").toString().toUpperCase();
		user user=u.login(id, password);
		System.out.println(user);
		if(!yanzhengma.equals(yzm)) {
			request.setAttribute("error", "��֤�����");
			request.getRequestDispatcher("denglu.jsp").forward(request, response);
		}
		else if(user!=null){
			request.setAttribute("cg", "cg");
			String  jilu=	request.getParameter("jilu");
			Cookie   usernameCookie=new Cookie("username", id);
			Cookie   passwordCookie=new Cookie("password", password);
			if(jilu!=null) {//˵���û���ѡ�ˣ������û����������ѡ��
				usernameCookie.setMaxAge(1000*60*60*24*3);
//				usernameCookie.setDomain("www.ershouche.com");
				passwordCookie.setMaxAge(1000*60*60*24*3);
//				passwordCookie.setDomain("www.ershouche.com");
			}else {
				usernameCookie.setMaxAge(0);
//				usernameCookie.setDomain("www.ershouche.com");
				passwordCookie.setMaxAge(0);
//				passwordCookie.setDomain("www.ershouche.com");
				
			}
			response.addCookie(usernameCookie);
			response.addCookie(passwordCookie);
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else {
			request.setAttribute("error", "��������û�����������������������");
			request.getRequestDispatcher("denglu.jsp").forward(request, response);
		}
	
	}
	
	protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String test=request.getParameter("test");
		String address=request.getParameter("address");
		String phone=request.getParameter("phone");
		if(test.equals(password)) {
			boolean b=u.register(username, password, address, phone);
			request.setAttribute("zhuce", b);
			request.getRequestDispatcher("zhuce.jsp").forward(request, response);
		}
		else {
			request.setAttribute("mess", "������������벻ͬ����ȷ�Ϻ�������");
			request.getRequestDispatcher("zhuce.jsp").forward(request, response);
		}
		
		
		
	}
	protected void checkName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkname=request.getParameter("checkname");
		
		System.out.println(checkname);
		boolean flag=u.checkName(checkname);
		//��response����Ӧ�������е������������õĽ�������ajax�������
		response.setContentType("text/html;charset=UTF-8");//  text/html     ,text/xml    ,text/json
		PrintWriter out=response.getWriter();
		out.write(flag+"");
		out.flush();
		out.close();
		
	}
	protected void loadProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid=request.getParameter("userid");
		user user=u.getUserInfoByUserId(Integer.parseInt(userid));
		request.setAttribute("gerenxinxi", user);
		request.getRequestDispatcher("person.jsp").forward(request, response);
	}
	//�޸ĸ�����Ϣ
	protected void updateUserInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean flag=false;//
		//��smartUpload����ȡ���ϴ����ļ��ͱ��е�����
		SmartUpload su = new SmartUpload();//����һ��smartUpload�ϴ�����Ķ���
		// �ϴ���ʼ��
		su.initialize(config,request,response);//,��ȡrequest��response�е����ݵ�smartupload�����
		try {
			su.upload();//��������ύ�����ݶ�ȡ��upload�����
			su.save("/images");
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		
		Request  re=su.getRequest();//���Ҫ��ȡ���е��ı����ݣ�����Ҫʹ�õ�smartUplod�����request
		String upname=re.getParameter("upname");
		String upaddress=re.getParameter("upaddress");
		String upphone=re.getParameter("upphone");
		String id=re.getParameter("upid");
		/**
		 * ����ȡ�������ݷ�װ��һ��user����
		 */
		user user=new user();
		user.setUser_id(Integer.parseInt(id));
		user.setUser_name(upname);
		user.setAddress(upaddress);
		user.setPhone(upphone);
		
		
		File  uploadFile=su.getFiles().getFile(0);//��smartupload����ж�ȡ��ҳ���ϴ��Ķ���ļ�����
		System.out.println(uploadFile.getSize());
		if(uploadFile.getSize()!=0)
		{
			flag=true;
			try {
		//	UUID //javaUUID ,�㷨������ͬһ�ռ�ͬһʱ���¾����ظ����ַ��� 36 
			String  uuidName=UUID.randomUUID().toString();
			java.io.File    destFile=new java.io.File(request.getRealPath("/images/uploadFiles/"));
			String childPath="";
			for(int n=0;n<uuidName.length();n++)
			{
				childPath+=uuidName.charAt(n)+"/";
			}
			java.io.File  f=new java.io.File(destFile,childPath);
			f.mkdirs();
			java.io.File  file=new java.io.File(f,uuidName+"."+uploadFile.getFileExt());
			
			uploadFile.saveAs(file.getAbsolutePath());
			System.out.println(file.getAbsolutePath());
			String  urlPath=file.getAbsolutePath().substring(file.getAbsolutePath().indexOf("images"),file.getAbsolutePath().length());
			//���ݿ���� \ ��ʧ������ת��
			urlPath=urlPath.replace("\\", "\\\\");
			System.out.println(urlPath);
			user.settouxiang(urlPath);//�����ϴ���ͼƬ��·�����õ�user�����У�����dao�����޸��µ�ͷ���ַ
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
			boolean result=u.update(user);
			if(result) {
				System.out.println(user);
			request.setAttribute("upuser", user);
			request.getRequestDispatcher("person.jsp").forward(request, response);
			}
			else {
				request.setAttribute("error_x", "�޸�ʧ��");
				request.getRequestDispatcher("person.jsp").forward(request, response);
			}
		}
		else {
			user user_1=u.update_1(user);
			if(user_1!=null) {
				System.out.println(user_1);
			request.setAttribute("upuser", user_1);
			request.getRequestDispatcher("person.jsp").forward(request, response);
			}
			else {
				request.setAttribute("error_x", "�޸�ʧ��");
				request.getRequestDispatcher("person.jsp").forward(request, response);
			}
		}
	}
		
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String methodname=request.getParameter("method");
		request.setCharacterEncoding("UTF-8");
		switch (methodname) {
		case "login":
			login(request, response);
			break;
		case "register":
			register(request, response);
			break;
		case "checkName":
			checkName(request, response);
			break;
		case "loadProfile":
			loadProfile(request, response);
			break;
		case "updateUserInfo":
			updateUserInfo(request, response);
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

<%@page import="com.oracle.shangcheng.model.dao.UserDaoImp"%>
<%@page import="com.oracle.shangcheng.model.bean.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	user u=(user)session.getAttribute("user");
    	String touxiang=null;
    %>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="top">

<div class="top1">
<div class="top1_main">
<span class="dl">您好，欢迎光临本亲生活网！
<% 
	if(u!=null)
	{
		out.print(u.getUser_name());
		//转义 \ (\ 在高版本的tomcat中要符合RFC文档规范)
	/* 	touxiang=u.gettouxiang();
		touxiang=touxiang.replace("\\","_"); */
	}
	else {
%>

<a href="denglu.jsp"> [请登录]</a>  
<a href="zhuce.jsp">[免费注册]</a>
<% }
%>
</span>
<span class="yh_zx"><c:if test="${sessionScope.user !=null }"><a href="UserServlet?method=loadProfile&userid=<%=u.getUser_id()%>"></c:if> 个人中心</a>  |  <a href="#">我的订单</a>  |  <a href="#">帮助中心</a>  |  <a href="#">联系方式</a></span></div>
</div>


<div class="top_logo">

<div class="logo"><a href="index.jsp"><img src="images/logo.jpg" width="338" height="113" / alt="本亲生活的logo标志"></a></div>
<div class="top_you">

<div class="ss_1"><input name="key" type="text" id="key" value="请输入您要搜索的产品" size="30"      
          onclick="if(value==defaultValue){value='';this.style.color='#898b8c'}"    
          onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999; line-height:26px;" / class="ssk1"><input name="" value="搜 索" type="button" / class="button1"></div>
		<table>
		</table>
</div>

</div>

</div>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oracle.shangcheng.model.bean.wine"%>
<%@page import="com.oracle.shangcheng.model.dao.WineDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%--  <% 
		if(request.getAttribute("tuis")==null){
			request.getRequestDispatcher("wineServlet?method=index").forward(request, response);
		}
		System.out.println(request.getAttribute("tuis"));
  %> --%>
  <c:if test="${requestScope.tuis eq null}">
  	<c:redirect url="wineServlet?method=index"></c:redirect>
  </c:if>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亲近大自然的绿色生活网</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

</head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script src="script/global.js" type="text/javascript"></script>
<script src="script/head.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" href="style/base.css" />
<link rel="stylesheet" href="style/head.css" />

<body>

<!--抬头开始-->
<%@include file="top.jsp" %>
<!--抬头结束-->
<!--导航开始-->
<%@include file="daohang.jsp" %>
<!--导航结束-->


<!--banner开始-->



<div class="mainbanner">
	<div class="mainbanner_window">
		<ul id="slideContainer">
		<%-- <%
		 ArrayList<wine> tuis=(ArrayList<wine>)request.getAttribute("tuis");
			for(wine ts:tuis){
			
		%>
			<li><a href="wineServlet?method=xiangqing&wine_id=<%=ts.getWine_id()%>"><img src=<%=ts.getPath() %> width="1920" height="500"  /></a></li>
		<%
		} %> --%>
		<c:forEach var="ts" items="${requestScope.tuis}">
		<li><a href="wineServlet?method=xiangqing&wine_id=${ts.wine_id}"><img src="${ts.path}" width="1920" height="500"  /></a></li>
		</c:forEach>
		</ul>
		
	</div>
	<ul class="mainbanner_list">
		<%-- <%for(int t=1;t<=tuis.size();t++){ %>
			<li><a href="javascript:void(0);"><%=t %></a></li>
		<%} %> --%>
	<c:forEach var="t" begin="1" end="${5}">
	<li><a href="javascript:void(0);">${t}</a></li>
	</c:forEach>
	</ul>
	
</div>

<!--banner结束-->


<!--中部开始-->

<div class="con_sy">

<!--中部1开始-->

<div class="con_sy1">

<!--选项卡切换开始-->

<div class="xxk_sy">

<!--代码开始-->

<script>
<!--
/*第一种形式 第二种形式 更换显示样式*/
function setTab(name,cursel,n){
for(i=1;i<=n;i++){
 var menu=document.getElementById(name+i);
 var con=document.getElementById("con_"+name+"_"+i);
 menu.className=i==cursel?"hover":"";
 con.style.display=i==cursel?"block":"none";
}
}
//-->
</script>
</head>


<div id="Tab1">
<div class="Menubox">
<ul>
 <li id="one1" onmouseover="setTab('one',1,4)" class="hover"> 热卖白酒</li>

 <li id="one2" onmouseover="setTab('one',2,4)" >促销黄酒</li>

 <li id="one3" onmouseover="setTab('one',3,4)">新品葡萄酒</li>
 
 <li id="one4" onmouseover="setTab('one',4,4)"> 精品洋酒</li>

</ul>
</div>


<div class="Contentbox">

<%-- <% 
ArrayList<wine> baijiu5=(ArrayList<wine>)request.getAttribute("baijiu5");
ArrayList<wine> huangjiu5=(ArrayList<wine>)request.getAttribute("huangjiu5");
ArrayList<wine> putaojiu5=(ArrayList<wine>)request.getAttribute("putaojiu5");
ArrayList<wine> yangjiu5=(ArrayList<wine>)request.getAttribute("yangjiu5");
%>  --%>
 
<div id="con_one_1" class="hover">
<%-- <%
	for(wine b:baijiu5){

%> --%>
<c:forEach var="b" items="${requestScope.baijiu5 }">
<div class="remai1">
<div class="remai1_1"><a href="wineServlet?method=xiangqing&wine_id=${b.wine_id }"><img src="${b.path }" width="164" height="181" /></a></div>
<div class="renai1_2"><a href="wineServlet?method=xiangqing&wine_id=${b.wine_id }">${b.wine_name}&nbsp;${b.kind}</a></div>
<div class="renai1_3">本亲价：¥${b.price}</div>
</div>
<%-- <%
}
%> --%>
</c:forEach>
</div>

 <div id="con_one_2" style="display:none">
 
<%--  <%
	for(wine h:huangjiu5){

%> --%>
<c:forEach var="h" items="${requestScope.huangjiu5 }">
<div class="remai1">
<div class="remai1_1"><a href="wineServlet?method=xiangqing&wine_id=${h.wine_id }"><img src="${h.path }" width="164" height="181" /></a></div>
<div class="renai1_2"><a href="wineServlet?method=xiangqing&wine_id=${h.wine_id }">${h.wine_name}&nbsp;${h.kind}</a></div>
<div class="renai1_3">本亲价：¥${h.price}</div>
</div>
<%--  <%
}
%> --%>
</c:forEach>
</div>

<div id="con_one_3" style="display:none">
<%--   <%
	for(wine p:putaojiu5){

%> --%>
<c:forEach var="p" items="${requestScope.putaojiu5 }">
<div class="remai1">
<div class="remai1_1"><a href="wineServlet?method=xiangqing&wine_id=${p.wine_id}"><img src="${p.path }" width="164" height="181" /></a></div>
<div class="renai1_2"><a href="wineServlet?method=xiangqing&wine_id=${p.wine_id}">${p.wine_name}&nbsp;${p.kind}</a></div>
<div class="renai1_3">本亲价：¥${p.price}</div>
</div>
<%--   <%
}
%> --%>
</c:forEach>
 </div>

 <div id="con_one_4" style="display:none">
<%--    <%
	for(wine y:yangjiu5){

%> --%>
<c:forEach var="y" items="${requestScope.yangjiu5 }">
<div class="remai1">
<div class="remai1_1"><a href="wineServlet?method=xiangqing&wine_id=${y.wine_id}"><img src="${y.path }" width="164" height="181" /></a></div>
<div class="renai1_2"><a href="wineServlet?method=xiangqing&wine_id=${y.wine_id}">${y.wine_name}&nbsp;${y.kind}</a></div>
<div class="renai1_3">本亲价：¥${y.price}</div>
</div>
<%--   
<%
}
%> --%>
</c:forEach>
</div> 
</div>
</div>

<!--代码结束-->





</div>


<!--选项卡切花结束-->



<!--搜索框-->

<div class="jfdh_sy">
<div class="jfdh_bt">搜索</div>

<form action="wineServlet?method=sousuo" method="post" class="sousuolan" >
	<script>
	 	 var mail_type_dom=document.getElementById("mail_type");
	    var type_text=mail_type_dom.options[mail_type_dom.selectedIndex].text;
	</script>
	
	种类：<select id="mail_type" name="kind" class="sousuo">
		<option value="白酒">白酒</option>
		<option value="葡萄酒">葡萄酒</option>
		<option value="洋酒">洋酒</option>
		<option value="黄酒">黄酒</option>	
	
	
	</select><br/>
	最低价<input type="text" class="sousuo" name="minprice"/><br/>
	
	最高价<input type="text" class="sousuo" name="maxprice" /><br/>
	
	<input type="submit" value="搜索" class="sousuoButton"/>
</form>

</div>

<!--搜索框-->


</div>


<!--中部1结束-->



<!--中部白酒开始-->
<div class="con_dm">

<div class="con_dmbt"><span class="dt2_1"><img src="images/dm1.jpg" width="45" height="29" /></span><span class="dt2_2">白酒</span>
<span class="dt2_3"> <a href="tplist.jsp">更多商品>></a></span>

</div>


<div class="con2_dtk">

<!--左侧1开始-->

<div class="con2_zc">

    
    
    
    <div id="wrap2">

		<ul>
       <%--     <% 
           ArrayList<wine> baijiu9=(ArrayList<wine>)request.getAttribute("baijiu9");
           int x=1;
           	for(wine a:baijiu9){
           		
           %> --%>
            <c:forEach var="a" items="${requestScope.baijiu9}" varStatus="aa" begin="0" end="3">
			<li>
				<h2><span class="sz"><img src="images/tubiao/${aa.index+1 }.jpg" width="20" height="22" /></span><span class="szmc">${a.wine_name}&nbsp;&nbsp;${a.kind}</span></h2>
            <a href="wineServlet?method=xiangqing&wine_id=${a.wine_id }">
            <div class="movielist" >
            <img src="${a.path }" />  
            <dl>
            <dt>${a.detail }</dt>	
            <dd><span>价格：</span><span class="jj_y">${a.price }</span></dd>	
            </dl>
            </div>
            </a>
			</li>
			
		<%-- 	<%
				x++;
				if(x==5)
					break;
           		}
			%>
			 --%>
			 </c:forEach>
		</ul>
        
        <div class="dmgg"><a href="#"><img src="images/dmgg.jpg" width="230" height="83" /></a></div>
        
        
	</div>


</div>


<!--左侧1结束-->



<!--右侧开始-->

<div class="con2_yc">


<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $(".hdpic dd a").hover(function() {
        $(this).find(".picshine").stop();
        $(this).find(".picshine").css("background-position", "-235px 0");
        $(this).find(".picshine").animate({
            backgroundPosition: '235px 0'
        },
        500);
        $(this).find(".pictitle").stop().animate({
            left: '0px'
        },
        {
            queue: false,
            duration: 450
        });
    },
    function() {
        $(this).find(".pictitle").stop().animate({
            left: '-1135px'
        },
        {
            queue: false,
            duration: 200
        });
    });
});
</script>



<div class="hdpic">
  <dl> 
 		<%--  <% 
           int y=0;
           	for(wine a:baijiu9){
           		
           		if(y<4)
           		{
           			y++;
           			 continue;
           			
           		}
           		else{
           %>
   --%>
   <c:forEach var="a" items="${requestScope.baijiu9}" varStatus="aa" begin="4" end="8">
    <dd> <a href="wineServlet?method=xiangqing&wine_id=${a.wine_id }" target="_blank"> <img src="${a.path }"  width="100%" height="100%">
      <div class="pictitle">
<div class="zz">
     ${a.wine_name}&nbsp;&nbsp;${a.kind}<br />
    
      <span style="color:wineServlet?method=xiangqing&wine_id=${a.wine_id }F00; font-size:18px;">本亲价：${a.price }</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
  
   	 <%-- 	 <%
   	 			y++;
           		}
				
           		}
			%> --%>
			 </c:forEach>
  </dl>
</div>


</div>
<!--右侧结束-->


</div>

</div>
<!--中部白酒结束-->

<div class="none" style="height:20px;"></div>


<!--中部肉类开始-->

<div class="con2_rl">

<div class="con_dmbt"><span class="dt2_1"><img src="images/dm2.jpg" width="45" height="29" /></span><span class="dt2_2">葡萄酒</span>
<span class="dt2_3"> <a href="#">更多商品>></a></span>
</div>


<div class="con2_rldk">
<div class="roulei_1"><a href="#"><img src="images/rl1.jpg" width="232" height="328" /></a></div>

<div class="roulei_2">
<div class="rou_gg1"><a href="#"><img src="images/rl2.jpg" width="380" height="126" /></a></div>
<div class="rou_gg1" style="padding-left:10px;"><a href="#"><img src="images/rl3.jpg" width="380" height="126" /></a></div>

<div class="tpl_2" style="margin-left:0px;">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>


<div class="tpl_2">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>

<div class="tpl_2">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>


<div class="tpl_2">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>



</div>

<div class="roulei_3"><a href="#"><img src="images/rl6.jpg" width="149" height="333" /></a></div>



</div>




</div>



<!--中部肉类结束-->



<!--中部蔬菜开始-->


<div class="con_dm">

<div class="con_dmbt"><span class="dt2_1"><img src="images/dm3.jpg" width="45" height="29" /></span><span class="dt2_2">洋酒</span>
<span class="dt2_3"> <a href="#">更多商品>></a></span>
</div>


<div class="con2_dtk">

<!--左侧1开始-->

<div class="con2_zc">
	<script type="text/javascript">
	window.onload=function()
	{
		var oWrap=document.getElementById('wrap');
		var aLi=oWrap.getElementsByTagName('li');
		var aH2=oWrap.getElementsByTagName('h2');
		var aBox=oWrap.getElementsByTagName('div');

		var oWrap2=document.getElementById('wrap2');
		var aLi2=oWrap2.getElementsByTagName('li');
		var aH22=oWrap2.getElementsByTagName('h2');
		var aBox2=oWrap2.getElementsByTagName('div');
		
		for(var i=0; i<aLi.length; i++)
		{
			var iNow=0;
			aLi[i].index=i;
			aLi[i].onmouseover=function()
			{
				aH2[iNow].style.display='block';
				aBox[iNow].style.display='none';
				
				aH2[this.index].style.display='none';
				aBox[this.index].style.display='block';
				
				iNow=this.index;
			};
			
		}

		for(var i=0; i<aLi2.length; i++)
		{
			var iNow=0;
			aLi2[i].index=i;
			aLi2[i].onmouseover=function()
			{
				aH22[iNow].style.display='block';
				aBox2[iNow].style.display='none';
				
				aH22[this.index].style.display='none';
				aBox2[this.index].style.display='block';
				
				iNow=this.index;
			};
			
		}
		
	};
	</script>
    
    
    
    <div id="wrap">

		<ul>
			<li>    	
			<h2 style="display:none"><span class="sz"><img src="images/yi.jpg" width="20" height="22" /></span><span class="szmc">加拿大北极海参2000g/袋</span></h2>
            <a href="http://www.zhuotop.com">
            <div class="movielist" style="display:block">
            <img src="images/dy2.jpg" />  
            <dl>
            <dt>粤海商品金枪鱼粤海商品</dt>	
            <dd><span>价格：</span><span class="jj_y">¥138.0</span></dd>	
            </dl>
            </div>
            </a>
			</li>
            
            
			<li>
				<h2><span class="sz"><img src="images/er.jpg" width="20" height="22" /></span><span class="szmc">加拿大北极海参2000g/袋</span></h2>
            <a href="http://www.zhuotop.com">
            <div class="movielist" >
            <img src="images/dy2.jpg" />  
            <dl>
            <dt>粤海商品金枪鱼粤海商品</dt>	
            <dd><span>价格：</span><span class="jj_y">¥138.0</span></dd>	
            </dl>
            </div>
            </a>
			</li>
            
			<li>
			<h2><span class="sz"><img src="images/san.jpg" width="20" height="22" /></span><span class="szmc">加拿大北极海参2000g/袋</span></h2>
            <a href="http://www.zhuotop.com">
            <div class="movielist" >
            <img src="images/dy2.jpg" />  
            <dl>
            <dt>粤海商品金枪鱼粤海商品</dt>	
            <dd><span>价格：</span><span class="jj_y">¥138.0</span></dd>	
            </dl>
            </div>
            </a>
			</li>
            
            
			<li>
			<h2><span class="sz"><img src="images/si.jpg" width="20" height="22" /></span><span class="szmc">加拿大北极海参2000g/袋</span></h2>
            <a href="http://www.zhuotop.com">
            <div class="movielist" >
            <img src="images/dy2.jpg" />  
            <dl>
            <dt>粤海商品金枪鱼粤海商品</dt>	
            <dd><span>价格：</span><span class="jj_y">¥138.0</span></dd>	
            </dl>
            </div>
            </a>
			</li>
		</ul>
        
        <div class="dmgg"><a href="#"><img src="images/dmgg.jpg" width="230" height="83" /></a></div>
        
        
	</div>


</div>

<!--左侧1结束-->



<!--右侧开始-->

<div class="con2_yc">


<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $(".hdpic dd a").hover(function() {
        $(this).find(".picshine").stop();
        $(this).find(".picshine").css("background-position", "-235px 0");
        $(this).find(".picshine").animate({
            backgroundPosition: '235px 0'
        },
        500);
        $(this).find(".pictitle").stop().animate({
            left: '0px'
        },
        {
            queue: false,
            duration: 450
        });
    },
    function() {
        $(this).find(".pictitle").stop().animate({
            left: '-1135px'
        },
        {
            queue: false,
            duration: 200
        });
    });
});
</script>



<div class="hdpic">
  <dl> 
  
  
    <dd> <a href="#" target="_blank"> <img src="images/dm1_1.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
      
      
    
        <dd> <a href="#" target="_blank"> <img src="images/dm1_4.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
      
      
      <dd> <a href="#" target="_blank"> <img src="images/dm1_2.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
    
    
    
    <dd> <a href="#" target="_blank"> <img src="images/dm1_1.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
      
      
    
        <dd> <a href="#" target="_blank"> <img src="images/dm1_4.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
    
    
     
  </dl>
</div>


</div>
<!--右侧结束-->


</div>

</div>


<!--中部蔬菜结束-->

<div class="none" style="height:20px;"></div>

<!--中部水果开始-->

<div class="con2_rl">

<div class="con_dmbt"><span class="dt2_1"><img src="images/dm4.jpg" width="45" height="29" /></span><span class="dt2_2">黄酒</span>
<span class="dt2_3"> <a href="#">更多商品>></a></span>
</div>


<div class="con2_rldk">
<div class="roulei_1"><a href="#"><img src="images/rl1.jpg" width="232" height="328" /></a></div>

<div class="roulei_2">
<div class="rou_gg1"><a href="#"><img src="images/rl2.jpg" width="380" height="126" /></a></div>
<div class="rou_gg1" style="padding-left:10px;"><a href="#"><img src="images/rl3.jpg" width="380" height="126" /></a></div>

<div class="tpl_2" style="margin-left:0px;">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>


<div class="tpl_2">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>

<div class="tpl_2">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>


<div class="tpl_2">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>



</div>

<div class="roulei_3"><a href="#"><img src="images/rl6.jpg" width="149" height="333" /></a></div>



</div>




</div>


<!--公司简介、动态开始-->

<div class="con_d">

<!--简介开始-->

<div class="con_jj">
<div class="con_jjbt"><span style="float:left;"><img src="images/gsjj1.jpg" width="107" height="35" /></span><span style="float:right; line-height:35px; color:#669933;"><a href="#"> >> 查看详情</a></span></div>
<div class="con_jjtp"><img src="images/gsjj2.jpg" width="349" height="111" /></div>
<div class="con_jjnr">郑州卓普科技有限公司是一家专业互联网信息技术服务公司，注册资本1000万元，现有专业技术人员20余人。主要从事网站策划、网页设计、网站建设（包括微网站制作、企业展示型网站建设、电子商务型网站建设、行业门户型网站建设、行业门户型网站建设等）、互联网营销等一系列互联网服务，服务站建设等）、互联网营销等一系列互联网服务，服务客户达200多家，涉及教育、物流、医院、餐饮等多第一品牌！</div>

</div>

<!--简介结束-->

<div class="ggbj2"><img src="images/gsjj3.jpg" width="421" height="292" /></div>


<!--公司动态开始-->


<div class="con_jj">
<div class="con_jjbt"><img src="images/gsdt.jpg" width="120" height="35" /></div>
<div class="con_jjtp"><img src="images/dtt.jpg" width="348" height="111" /></div>
<div class="con_jjnr">

<ul>
<li><a href="#" title="郑州卓普科技有限公司是一家专业互联网信息技术服务公司">郑州卓普科技有限公司是一家专业互联网信息技术服务公司</a></li>
<li><a href="#" title="郑州卓普科技有限公司是一家专业互联网信息技术服务公司">郑州卓普科技有限公司是一家专业互联网信息技术服务公司</a></li>
<li><a href="#" title="郑州卓普科技有限公司是一家专业互联网信息技术服务公司">郑州卓普科技有限公司是一家专业互联网信息技术服务公司</a></li>
<li><a href="#" title="郑州卓普科技有限公司是一家专业互联网信息技术服务公司">郑州卓普科技有限公司是一家专业互联网信息技术服务公司</a></li>
<li><a href="#" title="郑州卓普科技有限公司是一家专业互联网信息技术服务公司">郑州卓普科技有限公司是一家专业互联网信息技术服务公司</a></li>
</ul>


</div>

</div>

<!--公司动态结束-->



</div>


<!--公司简介、动态开始结束-->


</div>


<!--中部结束-->
<%@include file="bottom.jsp" %>



</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
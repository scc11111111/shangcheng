<%@page import="java.util.ArrayList"%>
<%@page import="com.oracle.shangcheng.model.bean.wine"%>
<%@page import="com.oracle.shangcheng.model.dao.WineDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
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
<div style="margin:auto;height:500px;position:relative;left:400px;top:50px;">
<c:choose>
<c:when test="${requestScope.upuser eq null }">
<form action="UserServlet?method=updateUserInfo" method="post" enctype="multipart/form-data">
<table class="geren">
<tr><td ><img alt="" src="${requestScope.gerenxinxi.touxiang }" style="width:100px;height:100px;"><input type="hidden" name="upid" value="${requestScope.gerenxinxi.user_id }">
<input type="file" name="file" style="display: block;">
<td></tr>
<tr class="geren_td"><td>用户名：</td><td><input name="upname" type="text" class="geren_in" value="${requestScope.gerenxinxi.user_name }"><td></tr>
<tr class="geren_td"><td>地址：</td><td><input name="upaddress"  type="text" class="geren_in" value="${requestScope.gerenxinxi.address }"><td></tr>
<tr class="geren_td"><td>电话：</td><td><input name="upphone" type="text" class="geren_in" value="${requestScope.gerenxinxi.phone }"><td></tr>
<tr class="geren_td">
	<td><input type="submit" value="修改" style="width:50px;"/>
	</td>
	<td><input type="button"  value="重置" style="width:50px;">
	<td>
</tr>

</table>
</form>
</c:when>
<c:otherwise>
<form action="UserServlet?method=updateUserInfo" method="post" enctype="multipart/form-data">
<table class="geren">
<tr><td ><img alt="" src="${requestScope.upuser.touxiang }" style="width:100px;height:100px;"><input type="hidden" name="upid" value="${requestScope.upuser.user_id }">
<input type="file" name="file" style="display: block;">
<td></tr>
<tr class="geren_td"><td>用户名：</td><td><input name="upname" type="text" class="geren_in" value="${requestScope.upuser.user_name }"><td></tr>
<tr class="geren_td"><td>地址：</td><td><input name="upaddress"  type="text" class="geren_in" value="${requestScope.upuser.address }"><td></tr>
<tr class="geren_td"><td>电话：</td><td><input name="upphone" type="text" class="geren_in" value="${requestScope.upuser.phone }"><td></tr>
<tr class="geren_td">
	<td><input type="submit" value="修改" style="width:50px;"/>
	</td>
</tr>

</table>
</form>
</c:otherwise>
</c:choose>

<script type="text/javascript">
var e="${requestScope.error_x}";
if(e!=''){
	alert(e);
	location.href="UserServlet?method=loadProfile&userid=${sessionScope.user.user_id}";
}
</script>



</div>





<%@include file="bottom.jsp" %>
</body>
</html>
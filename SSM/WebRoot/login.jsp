<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/styles.css">
  </head>
  
  <body>
    <div class="wrapper">
	<div class="container">
		<h1>用户登录</h1>
		<form class="form" action="user/login.do" method="post">
			<input type="text" placeholder="输入用户名" name="userName">
			<input type="password" placeholder="输入密码" name="password"><br>
			<span style="color:red"><c:out value="${end}"></c:out></span><br><br>
			<button type="submit" id="login-button"><strong>登陆</strong></button><br><br>
			<a href="regist.jsp" target="_top" class="button">用户注册</a>	
		</form>
	</div>
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
	</ul>
</div>
  </body>
</html>

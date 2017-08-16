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
    
    <title>记者注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/styles.css">
	<script type="text/javascript" src="admin/js/jquery.min.js" ></script>
 	<script type="text/javascript">
 		function regist(){
 		 		$.ajax({
 		 			type:"post",
 		 			url:"admin/login.do",
 		 			data: {'admin_name': $("#admin_name").val()}
 		 			dataType:"text",
 		 			success:function(data){
 		 				if(data){
 		 					alert("可以注册");
 		 				}else{
 		 					alert("用户已存在！");
 		 				}
 		 			}
 		 		})
 		  };
 	</script>
  </head>
  
  <body>
  <h2 style="color:black;text-align: center;line-height: 350px">记者注册</h2>
    <div class="wrapper">
	<div class="container">
		<form class="form" action="admin/insert.do" method="post">
			<input type="text" placeholder="New Adminname" name="admin_name" onblur="regist()" id="admin_name">
			<input type="password" placeholder="New Password" name="admin_pass" id="pw1">
			<input type="password" placeholder="Agin Password" name="" id="pw2" onkeyup="pw()">
			<span id="tishi"></span><br>
			<button type="submit" id="login-button" id="submit"><strong>注册</strong></button><br><br>
			<a href="admin/login.jsp" target="_top" class="button">返回登录</a>		
		</form>
	</div>
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
	</ul>
</div>
 <script>
          function pw() {
              var pw1 = document.getElementById("pw1").value;
              var pw2 = document.getElementById("pw2").value;
              if(pw1 == pw2) {
                  document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
                  document.getElementById("submit").disabled = false;
              }
              else {
                  document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
                  document.getElementById("submit").disabled = true;
                  return;
              }
          }
 </script>
  </body>
</html>

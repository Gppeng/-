<%@page import="com.lzh.domain.Command"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(session.getAttribute("admin_name")==null){
//用户没有登陆
response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新闻发布系统后台</title>
	<link rel="stylesheet" href="admin/css/admin.css" />
	<link rel="stylesheet" href="admin/css/public.css" />
	<link rel="stylesheet" type="text/css" href="admin/css/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="admin/css/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="admin/css/themes/color.css">
	<script type="text/javascript" src="admin/js/jquery.min.js" ></script>
	<script type="text/javascript" src="admin/js/jquery.easyui.min.js" ></script>
  </head>
  	<body>
		<div class="head">
	<div class="logo"><a href="index.jsp"><img src="admin/images/logo.jpg" alt="网站logo" height="40px" width="160px" style="margin-top: 0px"></a></div>
		  <div class="nav">
		   <ul>
		    <li><a href="admin/index.jsp?rec=clear_cache">清除缓存</a></li>
		    <li><a href="http://www.baidu.com" target="_blank">帮助</a></li>
		    <li class="noRight"><a href="index.jsp">新闻发布系统</a></li>
		   </ul>
		   <ul class="navRight">
		    <li class="M noLeft"><a href="JavaScript:void(0);"><span>您好，欢迎<font style="color: black;">${admin_name }</font>登录！</span></a>
		    </li>
		    <li class="noRight"><a href="admin/lgout.do">退出</a></li>
		   </ul>
		  </div>
		</div>
		<div class="wrap">	
			<div class="dcLeft">
			<div class="menu">
				 <ul class="top">
				  <li><a href="admin/admin_index.jsp"><em>管理首页</em></a></li>
				  <li><a href="admin/list.do"><em>管理员</em></a></li>
				  <li><a href="admin/user.jsp"><i class="manager"></i><em>用户管理</em></a></li>
				  <li><a href="admin/editor.jsp"><em>记者管理</em></a></li>
				  <li><a href="admin/discuss.jsp"><em>评论管理</em></a></li>
				  <li><a href="news/list.do?pageIndex=1&pageNum=10"><em>新闻管理</em></a></li>
				  <li><a href="admin/advertise.jsp"><em>广告管理</em></a></li>
				  <li><a href="admin/text.jsp"><em>文章列表</em></a></li>
				  <li id="select"><a href="admin/data_copy.jsp"><em>数据备份</em></a></li>
				  <li><a href="admin/data_init.jsp"><em>数据还原</em></a></li>
				 </ul>
			</div>
			</div>
			<div id="dcMain">
			 <%  
				Command com = new Command();  
				String ip = "localhost";//ip地址  
				String username = "root";//MySQL数据库的用户名  
				String password = "HUIHUI123";//MySQL数据库的密码  
				String database = "ssm";//数据库名字  
				String url = "D:/lzh.sql";//备份的目的地址  
				boolean check = com.backupDatebase(ip,username,password,database,url);  
				if(check){  
				 %>  
				 	<div class="mesg" style="height: 500px;width: 1000px;text-align: center;line-height: 500px">
				 		<span style="font-size: 20px;color: green">数据库备份成功!已经存储在D:/lzh.sql</span>
				 	</div>
				 <%}else{
				 %>  
				 	<div class="mesg" style="height: 500px;width: 1000px;text-align: center;line-height: 500px">
				 		<span style="font-size: 20px;color: red">数据库备份失败!</span>
				 	</div>
				 <%
				  }%>  
			</div>
			<div id="dcFooter">
			 <div id="footer">
			  <div class="line"></div>
			  <ul><li>
			  		 版权所有 © 灰灰有限公司，并保留所有权利。
			  		</li>
			  </ul>
			 </div>
			</div><!-- dcFooter 结束 -->
			</div>
			   
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(session.getAttribute("admin_name")==null){
//用户没有登陆
response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
				  <li id="select"><a href="admin/admin_index.jsp"><em>管理首页</em></a></li>
				  <li><a href="admin/list.do"><em>管理员</em></a></li>
				  <li><a href="admin/user.jsp"><i class="manager"></i><em>用户管理</em></a></li>
				  <li><a href="admin/editor.jsp"><em>记者管理</em></a></li>
				  <li><a href="admin/discuss.jsp"><em>评论管理</em></a></li>
				  <li><a href="news/list.do?pageIndex=1&pageNum=10"><em>新闻管理</em></a></li>
				  <li><a href="admin/advertise.jsp"><em>广告管理</em></a></li>
				  <li><a href="admin/text.jsp"><em>文章列表</em></a></li>
				  <li><a href="admin/data_copy.jsp"><em>数据备份</em></a></li>
				  <li><a href="admin/data_init.jsp"><em>数据还原</em></a></li>
				 </ul>
			</div>
			</div>
			<div id="dcMain">
				<!-- 当前位置 -->
				<div id="urHere">新闻管理中心</div>  <div id="index" class="mainBox" style="padding-top:18px;height:auto!important;height:550px;min-height:550px;">
				      <div class="warning">请慢慢适应使用，有问题联系超管灰灰---18435186549！</div>
				    
				   <div id="douApi"></div>
				  
				   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="indexBoxTwo">
				    <tr>
				     <td width="65%" valign="top" class="pr">
				      <div class="indexBox">
				       <div class="boxTitle">网站基本信息</div>
				       <ul>
				        <table width="100%" border="0" cellspacing="0" cellpadding="7" class="tableBasic">
				         <tr>
				          <td width="120">单页面数：</td>
				          <td><strong>6</strong></td>
				          <td width="100">文章总数：</td>
				          <td><strong>10</strong></td>
				         </tr>
				         <tr>
				          <td>视频总数：</td>
				          <td><strong>20</strong></td>
				          <td>系统语言：</td>
				          <td><strong>中文</strong></td>
				         </tr>
				         <tr>
				          <td>URL 重写：</td>
				          <td><strong>关闭<a href="system.php" class="cueRed ml">（点击开启）</a> 
				           </strong></td>
				          <td>编码：</td>
				          <td><strong>UTF-8</strong></td>
				         </tr>
				         
				         <tr>
				          <td>灰灰课程版本：</td>
				          <td><strong>v1.0 Release 20160915</strong></td>
				          <td>安装日期：</td>
				          <td><strong>2016-10-25</strong></td>
				         </tr>
				        </table>
				       </ul>
				      </div>
				     </td>
				     <td valign="top" class="pl">
				      <div class="indexBox">
				       <div class="boxTitle">管理员  登录记录</div>
				       <ul>
				        <table width="100%" border="0" cellspacing="0" cellpadding="7" class="tableBasic">
				         <tr>
				          <th width="45%">IP地址</th>
				          <th width="55%">操作时间</th>
				         </tr>
				                  <tr>
				          <td align="center">127.0.0.1</td>
				          <td align="center">2016-09-16 23:29:08</td>
				         </tr>
				                  <tr>
				          <td align="center">127.0.0.1</td>
				          <td align="center">2016-09-12 13:48:48</td>
				         </tr>
				                  <tr>
				          <td align="center">127.0.0.1</td>
				          <td align="center">2016-09-08 09:43:01</td>
				         </tr>
				                  <tr>
				          <td align="center">127.0.0.1</td>
				          <td align="center">2016-09-07 09:42:58</td>
				         </tr>
				       </table>
				       </ul>
				      </div>
				     </td>
				    </tr>
				   </table>
				   <div class="indexBox">
				    <div class="boxTitle">服务器信息</div>
				    <ul>
				     <table width="100%" border="0" cellspacing="0" cellpadding="7" class="tableBasic">
				      <tr>
				       <td width="120" valign="top">JAVA 版本：</td>
				       <td valign="top">JDK7 </td>
				       <td width="100" valign="top">MySQL 版本：</td>
				       <td valign="top">5.5.40</td>
				       <td width="100" valign="top">服务器操作系统：</td>
				       <td valign="top">WINDOW7</td>
				      </tr>
				      <tr>
				       <td valign="top">文件上传限制：</td>
				       <td valign="top">20M</td>
				       <td valign="top">GD 库支持：</td>
				       <td valign="top">是</td>
				       <td valign="top">Web 服务器：</td>
				       <td valign="top">Apache/TOMCAT7</td>
				      </tr>
				     </table>
				    </ul>
				   </div>
				  </div>
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

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<link rel="stylesheet" href="admin/css/public.css" />
	<link rel="stylesheet" href="admin/css/admin.css" />
	<link rel="stylesheet" type="text/css" href="admin/css/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="admin/css/themes/icon.css">
        <link rel="stylesheet" type="text/css" href="admin/css/themes/color.css">
		<script type="text/javascript" src="admin/js/jquery.min.js" ></script>
		<script type="text/javascript" src="admin/js/jquery.easyui.min.js" ></script>
		<script type="text/javascript" src="admin/js/easyui-lang-zh_CN.js"></script>
	
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
				  <li id="select"><a href="news/list.do?pageIndex=1&pageNum=10"><em>新闻管理</em></a></li>
				  <li><a href="admin/advertise.jsp"><em>广告管理</em></a></li>
				  <li><a href="admin/text.jsp"><em>文章列表</em></a></li>
				  <li><a href="admin/data_copy.jsp"><em>数据备份</em></a></li>
				  <li><a href="admin/data_init.jsp"><em>数据还原</em></a></li>
				 </ul>
			</div>
			</div>
				<div id="dcMain">
   <!-- 当前位置 -->
<div id="urHere">灰灰课程中心<b>></b><strong>新闻管理</strong><b>></b><strong>添加新闻</strong> </div>   <div id="manager" class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
    <h3><a href="news/list.do?pageIndex=1&pageNum=8" class="actionBtn">返回列表</a>添加新闻</h3>
   <form action="news/insert.do" method="post"  enctype="multipart/form-data">
     <table width="100%" border="0" cellpadding="8" cellspacing="1" class="tableBasic" style="border:1px solid gray">
      <tr style=" COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
       <td width="100" align="right" >新闻标题</td>
       <td>
        <input type="text" name="title" size="40" class="inpMain" />
       </td>
      </tr >
       <tr bgcolor='#F4FAFF'>
       <td align="right">新闻内容</td>
       <td style="border:1px solid gray">
        	<textarea rows="10" cols="100" name="content"></textarea>
       </td>
      </tr>
      <tr bgcolor='#F4FAFF'>
       <td width="100" align="right">编辑者</td>
       <td style="border:1px solid gray">
        <input type="text" name="editor" size="40" class="inpMain" />
       </td>
      </tr>
      <tr bgcolor='#F4FAFF'>
       <td width="100" align="right">发布时间</td>
       <td style="border:1px solid gray">
       <input type="text"  name="post_time"	class="easyui-datetimebox"/>
       </td>
      </tr>
       <tr bgcolor='#F4FAFF'>
       <td width="100" align="right">类型</td>
       <td style="border:1px solid gray">
        <select name="type" class="inpMain">
        	<option value="行业">行业</option>
        	<option value="活动">活动</option>
        	<option value="品牌">品牌</option>
        	<option value="运动">运动</option>
        	<option value="人物">人物</option>
        	<option value="专题">专题</option>
        </select>
       </td>
      </tr>
       <tr bgcolor='#F4FAFF'>
       <td width="100" align="right">图片</td>
       <td style="border:1px solid gray">
        <input type="file" name="attpic" size="40" class="inpMain" />
       </td>
      </tr>
      <tr bgcolor='#F4FAFF'>
       <td width="100" align="right">阅读次数</td>
       <td style="border:1px solid gray">
        <input type="text" name="readcount" size="40" class="inpMain" />
       </td>
      </tr>
      <tr bgcolor='#F4FAFF'>
       <td width="100" align="right">新闻标签</td>
       <td style="border:1px solid gray">
        <input type="text" name="href" size="40" class="inpMain" />
       </td>
      </tr>
      
     
      <tr>
       <td></td>
       <td>
        <input type="hidden" name="token" value="5a58b748" />
        <input type="submit" name="submit" class="btn" value="提交" />
       </td>
      </tr>
     </table>
    </form>
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

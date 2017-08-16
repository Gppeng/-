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
  </head>
  	<body>
		<div class="head">
		  <div class="logo"><a href="index.jsp"><img src="admin/images/logo.jpg" alt="网站logo"></a></div>
		  <div class="nav">
		   <ul>
		    <li><a href="admin/index.jsp?rec=clear_cache">清除缓存</a></li>
		    <li><a href="http://www.baidu.com" target="_blank">帮助</a></li>
		    <li class="noRight"><a href="index.jsp">新闻发布系统</a></li>
		   </ul>
		   <ul class="navRight">
		    <li class="M noLeft"><a href="JavaScript:void(0);"><span>您好，欢迎<font style="color: black;">${admin.admin_name }</font>登录！</span></a>
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
<div id="urHere">新闻管理中心<b>></b><strong>新闻管理</strong> </div>   <div id="manager" class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
    <h3><a href="admin/add_news.jsp" class="actionBtn">添加新闻</a>新闻管理</h3>
        <div class="filter">
    <form action="news/getById.do" method="post">
     <select name="cat_id">
      <option value="0">通过id查找</option>
       	<option value="1">类型</option>
       	<option value="2">名称</option>
      </select>
     <input name="id" type="text" class="inpMain" value="" size="20" />
     <input name="submit" class="btnGray" type="submit" value="筛选" />
    </form>
    <a href="news/list.do?&pageIndex=1&pageNum=10" class="btn">返回列表</a>
    </div>
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
     <tr>
     <th align="center"><input name='chkall' type='checkbox' id='chkall' onclick='selectcheckbox(this.form)' value='check'></th>
      <th width="30" align="center">编号</th>
      <th align="center">标题</th>
      <th align="center">类型</th>
      <th align="center">阅读量</th>
      <th align="center">编辑者</th>
      <th align="center">内容</th>
      <th align="center">图片</th>
      <th align="center">发布时间</th>
      <th align="center">链接</th>
     </tr>
      <tbody>
       <c:forEach items="${news_list }" var="news">
       <tr>
       <td align="center"><input name='chkall' type='checkbox' id='chkall' onclick='selectcheckbox(this.form)' value='check'></td>
      <td align="center">${news.id }</td>
      <td align="center">${news.title}</td>
      <td align="center">${news.type}</td>
      <td align="center">${news.readcount}</td>
      <td align="center">${news.editor}</td>
      <td align="center">${news.content}</td>
      <td align="center">${news.attpic}</td>
      <td align="center">${news.post_time}</td>
      <td align="center">${news.href}</td> 
      <td><a href="news/delete.do?id=${news.id }">删除</a></td>
     </tr>
     </c:forEach>
      
      <c:forEach items="${new_list}" var="newss">
         <tr>
       <td align="center"><input name='chkall' type='checkbox' id='chkall' onclick='selectcheckbox(this.form)' value='check'></td>
      <td align="center">${newss.id }</td>
      <td align="center">${newss.title}</td>
      <td align="center">${newss.type}</td>
      <td align="center">${newss.readcount}</td>
      <td align="center">${newss.editor}</td>
      <td align="center">${newss.content}</td>
      <td align="center">${newss.attpic}</td>
      <td align="center">${newss.post_time}</td>
      <td align="center">${newss.href}</td> 
      <td><a href="news/delete.do?id=${newss.id }">删除</a></td>
     </tr>
     </c:forEach>
     </tbody>
     </table>
     <c:if test="${page.pageIndex>1}">
				   	<a href="news/list.do?pageIndex=${pageIndex-1 }&pageNum=10" class="btn">上一页</a>
				   </c:if>
				   <a href="news/list.do?pageIndex=${pageIndex+1}&pageNum=10" class="btn">下一页</a>
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

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
		<meta charset="UTF-8">
		<title>新闻发布系统后台</title>
		<link rel="stylesheet" href="admin/css/admin.css" />
		<link rel="stylesheet" href="admin/css/public.css" />
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
				  <li id="select"><a href="admin/list.do"><em>管理员</em></a></li>
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
			<div class="dcRight">
				<div class="right-main">
				 <table id="dg" title="超级管理员" class="easyui-datagrid" style="width:1000px;height:550px"
		                toolbar="#toolbar" pagination="true"
		                rownumbers="true" fitColumns="true" singleSelect="true"
		                url="${pageContext.request.contextPath}/admin/list.do">
		            <thead>
		                <tr>
		                	<th field="admin_id" width="50">编号</th>
		                    <th field="admin_name" width="50">账号</th>
		                    <th field="admin_pass" width="50">密码</th>
		                    <th field="tel" width="50">电话</th>
		                    <th field="email" width="50">邮箱</th>
		                     <th field="do" width="50">操作</th>
		                </tr>
		               
		            </thead>
		             <c:forEach items="${admin_list}" var="admin">
	    				<tr>
				    		<td>${admin.admin_id }</td>
				    		<td>${admin.admin_name }</td>
				    		<td>${admin.admin_pass }</td>
				    		<td>${admin.tel }</td>
				    		<td>${admin.email }</td>
				    		<td><a href="admin/delete.do?admin_id=${admin.admin_id}">删除</a></td>
	   					</tr>
	    				</c:forEach>
		        </table>
		        <div id="toolbar">
		            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加管理员</a>
		            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改信息</a>
		            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">移除管理员</a>
		        	 <div>
				 管理员： <input type="text" id="s_userName" size="20"
				onkeydown="if(event.keyCode == 13)searchUser()" /> <a
				href="javascript:searchUser()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a>
				</div>
		        </div>
		       
		        <div id="dlg" class="easyui-dialog" style="width:400px"
		                closed="true" buttons="#dlg-buttons">
		            <form action="admin/insert.do" id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
		                <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">用户信息</div>
		                <div style="margin-bottom:10px">
		                    <input name="admin_name" class="easyui-textbox" required="true" label="账号:" style="width:100%">
		                </div>
		                <div style="margin-bottom:10px">
		                    <input name="admin_pass" class="easyui-textbox" required="true" label="密码:" style="width:100%">
		                </div>
		                <div style="margin-bottom:10px">
		                    <input name="tel" class="easyui-textbox" required="true" label="电话:" style="width:100%">
		                </div>
		                <div style="margin-bottom:10px">
		                    <input name="email" class="easyui-textbox" required="true" validType="email" label="邮箱:" style="width:100%">
		                </div>
		                 <button class="easyui-linkbutton c6" type="submit" iconCls="icon-ok" onclick="saveUser()" style="width:90px">保存</button>
		                  <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">放弃</a>
		                  </form>
		                 <div id="dlg-buttons">
				        </div>
		           
		        </div>
		        </div>
		        <script type="text/javascript" src="admin/js/add.js" charset="utf-8" ></script>
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
	
	</body>
	<script type="text/javascript">
		$('#dg').datagrid({
			pageSize:20,		
		})
	</script>
</html>


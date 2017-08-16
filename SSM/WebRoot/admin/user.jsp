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
				  <li><a href="admin/list.do"><em>管理员</em></a></li>
				  <li id="select"><a href="admin/user.jsp"><i class="manager"></i><em>用户管理</em></a></li>
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
			<table id="dg" title="用户管理" class="easyui-datagrid" style="width:1000px;height:550px"
		                toolbar="#tb" pagination="true"
		                rownumbers="true" fitColumns="true" singleSelect="false"
		                url="user/list.do">
		            <thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="userName" width="50" align="center">用户名</th>
				<th field="password" width="50" align="center">密码</th>
				<th field="trueName" width="50" align="center">真实姓名</th>
				<th field="email" width="50" align="center">邮件</th>
				<th field="tel" width="50" align="center">联系电话</th>
				<th field="pic" width="50" align="center">头像</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<a href="javascript:openUserAddDialog()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">添加用户</a> <a
			href="javascript:openUserModifyDialog()" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改用户</a> <a
			href="javascript:deleteUser()" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">删除用户</a>
		<div>
			 用户名： <input type="text" id="s_userName" size="20"
				onkeydown="if(event.keyCode == 13)searchUser()" /> <a
				href="javascript:searchUser()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a>
				<a class="easyui-linkbutton" href="javascript:void(0);" onclick="clearSearch();">返回</a>
		</div> 	
		
		<div id="dlg-buttons">
			<a href="javascript:saveUser()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closeUserDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
		<div id="dlg" class="easyui-dialog"
			style="width: 730px;height:280px;padding:10px 30px 10px 60px;" closed="true"
			buttons="#dlg-buttons">
			<form method="post" id="fm">
				<table cellspacing="20px;">
					<tr>
						<td>用户名：</td>
						<td><input type="text" id="userName" name="userName"
							data-options="iconCls:'icon-man'" class="easyui-textbox" required="true" /> <span
							style="color: red">*</span>
						</td>
						<td>	</td>
						<td>密码：</td>
						<td><input type="password" id="password" name="password"
							data-options="iconCls:'icon-lock'" class="easyui-textbox" required="true" /> <span
							style="color: red">*</span>
						</td>
					</tr>
					<tr>
						<td>真实姓名：</td>
						<td><input type="text" id="trueName" name="trueName"
							data-options="iconCls:'icon-pencil'" class="easyui-textbox" required="true" /> <span
							style="color: red">*</span>
						</td>
						<td>	</td>
						<td>邮箱：</td>
						<td><input type="text" id="email" name="email"
							data-options="iconCls:'icon-email'" validType="email" class="easyui-textbox" required="true" /> <span
							style="color: red">*</span>
						</td>
					</tr>
					<tr>
						<td>联系电话：</td>
						<td><input type="text" id="tel" name="tel"
							data-options="iconCls:'icon-pencil'" class="easyui-textbox" required="true" /> <span
							style="color: red">*</span>
						</td>
						<td>	</td>
						<td>头像：</td>
						<td><input type="file" id="pic" name="pic"
						 required="true"/>
						<span
							style="color: red">*</span>
						</td>
					</tr>
				</table>
			</form>
		</div>
		</div>
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
	</body>
			<script type="text/javascript">
			var	url;
			function searchUser(){
				$("#dg").datagrid('load',{
					"userName":$("#s_userName").val()
				});
			}
			function clearSearch() {
		        $("#dg").datagrid("load", {});//重新加载数据，无填写数据，向后台传递值则为空
		        $("#searchForm").find("input").val("");//找到form表单下的所有input标签并清空
		    }
			function openUserModifyDialog() {
				var selectedRows = $("#dg").datagrid("getSelections");
				if (selectedRows.length != 1) {
					$.messager.alert("系统提示", "请选择一条要编辑的数据！");
					return;
				}
				var row = selectedRows[0];
				$("#dlg").dialog("open").dialog("setTitle", "编辑用户信息");
				$("#fm").form("load", row);
				url = "${pageContext.request.contextPath}/user/save.do?id=" + row.id;
			}
			function openUserAddDialog() {
				$("#dlg").dialog("open").dialog("setTitle", "添加用户信息");
				url = "${pageContext.request.contextPath}/user/save.do";
			}
			function saveUser() {
				$("#fm").form("submit", {
					url : url,
					onSubmit : function() {
						return $(this).form("validate");
					},
					success : function(result) {
						var result = eval('(' + result + ')');
						if (result.success) {
							$.messager.alert("系统提示", "保存成功！");
							resetValue();
							$("#dlg").dialog("close");
							$("#dg").datagrid("reload");
						} else {
							$.messager.alert("系统提示", "保存失败！");
							return;
						}
					}
				});
			}
			function resetValue() {
				$("#userName").val("");
				$("#password").val("");
				$("#trueName").val("");
				$("#email").val("");
				$("#tel").val("");
				$("#pic").val("");
			}
			function closeUserDialog() {
				$("#dlg").dialog("close");
				resetValue();
			}
			function deleteUser() {
				var selectedRows = $("#dg").datagrid("getSelections");
				if (selectedRows.length == 0) {
					$.messager.alert("系统提示", "请选择要删除的数据！");
					return;
				}
				var strIds = [];
				for ( var i = 0; i < selectedRows.length; i++) {
					strIds.push(selectedRows[i].id);
				}
				var ids = strIds.join(",");
				$.messager.confirm("系统提示", "您确定要删除这<font color=red>"
						+ selectedRows.length + "</font>条数据吗？", function(r) {
					if (r) {
						$.post("${pageContext.request.contextPath}/user/delete.do", {
							ids : ids
						}, function(result) {
							if (result.success) {
								$.messager.alert("系统提示", "数据已成功删除！");
								$("#dg").datagrid("reload");
							} else {
								$.messager.alert("系统提示", "数据删除失败，请联系系统管理员！");
							}
						}, "json");
					}
				});
			}
		</script>
</html>


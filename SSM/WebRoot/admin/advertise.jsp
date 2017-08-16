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
				  <li><a href="admin/user.jsp"><i class="manager"></i><em>用户管理</em></a></li>
				  <li><a href="admin/editor.jsp"><em>记者管理</em></a></li>
				  <li><a href="admin/discuss.jsp"><em>评论管理</em></a></li>
				  <li><a href="news/list.do?pageIndex=1&pageNum=10"><em>新闻管理</em></a></li>
				  <li id="select"><a href="admin/advertise.jsp"><em>广告管理</em></a></li>
				  <li><a href="admin/text.jsp"><em>文章列表</em></a></li>
				  <li><a href="admin/data_copy.jsp"><em>数据备份</em></a></li>
				  <li><a href="admin/data_init.jsp"><em>数据还原</em></a></li>
				 </ul>
			</div>
			</div>
			<div class="dcRight">
				<div class="right-main">
			<table id="dg" title="广告管理" class="easyui-datagrid" style="width:1000px;height:550px"
		                toolbar="#tb" pagination="true"
		                rownumbers="true" fitColumns="true" singleSelect=false"
		                url="advertise/list.do">
		            <thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="title" width="50" align="center">广告标题</th>
				<th field="href" width="50" align="center">广告链接</th>
				<th field="pic" width="50" align="center">广告图片</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<a href="javascript:openAdverAddDialog()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">插入广告</a> 
		<a href="javascript:openAdverModifyDialog()" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改广告</a>	
		<a href="javascript:deleteAdver()" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">删除评论</a>
		<div>
			 新闻： <input type="text" id="dis_nid" size="20"
				onkeydown="if(event.keyCode == 13)searchUser()" /> <a
				href="javascript:searchAdver()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a>
		</div> 
		
		<div id="dlg-buttons">
			<a href="javascript:saveAdver()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closeAdverDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
		<div id="dlg" class="easyui-dialog" style="width:400px"
		                closed="true" buttons="#dlg-buttons">
		            <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
		                <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">用户信息</div>
		                <div style="margin-bottom:10px">
		                    <input name="title" class="easyui-textbox" required="true" label="广告标题：" style="width:100%">
		                </div>
		                <div style="margin-bottom:10px">
		                    <input name="href" class="easyui-textbox" required="true" label="广告链接：" style="width:100%">
		                </div>
		                <div style="margin-bottom:10px">
		                    <input name="pic" class="easyui-filebox" required="true" label="广告图片:" style="width:100%">
		                </div>
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
			function searchAdver(){
				$("#dg").datagrid('load',{
					"title":$("#title").val()
				})
			}
			function openAdverModifyDialog() {
				var selectedRows = $("#dg").datagrid("getSelections");
				if (selectedRows.length != 1) {
					$.messager.alert("系统提示", "请选择一条要编辑的数据！");
					return;
				}
				var row = selectedRows[0];
				$("#dlg").dialog("open").dialog("setTitle", "编辑广告");
				$("#fm").form("load", row);
				url = "advertise/save.do?id=" + row.id;
			}
			function openAdverAddDialog() {
				$("#dlg").dialog("open").dialog("setTitle", "添加广告");
				url = "advertise/save.do";
			}
			function saveAdver() {
				$("#fm").form("submit", {
					url : url,
					onSubmit : function() {
						return $(this).form("validate");
					},
					success : function(result) {
						var result = eval('(' + result + ')');
						if (result.success) {
							$.messager.alert("系统提示", "添加成功！");
							resetValue();
							$("#dlg").dialog("close");
							$("#dg").datagrid("reload");
						} else {
							$.messager.alert("系统提示", "添加失败！");
							return;
						}
					}
				});
			}
			function resetValue() {
				$("#title").val("");
				$("#href").val("");
				$("#pic").val("");
			}
			function closeAdverDialog() {
				$("#dlg").dialog("close");
				resetValue();
			}
			function deleteAdver() {
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
						$.post("advertise/delete.do", {
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

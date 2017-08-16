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
				  <li id="select"><a href="admin/discuss.jsp"><em>评论管理</em></a></li>
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
			<table id="dg" title="评论管理" class="easyui-datagrid" style="width:1000px;height:550px"
		                toolbar="#tb" pagination="true"
		                rownumbers="true" fitColumns="true" singleSelect=false"
		                url="discuss/list.do">
		            <thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="uid" width="50" align="center">被评论者</th>
				<th field="post_time" width="50" align="center">评论时间</th>
				<th field="content" width="50" align="center">评论内容</th>
				<th field="nid" width="50" align="center">评论新闻</th>
				<th field="did" width="50" align="center">评论者</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<a href="javascript:openDiscussAddDialog()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">插入评论</a>  <a
			href="javascript:deleteDiscuss()" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">删除评论</a>
		<div>
			 新闻： <input type="text" id="dis_nid" size="20"
				onkeydown="if(event.keyCode == 13)searchUser()" /> <a
				href="javascript:searchDiscuss()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a>
		</div> 
		
		<div id="dlg-buttons">
			<a href="javascript:saveDiscuss()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closeDiscussDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
		<div id="dlg" class="easyui-dialog" style="width:400px"
		                closed="true" buttons="#dlg-buttons">
		            <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
		                <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">用户信息</div>
		                <div style="margin-bottom:10px">
		                    <input name="uid" class="easyui-textbox" required="true" label="用户id:" style="width:100%">
		                </div>
		                <div style="margin-bottom:10px">
		                    <input name="post_time" class="easyui-datebox" required="true" label="发布时间：" style="width:100%">
		                </div>
		                <div style="margin-bottom:10px">
		                    <input name="content" class="easyui-textbox" required="true" label="内容:" style="width:100%">
		                </div>
		                <div style="margin-bottom:10px">
		                    <input name="nid" class="easyui-textbox" required="true"  label="新闻" style="width:100%">
		                </div>
		                <div style="margin-bottom:10px">
		                    <input name="did" class="easyui-textbox" required="true"  label="被评论者" style="width:100%">
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
			function searchDiscuss(){
				$("#dg").datagrid('load',{
					"nid":$("#dis_nid").val()
				})
			}
			function openDiscussAddDialog() {
				$("#dlg").dialog("open").dialog("setTitle", "添加评论");
				url = "discuss/save.do";
			}
			function saveDiscuss() {
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
				$("#nid").val("");
				$("#post_time").val("");
				$("#content").val("");
				$("#nid").val("");
				$("#did").val("");
			}
			function closeDiscussDialog() {
				$("#dlg").dialog("close");
				resetValue();
			}
			function deleteDiscuss() {
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
						$.post("${pageContext.request.contextPath}/discuss/delete.do", {
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


<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isErrorPage="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>500</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/500.css">
  </head>
  
  <body>
<div id="wrapper"><a class="logo" href="/"></a>
  <div id="main">
    <div id="header">
      <h1><span class="icon">!</span>500<span class="sub">Internal Server Error</span></h1>
    </div>
    <div id="content">
      <h2>服务器内部错误！</h2>
      <p>当您看到这个页面,表示服务器内部错误,此网站可能遇到技术问题,无法执行您的请求,请稍后重试或联系站长进行处理,新闻系统站长感谢您的支持!</p>
      <div class="utilities">
          <div class="input-container" style="font: 13px 'TeXGyreScholaRegular', Arial, sans-serif;color: #696969; text-shadow: 0 1px white;text-decoration: none;">
            <span id="totalSecond" style="color:red">5</span>秒后自动跳转…
          </div>
        <a class="button right" href="index.jsp" onClick="history.go(-1);return true;">返回...</a><a class="button right" href="index.jsp">联系站长</a>
        <div class="clear"></div>
      </div>
    </div>
  </div>
</div>


 <!--定义js变量及方法-->
	<script language="javascript" type="text/javascript">
var second = document.getElementById('totalSecond').textContent;


if (navigator.appName.indexOf("Explorer") > -1)
{
second = document.getElementById('totalSecond').innerText; 
} else
{
second = document.getElementById('totalSecond').textContent; 
}




setInterval("redirect()", 1000); 
function redirect()
{
if (second < 0)
{


 <!--定义倒计时后跳转页面-->
location.href = 'http://www.baidu.com'; 
} else
{
if (navigator.appName.indexOf("Explorer") > -1)
{
document.getElementById('totalSecond').innerText = second--; 
} else
{
document.getElementById('totalSecond').textContent = second--; 
}
}
}
</script>
</html>
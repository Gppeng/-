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
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/base.css" />
	<link rel="stylesheet" href="css/layout.css"/>
	<script src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		function checkUser(user){
				var name = user.value;
				$.post("user/ajaxlogin.do",{name:name},function(data){
					$("#reemg").html(data);
				});
			};
			function checkSpan(){
				$("#reemg").html("");
			};
	</script>
  </head>
  <body>
	<div id="wrapper">
		<header id="header">
			<div id="loginBar">
				<div class="w960 tr">
					<a href="login.jsp">登录</a> <span class="sp">|</span> <a href="regist.jsp">注册</a>
				</div>
			</div>
			<div id="headBox">
				
			</div>
		</header><!-- // header end -->
		<div class="container w960 mt20">
			<div id="processor" >
				<ol class="processorBox oh">
					<li class="current">
						<div class="step_inner fl">
							<span class="icon_step">1</span>
							<h4>填写基本信息</h4>
						</div>
					</li>
					<li>
						<div class="step_inner">
							<span class="icon_step icon_step2">2</span>
							<h4>邮箱激活</h4>
						</div>
					</li>
					<li>
						<div class="step_inner fr">
							<span class="icon_step" onclick="hh()">3</span>
							<h4>完善资料</h4>
						</div>
					</li>
				</ol>
				<div class="step_line"></div>
			</div>
			<div class="content">
				<div id="step1" class="step hide">
					<form action="user/regist.do" method="post" id="step1_frm">
						<div class="frm_control_group">
							<label class="frm_label">邮箱</label>
							<div class="frm_controls">
								<input type="text" id="userName" name="userName" class="frm_input email" onfocus="checkSpan()" onblur="checkUser(this)" maxlength="32"/>
								<p class="frm_tips">作为登录帐号，请填写未被注册的邮箱（只支持163,qq,新浪,搜狐等邮箱）</p>
								<span id="reemg" style="color: red"></span>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">密码</label>
							<div class="frm_controls">
								<input type="password" name="password" class="frm_input passwd" maxlength="12"/>
								<p class="frm_tips">字母、数字或者英文符号，最短6位，区分大小写</p>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">再次输入密码</label>
							<div class="frm_controls">
								<input type="password" name="" class="frm_input passwd2"/>
							</div>
						</div>
						
						<div class="frm_control_group">
						</div>
						<div class="toolBar">
							<button id="nextBtn" class="btn btn_primary" onclick="javascript:next();" type="submit">提交</button>
						</div>
					</form>
				</div><!-- // step1 end -->
				<div id="step2" class="step" style="display:none">
					<div class="w330">
						<strong class="f16">感谢注册，确认邮件已发送至你的注册邮箱 : <br />haibao1024@gmail.com</strong>
						<p class="c7b">请进入邮箱查看邮件，并激活微信开放平台帐号。</p>
						<p><a class="btn btn_primary mt20" href="javascript:;">登录邮箱</a></p>
						<p class="c7b mt20">没有收到邮件？</p>
						<p>1. 请检查邮箱地址是否正确，你可以返回 <a href="index.html" class="c46">重新填写</a></p>
						<p>2. 若仍未收到确认，请尝试 <a href="index.html" class="c46">重新发送</a></p>
						<p>3. 继续完善信息<a href="javascript:next2();" class="c46">完善资料</a></p>
					</div>
				</div><!-- // step2 end -->
				<div id="step3" class="step" style="display:none">
					<form action="" method="post" id="step3_frm">
						<div class="frm_control_group">
							<label class="frm_label">真实姓名</label>
							<div class="frm_controls">
								<input type="text" name="" class="frm_input name" maxlength="32"/>
								<p class="frm_tips">请填写真实姓名</p>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">手机号</label>
							<div class="frm_controls">
								<input type="text" name="" class="frm_input phone"/>
								<p class="frm_tips">请填写常用手机号</p>
							</div>
						</div>
						<div class="frm_control_group">
							<label class="frm_label">手机验证码</label>
							<div class="frm_controls">
								<input type="text" name="" class="frm_input phoneYzm"/>
								<input type="button" value="获取验证码" class="btn btn_default" />
							</div>
						</div>
						<div class="toolBar">
							<a id="finishedBtn" class="btn btn_primary" href="javascript:;">完成</a>
						</div>
					</form>
				</div><!-- // step3 end -->
			</div>
		</div><!-- // container end -->
		<footer id="footer" class="w960 oh">
			<span class="fl">适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</span>
			<nav class="footNavs tr fr">
				<a href="#">来源：<a href="http://www.xmoban.cn/" target="_blank">时尚最前沿 </a></a>
			</nav>
		</footer><!-- // footer end -->
	</div><!-- // wrapper end -->
	<script> 
		//显示提示框，目前三个参数(txt：要显示的文本；time：自动关闭的时间（不设置的话默认1500毫秒）；status：默认0为错误提示，1为正确提示；)
		function showTips(txt,time,status)
		{
			var htmlCon = '';
			if(txt != ''){
				if(status != 0 && status != undefined){
					htmlCon = '<div class="tipsBox" style="width:220px;padding:10px;background-color:#4AAF33;border-radius:4px;-webkit-border-radius: 4px;-moz-border-radius: 4px;color:#fff;box-shadow:0 0 3px #ddd inset;-webkit-box-shadow: 0 0 3px #ddd inset;text-align:center;position:fixed;top:25%;left:50%;z-index:999999;margin-left:-120px;"><img src="img/regist/ok.png" style="vertical-align: middle;margin-right:5px;" alt="OK，"/>'+txt+'</div>';
				}else{
					htmlCon = '<div class="tipsBox" style="width:220px;padding:10px;background-color:#D84C31;border-radius:4px;-webkit-border-radius: 4px;-moz-border-radius: 4px;color:#fff;box-shadow:0 0 3px #ddd inset;-webkit-box-shadow: 0 0 3px #ddd inset;text-align:center;position:fixed;top:25%;left:50%;z-index:999999;margin-left:-120px;"><img src="img/regist/err.png" style="vertical-align: middle;margin-right:5px;" alt="Error，"/>'+txt+'</div>';
				}
				$('body').prepend(htmlCon);
				if(time == '' || time == undefined){
					time = 1500; 
				}
				setTimeout(function(){ $('.tipsBox').remove(); },time);
			}
		};
		$(document).ready(function(){
			//AJAX提交以及验证表单
			$('#nextBtn').click(function(){
				var email = $('.email').val();
				var passwd = $('.passwd').val();
				var passwd2 = $('.passwd2').val();
				var verifyCode = $('.verifyCode').val();
				var EmailReg = /^([a-zA-Z0-9_\.\-])+\@((sohu)|(sina)|(163)|(qq))\.com$/g; //邮件正则
				
				if(email == ''){
					showTips('请填写您的邮箱~');
					return false;
				}else if(!EmailReg.test(email)){
					showTips('您的邮箱格式错咯~');
					return false;
				}else if(passwd == ''){
					showTips('请填写您的密码~');
					return false;
				}else if(passwd2 == ''){
					showTips('请再次输入您的密码~');
					return false;
				}else if(passwd != passwd2 || passwd2 != passwd){
					showTips('两次密码输入不一致呢~');
					return false;
				}else{
					showTips('提交成功进行下一步',1000,1);
					return next();
				}
				return true;
			});
			function next(){
				$('#step1').hide();
				$('#step2').show(1000);
				$('.icon_step2').css("background-color","#64BD2E");
				$('.processorBox li').removeClass('current').eq(i).addClass('current');
				
			}
			//切换步骤（目前只用来演示）
			$('.processorBox li').click(function(){
				var i = $(this).index();
				$('.processorBox li').removeClass('current').eq(i).addClass('current');
				$('.step').fadeOut(300).eq(i).fadeIn(500);
			});
			
		});
	</script>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		<title>专题</title>
		<link rel="stylesheet" href="css/index.css" />
	</head>
	<body>
	<div class="erweima"></div>
		<div class="headBox">
		  <div class="wrap">
		    <div class="siteLogo">
		      <div class="logo"> <a href="http://news.efu.com.cn/" title="服装新闻"> <img src="img/logo.png" width="270" height="70" alt="服装新闻"  /></a> </div>
		    </div>
		    <div class="icoNav"> 
				<!--
                	作者：1033645830@qq.com
                	时间：2016-10-20
                	描述：这里少登录注册第三方
                -->
                <c:if test="${user.userName==null }">
	                <a href=""><img src="img/icon/qq.png" width="35" height="35"></a>
	                <a href="" id="wechat"><img src="img/icon/wechat.png" width="35" height="35"/></a>
	                <a href=""><img src="img/icon/weibo.jpg" width="50" height="40"/></a>
	                <a href="login.jsp"><img src="img/icon/15.png" width="60" height="20" ></a>
	                <a href="login.jsp"><img src="img/icon/16.png" width="60" height="20" ></a>
				</c:if>
				<c:if test="${user.userName!=null}">
					<a href=""><img src="img/icon/qq.png" width="35" height="35"></a>
	                <a href="" id="wechat"><img src="img/icon/wechat.png" width="35" height="35"/></a>
	                <a href=""><img src="img/icon/weibo.jpg" width="50" height="40"/></a>
					<a href=""><img src="${user.pic }" width="30px" height="30px" style="border-radius:50%"><br>${user.userName }</a>
					<a href="">退出</a>
				</c:if>
			</div>
		    <div class="Menu">
		      <ul>
		       <li class="ln1"><a href="index.jsp" rel="nofollow">首页</a></li>
		        <li class="ln2"><a href="industry.jsp">行业</a></li>
		        <li class="ln3"><a href="brand.jsp">品牌</a></li>
		        <li class="ln4"><a href="person.jsp">人物</a></li>
		        <li class="ln5"><a href="activity.jsp">活动</a></li>
		        <li class="ln6"><a href="subject.jsp">专栏</a></li>
		      </ul>
		    </div>
	  	  </div>
		</div>
		<div class="wrap clearfix mtop20 ColorOfSubject">
			<!--左侧-->
			<div class="leftNav">
				<div class="leftNavMain" id="header-nav">
					<h1><a href="">专题</a></h1>
					<ul>
						<li><h2><a href="">品牌</a></h2></li>
					</ul>
				</div>
			</div>
			<!--内容-->
			<div class="Main">
				<div class="Main-topic">
					<div class="subjectpic">
						<div class="twosides fl">
 							<ul>
							<li><a href="" target="_blank"><img src="img/subject/subject2.jpg" width="300" height="165" title="那些「暗黑控」设计师背后的理念是这样的"></a><strong><a href="/topic/2860/" target="_blank" title="那些「暗黑控」设计师背后的理念是这样的">那些「暗黑控」设计师背后的理念是这样的</a></strong></li>
							<li><a href="" target="_blank"><img src="img/subject1.jpg" width="300" height="165" title="第20届宁波国际服装节"></a><strong><a href="/topic/2818/" target="_blank" title="第20届宁波国际服装节">第20届宁波国际服装节</a></strong></li>
 							</ul>
 						</div>
						<div class="fl mid">
						 	<a href="" target="_blank">
						<img src="img/subject/subject3.jpg" width="490" height="300"></a>
						 <strong>
							<a href="" target="_blank">第20届宁波国际服装节</a>
						 </strong>
						</div>
						<div class="fr twosides">
 							<ul>
								<li><a href="" target="_blank"><img src="img/subject/subject4.jpg" width="300" height="165" title="第17届中国国际丝绸博览会"></a><strong><a href="/topic/2857/" target="_blank" title="第17届中国国际丝绸博览会">第17届中国国际丝绸博览会</a></strong></li>
								<li><a href="" target="_blank"><img src="img/subject/subject2.jpg" width="300" height="165" title="2016中国国际针织（秋冬）博览会"></a><strong><a href="/topic/2825/" target="_blank" title="2016中国国际针织（秋冬）博览会">2016中国国际针织（秋冬）博览会</a></strong></li>
 							</ul>
  						</div>
					</div>
					<div class="box subject">
						<h1>近期专题</h1>
						<ul id="newslistcontent">
							<li>
								<div class="topicSimg">
									<a href="" target="_blank"><img src="img/subject/01.jpg" title=""></a>
								</div>
								<div class="tt">
									<strong><a href="" target="_blank" title="">2016秋季博览会</a></strong>
									<p>汇聚全球各类正装面料、女装面料
										、休闲装面料、功能运动装面料、衬衫面料、
										牛仔面料、花样设计、内衣/ 泳装面料及辅料，
										被中国服装企业的设计与采购部门视为采样订购的首选博览会。
									</p>
								</div>
							</li>
							<li>
								<div class="topicSimg">
									<a href="" target="_blank"><img src="img/subject/01.jpg" title=""></a>
								</div>
								<div class="tt">
									<strong><a href="" target="_blank" title="">2016秋季博览会</a></strong>
									<p>汇聚全球各类正装面料、女装面料
										、休闲装面料、功能运动装面料、衬衫面料、
										牛仔面料、花样设计、内衣/ 泳装面料及辅料，
										被中国服装企业的设计与采购部门视为采样订购的首选博览会。
									</p>
								</div>
							</li>
							<li>
								<div class="topicSimg">
									<a href="" target="_blank"><img src="img/subject/01.jpg" title=""></a>
								</div>
								<div class="tt">
									<strong><a href="" target="_blank" title="">2016秋季博览会</a></strong>
									<p>汇聚全球各类正装面料、女装面料
										、休闲装面料、功能运动装面料、衬衫面料、
										牛仔面料、花样设计、内衣/ 泳装面料及辅料，
										被中国服装企业的设计与采购部门视为采样订购的首选博览会。
									</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	<script>
	var strHtml = "";
    strHtml='<div class="mapLink" id="footerL">';
    strHtml += '<div class="wrap clearfix">';
    strHtml += '<div class="mapLink-cell line-2">';
    strHtml += '<dl>';
    strHtml += ' <dt>品牌</dt>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">大牌</a>';
    strHtml += ' </dd>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">男装</a>';
    strHtml += '</dd>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">女装</a>';
    strHtml += ' </dd>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">休闲</a>';
    strHtml += ' </dd>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">运动</a>';
    strHtml += ' </dd>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">服饰</a>';
    strHtml += '</dd>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">综合</a>';
    strHtml += '</dd>';
    strHtml += '</dl>';
    strHtml += '</div>';
    strHtml += '<div class="mapLink-cell"> ';
    strHtml += '<dl> ';
    strHtml += ' <dt>人物</dt>';
    strHtml += '  <dd> ';
    strHtml += '   <a href="">领袖</a>';
    strHtml += '</dd>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">设计师</a>';
    strHtml += '</dd>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">专家</a>';
    strHtml += ' </dd>';
    strHtml += '  <dd> ';
    strHtml += '   <a href="">综合</a>';
    strHtml += ' </dd>';
    strHtml += ' </dl>';
    strHtml += '</div>';
    strHtml += '<div class="mapLink-cell line-2"> ';
    strHtml += '<dl>';
    strHtml += ' <dt>产业</dt>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">电商</a>';
    strHtml += '</dd>';
    strHtml += '  <dd> ';
    strHtml += '   <a href="">零售</a>';
    strHtml += '</dd>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">批发</a>';
    strHtml += '</dd>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">设备</a>';
    strHtml += '</dd>';
    strHtml += '  <dd> ';
    strHtml += '   <a href="">科技</a>';
    strHtml += ' </dd>';
    strHtml += '</dl>';
    strHtml += '</div>';
    strHtml += '<div class="mapLink-cell">';
    strHtml += '<dl>';
    strHtml += ' <dt>活动</dt>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">订货会</a>';
    strHtml += '</dd>';
    strHtml += '  <dd> ';
    strHtml += '   <a href="">展会</a>';
    strHtml += ' </dd>';
    strHtml += '  <dd> ';
    strHtml += '   <a href="">时装周</a>';
    strHtml += '</dd>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">大赛</a>';
    strHtml += '</dd>';
    strHtml += '</dl>';
    strHtml += '</div>';
    strHtml += '<div class="mapLink-cell">';
    strHtml += '<dl>';
    strHtml += ' <dt>专题</dt>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">品牌</a>';
    strHtml += '</dd>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">人物</a>';
    strHtml += '</dd>';
    strHtml += '  <dd>';
    strHtml += '   <a href="">活动</a>';
    strHtml += '</dd>';
    strHtml+= ' <dd> '
    strHtml+= ' <a href = "" > 招商 </a>';
    strHtml+= '   </dd> ';
    strHtml+= ' </dl>';
    strHtml+= '</div > ';
    strHtml+=' <div class = "mapLink-cell"> ';
    strHtml+= ' <dl> ';
    strHtml+= ' <dt> 关于资讯 </dt>';
    strHtml+= '  <dd>';
    strHtml+= '   <a href="">关于我们</a>';
    strHtml+= ' </dd>';
    strHtml+= '  <dd>';
    strHtml+= '   <a href="">联系我们</a>';
    strHtml += '</dd>';
    strHtml += '    </dl>';
    strHtml += '</div>';
    strHtml += '   </div>';
    strHtml+='</div>';
  	document.write(strHtml);
	</script>
	<!--底部-->
	<div id="footer">
		  <div id="footer-v0">
		    <div class="footer-container">
		      <div class="efu-group">
		        <dl>
		          <dt><a href="" rel="nofollow" target="_blank">时尚最前沿</a> | </dt>
		          <dd><a href="" rel="nofollow" target="_blank">服务项目</a> | </dd>
		          <dd><a href="" rel="nofollow" target="_blank">会员专区</a> | </dd>
		          <dd><a href="" rel="nofollow" target="_blank">诚聘英才</a> | </dd>
		          <dd><a href="" rel="nofollow" target="_blank">荣誉资质</a> | </dd>
		          <dd><a href="" rel="nofollow" target="_blank">法律声明</a> | </dd>
		          <dd><a href="" rel="nofollow" target="_blank">联系我们</a> </dd>
		        </dl>
		      </div>
		      <div class="efu-pages">
		        <p id="copyright"> 时尚版权所最前沿所有 2016-2016 网络实名：</p>
		        <ul>
		          <li> <a href="" target="_blank">时尚最前沿</a> |</li>
		          <li><a title="网站导航" target="_blank" href="">网站导航</a></li>
		        </ul>
		      </div>
		    </div>
		  </div>
		</div>
	</body>
</html>

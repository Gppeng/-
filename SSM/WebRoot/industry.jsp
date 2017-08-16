<%@page import="com.lzh.domain.News"%>
<%@page import="com.lzh.util.ConfigUtil"%>
<%@page import="com.lzh.service.NewsService"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
NewsService ns=(NewsService)ConfigUtil.getBean(NewsService.SERVER_NAME);
List<News> in_list=ns.getNewsByType("行业");
List<News> date_list=ns.getByDateAndRead();
List<News> week_list=ns.getByWeekAndRead();
List<News> month_list=ns.getByMonthAndRead();
List<News> read_list=ns.getByRead();
News maxRead=ns.getMaxByType("行业");
request.setAttribute("readMax", maxRead);
request.setAttribute("in_list",in_list);
request.setAttribute("read_list", read_list);
request.setAttribute("date_list", date_list);
request.setAttribute("week_list", week_list);
request.setAttribute("month_list", month_list);
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
		<title>行业</title>
		<link rel="stylesheet" href="css/index.css" />
		<script type="text/javascript" src="js/jquery-1.8.3.min.js" ></script>
		<script type="text/javascript" src="js/index.js" ></script>
	</head>
	<body>
	<div class="erweima"></div>
		<div class="headBox">
		  <div class="wrap">
		    <div class="siteLogo">
		      <div class="logo"> <a href="http://news.efu.com.cn/" title="服装新闻"> <img src="img/logo.png" width="270" height="70" alt="服装新闻"  /></a> </div>
		    </div>
		     <div class="icoNav"> 
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
					<a href="user/outLogin.do">退出</a>
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
	<div class="wrap clearfix mtop20 ColorOfTopic" >
		<!--左侧导航-->
		 <div class="leftNav">
		    <div class="leftNavMain" id="header-nav">
		      <h1><a href="#">行业</a></h1>
		      <ul>
		        <li><h2><a href="#">电商</a></h2></li>
		        <li><h2><a href="">零售</a></h2></li>
		        <li><h2><a href="">批发</a></h2></li>
		        <li><h2><a href="">设备</a></h2></li>
		        <li><h2><a href="">技术</a></h2></li>
		      </ul>
		    </div>
		  </div>
		  <!--右侧主要内容-->
		  <div class="Main">
		  	<div class="Main-left">
		  		 
		  		<div class="headNews">
		  			
		            <div class="headNews_lt"> <a href="news/getId?gid=${readMax.id }" class="headNewsImg"  target="_blank"> <img src="${readMax.attpic }" width="588" height="401"> </a> </div>
		            <div class="headNews_rt">
		            	
		              <div class="headNews_rtbd">
		                <strong><a href="news/getId.do?gid=${readMax.id }" target="_blank">${readMax.title}</a></strong>
		                <p>${readMax.content }</p>
		              </div>
		              <div class="headNews_trbs">
		              </div>
            		</div>
         		</div>    
         		
         		<!--新闻列表-->
         		<!--样式转换-->
         		<div class="bNlist">
         			 <div class="news_slide" id="news_slide">
			          <div class="newsslidebd">			          	
						<span class="a1"></span>
			          	<span class="a2"></span>	
			          	<div class="test" width="100" style="background: #000;"></div>
			          </div>
			        </div>
			    <!--新闻-->   
			        <div class="listview" id="newslistcontent">				        	
			            <c:forEach items="${in_list }" var="indut">
			            <div class="news_li" id="news_li">
			              <div class="news_tu"> 
			              <a href="news/getId.do?gid=${indut.id }" class="tiptitleImg" target="_blank">
			              <img src="${indut.attpic }" width="270" height="200">
			              </a> </div>
			              <strong><a href="news/getId.do?gid=${indut.id }" target="_blank">${indut.title }</a></strong>
			              <p>${indut.content }</p>
			              <div class="pdtt_trbs"> <a href="#">${indut.twotype }</a> <span>${indut.post_time }</span> <span class="trbszan">${indut.readcount }</span>
			              </div>
			            </div>
			            </c:forEach> 	
			        </div>
	         	</div>
		  	</div>
		  	<div class="Main-right">
		  		<div class="allTitle ">
				<h2>热门新闻</h2>
				</div>
				<div class="hotNews">
					<div class="hotNews-title" id="hotNews-title"><ul><li><a>一天</a></li><li><a>一周</a></li><li><a>一月</a></li></ul></div>
					<div class="hotNews-con">
						<ul class="list_hot">
				<c:forEach items="${date_list}" var="news">
					<li><span class="nhot1"></span><a href="">${news.title }</a></li>
				</c:forEach>
					<div class="more"><a href="">更多热闻</a></div>
				</ul>
				<ul class="list_hot" style="display: none;">
				<c:forEach items="${week_list }" var="news">
					<li><span class="nhot2"></span><a href="">${news.title }</a></li>
				</c:forEach>	
					<div class="more"><a href="">更多热闻</a></div>
				</ul>
				<ul class="list_hot" style="display: none;">
				<c:forEach items="${month_list }" var="news">	
					 <li> <span class="nhot1"></span> <a target="_blank" href="">${news.title }</a> </li>
				</c:forEach>	
					<div class="more"><a href="">更多热闻</a></div>
				</ul>
					</div>
				</div>
		  		<div class="allTitle mtop20">
      			<h3>快讯</h3>
			    </div>
			    <div class="hotNews">
			      <div class="hotNews-con">
			        <ul class="list_hot">
			        <c:forEach items="${read_list}" var="read">
			          <li> <span class="nhot1"></span> <a target="_blank" href="news/getId?gid=${read.id}">${read.title }</a> </li>
			         </c:forEach>
			         </ul>
			      </div>
			    </div>
				<div class="more"><a href="">更多快讯</a></div>
    			   <div class="slideTxtBox mtop20">
					<div class="hd" id="hd">
						<ul><li>招商</li><li>专题</li><li>品牌</li><li>地区</li></ul>
					</div>
					<div class="bd">
						<ul class="words">
							<li><a href="" target="_blank">艺域</a></li>       
						</ul>
						<ul class="words" style="display: none;">
							<li><a href="" target="_blank">金蝶茜妮女装签约明星高利虹</a></li>       
						</ul>
		                <ul class="words" style="display: none;">
							<li><a href="" target="_blank">班顿</a></li>       
						</ul>
		                <ul  class="words" style="display: none;">
						    <li><a href="" target="_blank">服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-440000-440100-1.html" target="_blank">广州服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-440000-440300-1.html" target="_blank">深圳服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-440000-441900-1.html" target="_blank">东莞服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-330000-330100-1.html" target="_blank">杭州服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-330000-330200-1.html" target="_blank">宁波服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-330000-330300-1.html" target="_blank">温州服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-110000-0-1.html" target="_blank">北京服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-310000-0-1.html" target="_blank">上海服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-420000-420100-1.html" target="_blank">武汉服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-440000-442000-1.html" target="_blank">中山服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-350000-350500-1.html" target="_blank">泉州服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-810000-0-1.html" target="_blank">香港服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-710000-0-1.html" target="_blank">台湾服装</a></li><li><a href="http://brand.efu.com.cn/list-1-0-0-0-500000-0-1.html" target="_blank">重庆服装</a></li>
						</ul>

			</div>
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


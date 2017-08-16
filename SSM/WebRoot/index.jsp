<%@page import="com.lzh.domain.News"%>
<%@page import="com.lzh.domain.Page"%>
<%@page import="com.lzh.util.ConfigUtil"%>
<%@page import="com.lzh.service.NewsService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
NewsService ns=(NewsService)ConfigUtil.getBean(NewsService.SERVER_NAME);
Page page2=new Page(1,10);
List<News> news_list=ns.getNews(page2);	
List<News> date_list=ns.getByDateAndRead();
List<News> week_list=ns.getByWeekAndRead();
List<News> month_list=ns.getByMonthAndRead();
request.setAttribute("news_list", news_list);
request.setAttribute("date_list", date_list);
request.setAttribute("week_list", week_list);
request.setAttribute("month_list", month_list);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.8.3.min.js" ></script>
		<script type="text/javascript" src="js/index.js" ></script>
		<link rel="stylesheet" href="css/index.css" />
  </head>
  
	<body>
		<div class="erweima"></div>
		<!--
        	作者：1033645830@qq.com
        	时间：2016-10-22
        	描述：登录注册
        -->
      
		<div class="headBox">
		  <div class="wrap">
		    <div class="siteLogo">
		      <div class="logo"> <a href="" title="服装新闻"> <img src="img/logo.png" width="270" height="70" alt="服装新闻"  /></a> </div>
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
	                <a href="regist.jsp"><img src="img/icon/15.png" width="60" height="20" style="margin-top: 10px"></a>
	                <a href="login.jsp"><img src="img/icon/16.png" width="60" height="20" style="margin-top: 10px"></a>
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
		<div class="wrap">
  <!--首页大图推荐-->
  <div class="topImg mtop20">
  <div class="tiLeft"> <a href="new01.jsp" target="_blank"> <img src="upload/12.jpg" width="588" height="401"></a>
	 <div class="title">
		<p> <a href="new01.jsp" target="_blank">匹克私有化获得通过，光大等国有券商成认购方</a> </p>
	 </div>
	  </div>
	 <div class="tiRight">
	 <c:forEach items="${news_list}" var="news">
	  <div class="rCell">
		<a href="news/getId.do?gid=${news.id }" target="_blank"> <img src="${news.attpic }" width="270" height="200"></a>
		<div class="title">
	 	<p> <a href="news/getId.do?gid=${news.id }" target="_blank">${news.title }</a> </p>
		</div>
		<a href="news/getId.do?gid=${news.id}"  target="_blank"></a> 
	  </div>
	  </c:forEach>
 </div>
  </div> 
<!--首页新闻内容-->
	<div class="indexLeft mtop20">
		<div class="tabBox">
			<ul><li>全部</li></ul>
		</div>
		<div class="indexTplist">
			<ul id="newslistcontent">
				<c:forEach items="${news_list}" var="news">
				<li>
					<div class="pic"><a href="" target="_blank"><img src="${news.attpic}" width="270" height="200" title="${news.attpic }"></a></div>
					<div class="txt">
						 <h3> <a href="news/getId.do?gid=${news.id }" target="_blank" class="grey">${news.title}</a> </h3>
							  <p>${news.content}</p>
							  <i><a href="news/getId.do?gid=${news.id }" target="_blank">${news.type}</a><span>${news.post_time}</span><span class="trbszan">${news.readcount}</span></i>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div class="indexRight mtop20">
		<!--热门新闻-->
		<div class="allTitle">
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
			<h2>专题</h2>
		</div>
		<div class="topicShow mtop10">
			<ul>
				<li><a href="" title="第二十届服装节" target="_blank"><img src="img/subject1.jpg" width="300" height="124"></a>
					<strong><a href="">第二十届宁波服装节</a></strong>
				</li>
			</ul>
			<div class="more"> <a href="">更多专题</a> </div>
		</div>
	</div>
	
	<!--footer-->
	<!--友情链接-->
	<div class="friendLink clearfix">
		<div class="cona">友情链接</div>
		<div class="conb">
			<ol>
				<li>服装资讯</li>
					<li>服装资讯</li>
						<li>服装资讯</li>
							<li>服装资讯</li>
								<li>服装资讯</li>
									<li>服装资讯</li>
										<li>服装资讯</li>
											<li>服装资讯</li>
												<li>服装资讯</li>
			</ol>
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


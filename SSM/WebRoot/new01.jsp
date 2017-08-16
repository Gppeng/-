<%@page import="com.lzh.domain.Discuss"%>
<%@page import="com.lzh.util.ConfigUtil"%>
<%@page import="com.lzh.service.DiscussService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
DiscussService ds=(DiscussService)ConfigUtil.getBean(DiscussService.SERVER_NAME);
int id=Integer.parseInt(request.getParameter("gid"));
List<Discuss> list=ds.getByNid(id);
request.setAttribute("discuss_list", list);
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
		<link rel="stylesheet" href="css/index.css" />
		<link rel="stylesheet" href="css/news.css" />
		<link rel="stylesheet" href="css/semantic.css" />
		<script type="text/javascript" src="js/jquery-1.8.3.min.js" ></script>
		<script type="text/javascript" src="js/index.js" ></script>
		<title>时尚新闻</title>
	</head>
	<body>
	<%
    Integer hitsCount = 
      (Integer)application.getAttribute("hitCounter");
    if( hitsCount ==null || hitsCount == 0 ){
       /* 第一次访问 */
       hitsCount = 1;
    }else{
       /* 返回访问值 */
       hitsCount += 1;
    }
    application.setAttribute("hitCounter", hitsCount);
	%>
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
	                <a href="login.jsp"><img src="img/icon/15.png" width="60" height="20" style="margin-top: 10px"></a>
	                <a href="login.jsp"><img src="img/icon/16.png" width="60" height="20" style="margin-top: 10px"></a>
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
		<div class="wrap clearfix mtop20">
		<!--内容-->
		<div class="Main-article">
			<div class="article-view">
				<div class="where"><strong>当前位置</strong>
					<a href="">${news.type}</a>&gt;<a href="">${news.twotype}</a>&gt;
						${news.title }
				</div>
				<div class="article-header">
					<h1>${news.title }</h1>
					<p>${news.content } </p>
				</div>
				<!--新闻标签-->
				<div class="article-info">
					<p class="info-s">
						<span class="date">${news.post_time }</span>
						<span class="comment-num">浏览：<%= hitsCount%></span>
						<span class="comment-num">编辑者：${news.editor }</span>
					</p>
					<p><span class="tags">${news.href }</span></p>
				</div>
				<!--新闻正文-->
				<div class="article-main">
					<div class="article-content">
						<p align="center"><img src="${news.attpic }"></p>
						${news.introduction}
					</div>
				</div>
				<!--新闻来源-->
				<div class="article-source">
		           <p>来源：懒熊体育</p>
		        </div>
			</div>
			<div class="re-article">
			<h3 class="title-view"><span class="title-box"><i class="blue tag icon"></i>评论</span></h3>
			<div class="article-box">
				<!--<form action="" method="">
    				<div class="text">
    					<textarea></textarea><br>
    					<button type="submit" class="button">发帖</button>
    				</div>
  				</form>-->
  				
  				<div class="ui comments">
  				<c:if test="${user.userName!=null }">
  					<form class="ui reply form" action="discuss/insert.do?nid=${news.id}&uid=${user.id }" method="post">
				    <div class="field">
				      <textarea name="content"></textarea>
				    </div>
				    <button class="ui blue labeled submit icon button" style="float: right;" type="submit"><i class="icon edit"></i> 发表评论 </button>
				  </form>
				 </c:if>
				 <c:if test="${user.userName==null }">
				 <span class="ui blue labeled">请登录发表评论</span>
				 </c:if>
				  <h3 class="title-view "><span class="title-box"><i class="after blue tags icon"></i>网友观点</span></h3>
				  <c:forEach items="${discuss_list}" var="discuss">
				  <c:if test="${discuss.did==0}">
				  <div class="comment">
				    <a class="avatar">
				      <img src="${discuss.user.pic}" title="${discuss.user.pic}">
				    </a>
				    <div class="content">
				      <a class="author">${discuss.user.userName }</a>
				      <div class="metadata">
				        <span class="date">${discuss.post_time }</span>
				      </div>
				      <div class="text">${discuss.content }</div>
				      <div class="actions">
				        <a class="reply" href="discuss/godiscuss.do?id=${discuss.id }&nid=${news.id}">回复</a>
				      </div>
				    </div>
				  </div>
				  </c:if>
				  </c:forEach>
				  <div class="comment">
				    <a class="avatar">
				      <img src="/images/avatar/small/elliot.jpg">
				    </a>
				    <div class="content">
				      <a class="author">小黄人</a>
				      <div class="metadata">
				        <span class="date">Yesterday at 12:30AM</span>
				      </div>
				      <div class="text">
				        <p>出乎我的意料！竟然有这种人。</p>
				      </div>
				      <div class="actions">
				        <a class="reply">回复</a>
				      </div>
				    </div>
				    <div class="comments">
				      <div class="comment">
				        <a class="avatar">
				          <img src="/images/avatar/small/jenny.jpg">
				        </a>
				        <div class="content">
				          <a class="author">Jenny Hess</a>
				          <div class="metadata">
				            <span class="date">Just now</span>
				          </div>
				          <div class="text">Elliot you are always so right :) </div>
				          <div class="actions">
				            <a class="reply">回复</a>
				          </div>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
			</div>	
		</div>
		
	
		<!---->
		<div class="Main-right">
			<div class="allStitle"><i class="ui tag red label">精选</i></div>
			<div class="subject_list mtop20">
				<img src="img/subject/01.jpg" width="250p" height="200"/>
				<a href="">第二十届宁波服装节</a>
			</div>
			<div class="subject_list mtop20">
				<img src="img/subject/subject2.jpg" width="250p" height="200"/>
				<a href="">第二十届宁波服装节</a>
			</div>
			<div class="subject_list mtop20">
				<img src="img/subject/subject4.jpg" width="250p" height="200"/>
				<a href="">第二十届宁波服装节</a>
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

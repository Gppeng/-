<%@page import="com.lzh.domain.News"%>
<%@page import="com.lzh.util.ConfigUtil"%>
<%@page import="com.lzh.service.NewsService"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
NewsService ns=(NewsService)ConfigUtil.getBean(NewsService.SERVER_NAME);
List<News> news_list=ns.getNewsByType("人物");
List<News> read_list=ns.getByRead();
News maxRead=ns.getMaxByType("人物");
request.setAttribute("readMax", maxRead);
request.setAttribute("read_list", read_list);
request.setAttribute("new_list", news_list);
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
		<title>人物</title>
		<link rel="stylesheet" href="css/index.css" />
		<script type="text/javascript" src="js/jquery-1.8.3.min.js" ></script>
		<script type="text/javascript" src="js/index.js"></script>
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
	<div class="wrap clearfix mtop20 ColorofPerson" >
		<!--左侧导航-->
		 <div class="leftNav">
		    <div class="leftNavMain" id="header-nav">
		      <h1><a href="#">人物</a></h1>
		      <ul>
		        <li><h2><a href="#">领袖</a></h2></li>
		        <li><h2><a href="">设计师</a></h2></li>
		        <li><h2><a href="">专家</a></h2></li>
		        <li><h2><a href="">综合</a></h2></li>
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
		              	<img src="img/tuijian02.gif" />
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
			        <div class="newsbox listview" id="newslistcontent">
			              <c:forEach items="${new_list}" var="nt">
			            <div class="news_li">
			              <div class="news_tu"> <a href="news/getId.do?gid=${nt.id }" class="tiptitleImg" target="_blank">
			              <img src="${nt.attpic }" width="270" height="200">
			              </a> </div>
			              <strong><a href="news/getId.do?gid=${nt.id }" target="_blank">${nt.title }</a></strong>
			              <p>${nt.content }</p>
			              <div class="pdtt_trbs"> <a href="#">${nt.twotype}</a> <span>${nt.post_time }</span> <span class="trbszan">${news.readcount }</span>
			              </div>
			            </div> 
			         	</c:forEach>  
			            
			        </div>
	         	</div>
		  	</div>
		  	<div class="Main-right">
		  		<div class="allStitle">
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
	<script>
	$(function(){
		//选项卡切换
        //导航高亮
        $('#hd li').hover(function(){
            $(this).addClass('on')                //当前li高亮
                .siblings().removeClass('on'); //其他同辈li取消高亮
            //获取当前元素的索引
            var index = $(this).index();
            //利用索引将li和div联系起来
            $('.bd ul').eq(index).show()    //对应的内容显示
                .siblings().hide();  //其他同辈div隐藏
        })
  
	})		
	</script>
</html>


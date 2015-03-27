<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>金风科技供应链电子商务网</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/static/css/index.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/static/pages/header.jsp"></jsp:include>
	<div class="center">
		<div class="c_1">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			  <!-- Indicators -->
			  <ol class="carousel-indicators">
			  	 <c:forEach var="top" items="${topList}" varStatus="s">
			  	 	 <c:choose>  
		               <c:when test="${s.first}">
		               		<li data-target="#carousel-example-generic" data-slide-to="${s.index}" class="active"></li>
		               </c:when>
		                <c:otherwise>
		                	<li data-target="#carousel-example-generic" data-slide-to="${s.index}"></li>
		                </c:otherwise>
		             </c:choose>
			  	 </c:forEach>
			  </ol>
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
				  <c:forEach var="top" items="${topList}" varStatus="s">
				 	 <c:choose>  
		               <c:when test="${s.first}">
					   		<div class="item active">
						      <img   src="<%=request.getContextPath()%>/${top.url}" style="width: 770px;height: 350px;">
						      <div class="carousel-caption">
						      </div>
						    </div>
					   </c:when>  
		               <c:otherwise>
							<div class="item">
						      <img   src="<%=request.getContextPath()%>/${top.url}" style="width: 770px;height: 350px;">
						      <div class="carousel-caption">
						      </div>
						    </div>
					   </c:otherwise>  
		          	 </c:choose> 
				 </c:forEach>
			   </div>
			   <!--  <div class="item active">
			      <img   src="/static/images/img1.png">
			      <div class="carousel-caption">
			      </div>
			    </div>
			    <div class="item">
			      <img src="/static/images/img2.png">
			   	   <div class="carousel-caption">
			      </div>
			    </div>
			  
			  Controls
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			   -->
			</div>
			<div class="login_cont">
				<div class="login">				
					<div class="login_top">
						<span class="login_txt">登录</span>
						<span class="place hot">&nbsp;</span>
						<span class="language_txt hot"><span class="target_language">中文</span><span>&nbsp;&nbsp;&nbsp;</span>
							<select  multiple class="form-control languageSel" style="height: 50px;font-size: 12px">
							  <option value="ZHS" selected="selected">中文</option>
							  <option value="US" >English</option>
							</select>
						</span>
					</div>
					<c:choose>  
		               <c:when test="${sessionScope.loginUser!=null}">
		               		<div class="login_mid" id="unlogin" style="display: none">
		               </c:when>
		               <c:otherwise>
		               		<div class="login_mid" id="unlogin" style="display: block">
		               </c:otherwise>
		            </c:choose>
						<div class="username_txt">用户名:</div>
						<div class="username">
							<input type="text" class="form-control" name="username" id="username">
						</div>
						<div  class="password_txt">口令:</div>
						<div class="password">
							<input type="password" class="form-control" name="password" id="password">
						</div>
						<div class="error_info"></div>
						<div class="logint_btn" onclick="submit()">登录</div>
						<a href="javascript:void(0)" onclick="window.open('${register}')" class="regist">供应商注册</a>
					</div>
					<c:choose>  
		               <c:when test="${sessionScope.loginUser!=null}">
		               		<div class="login_mid" style="display: block" id="loginsuccess">
		               </c:when>
		               <c:otherwise>
		               		<div class="login_mid" style="display: none" id="loginsuccess">
		               </c:otherwise>
		            </c:choose>
						<div class="login_success_bg">
								<h5 >欢迎您，<span id="loginsuccessuser">${sessionScope.loginUser}</span></h5>
								<p style="line-height: 12px;">您已成功登录系统</p>
						</div>
						<a class="enter_sys" id="enterurl" href="${sessionScope.loginUrl}"></a>
					</div>
				</div>
				<a href="<%=basePath%>front/suggestions.jsp" target="_blank" class="suggestion"></a>
			</div>
		</div>
		<div class="c_2">
			<div class="c_2_top">
				<a class="news_list" href="<%=basePath%>list/20/1?type=1" target="_blank"></a>
				<a class="notic_list" href="<%=basePath%>list/20/1?type=2" target="_blank"></a>
				<a class="rule_list"  href="<%=basePath%>list/20/1?type=3" target="_blank"></a>
				<a class="culture_list"  href="<%=basePath%>list/20/1?type=5" target="_blank"></a>
			</div>
			<div class="c_2_mid">
				<div class="news">
					<img alt="" width="255" height="82" src="${news.showPicUrl}">
					<div >
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${news.summary}...
						<a class="show_detail" href="detail?id=${news.id}" target="_blank">[查看详情]</a>
					</div>
				</div>
				<div class="notice">
					<ul>
						<c:forEach var="notic" items="${noticList}" varStatus="s">
							<li><div class="li_cont"><div class='point'></div><a  href="detail?id=${notic.id}" target="_blank">${notic.title}</a><span><fmt:formatDate value="${notic.createTime }" var="date" pattern="yyyy-MM-dd"/>${date}</span></div></li>
						</c:forEach>
					</ul>
				</div>
				<div class="rules">
					<ul>
						<c:forEach var="rule" items="${ruleList}" varStatus="s">
							<li><div class="li_cont"><div class='point'></div><a  href="detail?id=${rule.id}" target="_blank">${rule.title}</a></div></li>
						</c:forEach>
					</ul>
				</div>
				<div class="cultures">
					<ul>
						<c:forEach var="culture" items="${cultureList}" varStatus="s">
							<li><div class="li_cont"><div class='point'></div><a  href="detail?id=${culture.id}" target="_blank">${culture.title}</a></div></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/static/pages/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/index.js"></script>
</html>
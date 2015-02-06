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
<style type="text/css">
	.edui-scale{
-webkit-box-sizing:content-box;border-box:content-box;-moz-box-sizing:content-box;
}
	.center{text-align: center;background-color: white;padding:20px 40px 40px 40px}
	h1{font: 26px/65px "微软雅黑";line-height: 45px}
	.info{width: 900px;border-bottom: solid 1px #CCC;}
	.source{margin-left: 50px}
	.content{text-align: left;margin-top: 20px;width: 900px;padding:0px 10px 0px 10px; }
	.fujian{text-align: right;}
	.fujian a{cursor: pointer;margin: 0px 40px 20px 0px;}
	.fujian a:link{ color: #0068B7;  text-decoration: none}
.fujian a:visited{ color: #0068B7;  text-decoration: none}
.fujian a:hover{color: #FF7201; text-decoration: underline;}
.fujian a:active{ color: #ff7f24; text-decoration: underline;}
</style>
</head>
<body>
	<jsp:include page="/static/pages/header.jsp"></jsp:include>
	<div class="center" style="width: 980px;">
		<h1>${news.title}</h1>
		<div class="info">
			<span id="pubtime">
			发布时间：<fmt:formatDate value="${news.createTime }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>${date}
			</span>
			<span id="source">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布人：${news.createUser}
			</span>
		</div>
		<div class="content">
			${news.content }
		</div>
		<div class="fujian">
			  <c:if test="${news.url!=null && news.url!=''}">
			  	<a href="<%=basePath%>${news.url}" target="_blank">附件：${news.fileName}</a>
			  </c:if>
		</div>
	</div>
	<jsp:include page="/static/pages/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/index.js"></script>
</html>
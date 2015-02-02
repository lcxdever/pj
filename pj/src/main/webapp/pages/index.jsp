<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>后台管理系统</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/static/pages/navibar.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="<%=basePath%>front/finance/batch/manager/?pageid=1">用户管理</a></li>
					<li><a href="<%=basePath%>front/finance/orders/manager/?pageid=1">新闻管理</a></li>
					<li><a href="<%=basePath%>front/finance/export/manager/?pageid=1">关于系统</a></li>
				</ul>

			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="jumbotron">
					<h1>后台管理系统</h1>
					<p>请在左边选择要管理的项目！</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
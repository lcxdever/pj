<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
</head>
<body>
	<h1>你好，世界！</h1>
	<table class="table table-bordered nth-child table-hover">
		<thead>
			<tr>
				<td>1233</td>
				<td>4567</td>
			</tr>
		</thead>
		<c:forEach var="user" items="${list}" varStatus="s">
			<tr>
				<td>${user.userName}</td>
				<td>${user.passWord}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="navbar navbar-duomi navbar-static-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/Admin/index.html" id="logo">配置管理系统（流量包月）
				</a>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
					<li class="active"><a href="#"> <i
							class="glyphicon glyphicon-th-large"></i> 首页
					</a></li>
					<li><a href="./plans.html"> <i
							class="glyphicon glyphicon-credit-card selected"></i> 用户管理
					</a></li>
					<li><a href="./charts.html"> <i
							class="glyphicon glyphicon-calendar"></i> 图表统计
					</a></li>
					<li><a href="#"> <i class="glyphicon glyphicon-fire"></i>
							关于系统
					</a></li>

				</ul>
			</div>
			<div class="col-md-10">主窗口</div>
		</div>
	</div>
	</div>
</body>
</html>
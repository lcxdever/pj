<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
</head>
<body>
	<h1>你好，世界！</h1>
	<button type="button" class="btn btn-success">新建用户</button>
	<table class="table table-bordered nth-child table-hover">
			<thead>
				<tr>
					<th style="width: 50px;">#</th>
					<th style="width: 100px;">用户名</th>
					<th style="width: 170px;">创建时间</th>
					<th style="width: 60px;">创建人</th>
					<th style="width: 100px;">创建人</th>
				</tr>
			</thead>
		<c:forEach var="user" items="${list}" varStatus="s">
			<tr>
				<td>${s.index+1}</td>
				<td>${user.userName}</td>
				<td><fmt:formatDate value="${user.createTime }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>${date }</td>
				<td>${user.createUser}</td>
				<td>
					<button type="button" class="btn  btn-xs btn-info">修改</button>
					<button type="button" class="btn btn-xs btn-danger">删除</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<nav>
  <ul class="pagination">
    <li><a href="#"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>
  </ul>
</nav>
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
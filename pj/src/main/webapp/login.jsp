<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>金风科技后台管理-登录</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/static/css/signin.css" rel="stylesheet"/>
<style type="text/css">
</style>
</head>
<body>
	<div class="container">

		<c:if test="${ status eq 'error' }">
			<div class="alert alert-warning alert-dismissable">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
				<strong><p>${msg}</p></strong>
			</div>
		</c:if>
		<form class="form-horizontal form-signin" role="form" action="<%=path%>/back/user/login"
			method="post">
			<h2 class="form-signin-heading">金风科技后台管理</h2>
			<div class="form-group">
				<label for="username" class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="userName" id="username"
						placeholder="用户名">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input type="password" name="passWord" class="form-control" id="password"
						placeholder="密码">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="hidden" name="CSRFToken" value="${csrf}" />
					<button type="submit" class="btn btn-lg btn-primary btn-block">登陆</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>规范制度列表</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
</head>
<body onload="active('culture_manager_menu');">
	<jsp:include page="/static/pages/navibar.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<jsp:include page="/pages/left.jsp"></jsp:include>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<button type="button" class="btn btn-success" style="margin-bottom: 20px;margin-right: 10px;float: right;" onclick="location.href='<%=basePath%>pages/news/add.jsp?type=5'">新建供应链文化</button>
				<jsp:include page="/pages/news/commen.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/newscommen.js"></script>
</html>
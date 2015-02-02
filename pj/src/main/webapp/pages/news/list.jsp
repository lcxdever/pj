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
<title>Insert title here</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/static/pages/navibar.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="<%=basePath%>user/list/1">用户管理</a></li>
					<li><a href="<%=basePath%>front/finance/orders/manager/?pageid=1">新闻管理</a></li>
					<li><a href="<%=basePath%>front/finance/export/manager/?pageid=1">关于系统</a></li>
				</ul>

			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<button type="button" class="btn btn-success" style="margin-bottom: 20px;margin-right: 10px;float: right;" onclick="location.href='<%=basePath%>pages/user/add.jsp'">新建用户</button>
				<h5 style="color: red;" class="text-center">${param.msg}</h5>
				<table class="table table-bordered nth-child table-hover">
						<thead>
							<tr>
								<th style="width: 50px;">#</th>
								<th style="width: 100px;">用户名</th>
								<th style="width: 170px;">创建时间</th>
								<th style="width: 60px;">创建人</th>
								<th style="width: 100px;">操作</th>
							</tr>
						</thead>
					<c:forEach var="user" items="${list}" varStatus="s">
						<tr>
							<td>${s.index+1}</td>
							<td>${user.userName}</td>
							<td><fmt:formatDate value="${user.createTime }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>${date }</td>
							<td>${user.createUser}</td>
							<td>
								<button type="button" class="btn  btn-xs btn-info" onclick="modify('${user.id}','${user.userName}')">修改</button>
								<button type="button" class="btn btn-xs btn-danger"  onclick="del('${user.id}')">删除</button>
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
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function modify(id,name){
	var action = "<%=basePath%>pages/user/modify.jsp";
    var form = $("<form></form>")
        form.attr('action',action)
        form.attr('method','post')
    var input1 = $("<input type='hidden' name='id' />")
        input1.attr('value',id)
    var input2 = $("<input type='hidden' name='userName' />")
        input2.attr('value',name)
        form.append(input1)
        form.append(input2)
        form.appendTo("body")
        form.css('display','none')
        form.submit()
	}
	function del(id){
		if(window.confirm("您确认要删除吗")){
		var action = "<%=basePath%>user/delete";
	    var form = $("<form></form>")
	        form.attr('action',action)
	        form.attr('method','post')
	    var input1 = $("<input type='hidden' name='id' />")
	        input1.attr('value',id)
	        form.append(input1)
	        form.appendTo("body")
	        form.css('display','none')
	        form.submit()
		}}
</script>
</html>
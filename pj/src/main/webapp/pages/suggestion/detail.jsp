<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投诉与建议查看</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>

</head>
<body>
	<h1 style="width:300px; margin:10px auto 0px auto;">投诉与建议查看</h1>
	<div style="width: 800px;margin: 50px auto;">
		<table class="table table-bordered nth-child table-hover">
			<tr><td width="150px">是否匿名:</td><td width="700px">
				 <c:choose>  
       				  <c:when test="${suggestion.anonymous==1}">
       				  		是
       				  </c:when>
       				  <c:otherwise>
       				  		否
       				  </c:otherwise>
       			</c:choose>
			</td></tr>
			 <c:choose>  
       			<c:when test="${suggestion.anonymous==0}">
					<tr><td >供应商名称:</td><td >${suggestion.supplier}</td></tr>
					<tr><td>联系人:</td><td>${suggestion.contactName}</td></tr>
					<tr><td>联系方式:</td><td>${suggestion.contactWay}</td></tr>
				</c:when>
			</c:choose>
			<tr><td>建议时间：</td><td><fmt:formatDate value="${suggestion.createTime }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>${date }</td></tr>
			<tr><td>投诉与建议内容:</td><td>${suggestion.content}</td></tr>
			
		</table>
	</div>
</body>
</html>
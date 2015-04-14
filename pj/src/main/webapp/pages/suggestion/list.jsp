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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"   prefix="fn" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投诉与建议列表</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
</head>
<body onload="active('suggestion_manager_menu')">
	<jsp:include page="/static/pages/navibar.jsp"></jsp:include>
	<div class="container-fluid">
	 	<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<jsp:include page="/pages/left.jsp"></jsp:include>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<c:choose>
					 <c:when test="${message!=null}">
				   	    ${message}
				    </c:when>
					 <c:otherwise>
						<h5 style="color: red;" class="text-center">${param.msg}</h5>
						<table class="table table-bordered nth-child table-hover">
								<thead>
									<tr>
										<th  >#</th>
										<th  >建议内容</th>
										<th  >建议时间</th>
										<th  >操作</th>
									</tr>
								</thead>
							<c:forEach var="suggestion" items="${pagination.valuesList}" varStatus="s">
								<tr>
									<td>${s.index+1}</td>
									<td>
										 <c:choose>  
			             				  <c:when test="${fn:length(suggestion.content)>40}">
			             				  		${fn:substring(suggestion.content, 0, 40)}...
			             				  </c:when>
			             				   <c:otherwise>
			             				   		${suggestion.content}
			             				   </c:otherwise>
				             			</c:choose>
				             		</td>
									<td><fmt:formatDate value="${suggestion.createTime }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>${date }</td>
									<td>
										<a type="button" href="<%=basePath%>back/suggestion/detail?id=${suggestion.id}" target="_blank" class="btn  btn-xs btn-info">查看</a>
									</td>
								</tr>
							</c:forEach>
						</table>
						<nav  style="width: 500px;margin: auto;">
						  <ul class="pagination">
						    <c:choose>  
				               <c:when test="${pagination.pageNo==1}"> <li class="disabled"><a href="javascript:void(0)"><span aria-hidden="true">上一页</span><span class="sr-only">Previous</span></a></li></c:when>  
				               <c:otherwise> <li><a href="javascript:void(0)" onclick="page('${pageNo-1}')"><span aria-hidden="true">上一页</span><span class="sr-only">Previous</span></a></li></c:otherwise>  
				           </c:choose> 
						    <c:forEach var="page" items="${pagination.pages}" varStatus="s">
					    	   <c:choose>  
					               <c:when test="${page==pagination.pageNo}"> <li  class="active"><a href="javascript:void(0)" onclick="page('${page}')">${page}</a></li></c:when>  
					               <c:otherwise><li><a href="javascript:void(0)" onclick="page('${page}')">${page}</a></li></a></c:otherwise>  
					           </c:choose> 
						    </c:forEach>
						     <c:choose>  
				               <c:when test="${pagination.pageNo==pagination.totalPage}"> <li class="disabled"><a href="javascript:void(0)"><span aria-hidden="true">下一页</span><span class="sr-only">Next</span></a></li></c:when>  
				               <c:otherwise> <li><a href="javascript:void(0)" onclick="page('${pageNo+1}')"><span aria-hidden="true">下一页</span><span class="sr-only">Next</span></a></li></c:otherwise>  
				           </c:choose> 
						  </ul>
						</nav>
					 </c:otherwise> 
				</c:choose>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function page(pageNum){
		var action ="<%=basePath%>back/suggestion/list/10/"+pageNum;
	    var form = $("<form></form>")
	        form.attr('action',action)
	        form.attr('method','post')
	        form.appendTo("body")
	        form.css('display','none')
	        form.submit()		
	}
</script>
</html>
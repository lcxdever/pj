<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<h5 style="color: red;" class="text-center">${param.msg}</h5>
<table class="table table-bordered nth-child table-hover">
		<thead>
			<tr>
				<th style="width: 20px;">#</th>
				<th style="width: 100px;">标题</th>
				<th style="width: 50px;">类型</th>
				<th style="width: 100px;">创建时间</th>
				<th style="width: 50px;">创建人</th>
				<th style="width: 80px;">操作</th>
			</tr>
		</thead>
	<c:forEach var="news" items="${pagination.valuesList}" varStatus="s">
		<tr>
			<td>${s.index+1}</td>
			<td>${news.title}</td>
			<td>
				 <c:choose>  
	               <c:when test="${news.type==1}">公司新闻</c:when>  
	               <c:when test="${news.type==2}">业务公告</c:when>  
	               <c:when test="${news.type==3}">制度规范</c:when>  
	               <c:when test="${news.type==4}">顶部图片</c:when>  
	               <c:when test="${news.type==5}">供应链文化</c:when>  
	           </c:choose> 
			</td>
			<td><fmt:formatDate value="${news.createTime }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>${date}</td>
			<td>${news.createUser}</td>
			<td>
				<button type="button" class="btn  btn-xs btn-info" onclick="modify('${news.id}')">修改</button>
				<button type="button" class="btn btn-xs btn-danger"  onclick="del('${news.id}')">删除</button>
			</td>
		</tr>
	</c:forEach>
</table>
<nav  style="width: 500px;margin: auto;">
  <ul class="pagination">
    <c:choose>  
             <c:when test="${pagination.pageNo==1}"> <li class="disabled"><a href="javascript:void(0)"><span aria-hidden="true">上一页</span><span class="sr-only">Previous</span></a></li></c:when>  
             <c:otherwise> <li><a href="javascript:void(0)" onclick="page('${pagination.pageNo-1}')"><span aria-hidden="true">上一页</span><span class="sr-only">Previous</span></a></li></c:otherwise>  
         </c:choose> 
    <c:forEach var="page" items="${pagination.pages}" varStatus="s">
   	   <c:choose>  
              <c:when test="${page==pagination.pageNo}"> <li  class="active"><a href="javascript:void(0)" onclick="page('${page}')">${page}</a></li></c:when>  
              <c:otherwise><li><a href="javascript:void(0)" onclick="page('${page}')">${page}</a></li></a></c:otherwise>  
          </c:choose> 
    </c:forEach>
     <c:choose>  
             <c:when test="${pagination.pageNo==pagination.totalPage}"> <li class="disabled"><a href="javascript:void(0)"><span aria-hidden="true">下一页</span><span class="sr-only">Next</span></a></li></c:when>  
             <c:otherwise> <li><a href="javascript:void(0)" onclick="page('${pagination.pageNo+1}')"><span aria-hidden="true">下一页</span><span class="sr-only">Next</span></a></li></c:otherwise>  
         </c:choose> 
  </ul>
</nav>
<script type="text/javascript">
var newsType = '${type}';
</script>
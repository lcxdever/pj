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
<title>公司新闻列表</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
</head>
<body onload="init()">
	<jsp:include page="/static/pages/navibar.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li ><a href="<%=basePath%>user/list/10/1">用户管理</a></li>
					<li class="active"><a href="<%=basePath%>news/list/10/1?type=1">新闻管理</a></li>
					<li ><a href="<%=basePath%>news/list/10/1?type=2">公告管理</a></li>
					<li ><a href="<%=basePath%>news/list/10/1?type=3">制度管理</a></li>
					<li ><a href="<%=basePath%>news/list/10/1?type=4">顶部管理</a></li>
					<li><a href="javascript:void(0)">关于系统</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<button type="button" class="btn btn-success" style="margin-bottom: 20px;margin-right: 10px;float: right;" onclick="location.href='<%=basePath%>pages/news/add.jsp?type=1'">新建公司新闻</button>
				<div class="col-sm-2"  style="float: right;margin-right: 30px;display: none" >
					<select class="form-control" name="type" id="typeSel" onchange="changeSel()">
					  <option value="0">全部</option>
					  <option value="1">公司新闻</option>
					  <option value="2">业务公告</option>
					  <option value="3">制度规范</option>
					  <option value="4">顶部图片</option>
					</select>
				</div>
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
					               <c:otherwise>顶部图片</c:otherwise>  
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
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function init(){
		 $("#typeSel").val('${type}');
	}
	function changeSel(){
		page(1);
	}
	function page(pageNum){
		var type=$("#typeSel").val();
		var action ="<%=basePath%>news/list/10/"+pageNum;
	    var form = $("<form></form>")
	        form.attr('action',action)
	        form.attr('method','post')
	    var input1 = $("<input type='hidden' name='type' />")
	        input1.attr('value',type)
	        form.append(input1)
	        form.appendTo("body")
	        form.css('display','none')
	        form.submit()		
	}
	function modify(id,name){
	var action = "<%=basePath%>news/query4modify";
    var form = $("<form></form>")
        form.attr('action',action)
        form.attr('method','post')
    var input1 = $("<input type='hidden' name='id' />")
        input1.attr('value',id)
        form.append(input1)
        form.appendTo("body")
        form.css('display','none')
        form.submit()
	}
	function del(id){
		if(window.confirm("您确认要删除吗")){
		var action = "<%=basePath%>news/delete";
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
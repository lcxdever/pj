<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<title>金风科技供应链电子商务网</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/static/css/index.css" rel="stylesheet">
<style type="text/css">
	.edui-scale{
-webkit-box-sizing:content-box;border-box:content-box;-moz-box-sizing:content-box;
}
	.center{text-align: center;background-color: white;padding-top: 20px;}
	h1{font: 26px/65px "微软雅黑";}
	.info{width: 980px;border-bottom: solid 1px #CCC;}
	.source{margin-left: 50px}
	.content{text-align: left;margin-top: 20px;width: 980px;padding:0px 10px 0px 10px; }
	.fujian{text-align: right;}
	.fujian a{cursor: pointer;margin: 0px 40px 20px 0px;}
	.fujian a:link{ color: #0068B7;  text-decoration: none}
.fujian a:visited{ color: #0068B7;  text-decoration: none}
.fujian a:hover{color: #FF7201; text-decoration: underline;}
.fujian a:active{ color: #ff7f24; text-decoration: underline;}
.list_ul{padding: 0px}
.list_ul li{list-style-type:none;padding-left: 10px;line-height: 25px;background:url("../../static/images/li.png") no-repeat left;}
.list_ul li span{color: #999999;float: right;}
.list_ul li a:link{ color: #333333;  text-decoration: none}
.list_ul li a:visited { color: #333333;  text-decoration: none}
.list_ul li a:hover{color: #FF7201; text-decoration: underline;}
.list_ul li a:active { color: #ff7f24; text-decoration: underline;}
</style>
</head>
<body>
	<jsp:include page="/static/pages/header.jsp"></jsp:include>
	<div class="center" style="width: 980px;border-top: 1px solid #CCC; ">
		<div style="text-align: left;margin-left:20px">首页>>新闻列表</div>
		<ul style="margin: 20px auto auto auto;width: 700px" class="list_ul">
			<c:forEach var="detail" items="${pagination.valuesList}" varStatus="s">
				<li style="width: 700px;margin: auto;padding: 5px 0px 5px 0px;margin: 0px"><a style="margin: 0px"  href="<%=basePath %>detail?id=${detail.id}" target="_blank">${detail.title}</a><span style="float: right;"><fmt:formatDate value="${detail.createTime }" var="date" pattern="yyyy-MM-dd"/>${date}</span></li>
			</c:forEach>
		</ul>
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
	<jsp:include page="/static/pages/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/index.js"></script>
</html>
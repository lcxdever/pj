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
<title>金风科技供应链电子商务网--投诉与建议</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/static/css/index.css" rel="stylesheet">
<style type="text/css">
	.edui-scale{
-webkit-box-sizing:content-box;border-box:content-box;-moz-box-sizing:content-box;
}
	.center{text-align: center;background-color: white;padding:0px 40px 40px 40px}
	.center div{text-align: left}
	h1{font: 26px/65px "微软雅黑";line-height: 45px}
	.info{width: 900px;border-bottom: solid 1px #CCC;}
	.source{margin-left: 50px}
	.content{text-align: left;margin-top: 20px;width: 900px;padding:0px 10px 0px 10px; }
</style>
<script type="text/javascript">
function change(o){
	if($("#anonymousCheck").is(':checked')){
		$("#contactDiv").css("display","none");
		$("#anonymous").val("1");
	}else{
		$("#contactDiv").css("display","block");
		$("#anonymous").val("0");
	}
}
function check(){
	if($("#title").val()==""){
		alert("标题不可为空");
		return false;
	}
	if($("#content").val()==""){
		alert("内容不可为空");
		return false;
	}
	return true;
}
</script>
</head>
<body>
	<jsp:include page="/static/pages/header.jsp"></jsp:include>
	<div class="center" style="width: 680px;">
		<h1>投诉与建议</h1>
		<form action="<%=basePath%>back/suggestion/insert" onsubmit="return check()" method="POST">
			<div class="form-group" style="margin-top: 20px">
					<label for="title">标题</label> <input
						  class="form-control" id="title" name="title"
						placeholder="">
				</div>
			<div class="form-group">
				<label for="content">建议内容</label> 
				<textarea class="form-control" rows="4" name="content" id="content" placeholder="请留下您宝贵的建议我们将努力做的更好"></textarea>
			</div>
			<div class="checkbox" style="float: right;">
			    <label>
			      <input type="checkbox" name="anonymousCheck" id="anonymousCheck" onchange="change(this)">匿名
			      <input type="hidden" name="anonymous" id="anonymous" value="0">
			    </label>
			  </div>
			<div id="contactDiv">
				<div class="form-group" style="margin-top: 20px">
					<label for="supplier">供应商名称</label> <input
						  class="form-control" id="supplier" name="supplier"
						placeholder="">
				</div>
				<div class="form-group">
					<label for="contactName">联系人</label> <input  name="contactName"
						  class="form-control" id="contactName"
						placeholder="">
				</div>
				<div class="form-group">
					<label for="contactWay">联系方式</label> <input name="contactWay"
						 class="form-control" id="contactWay"
						placeholder="请输入您的联系方式便于我们与您联系">
				</div>
			</div>
			<button type="submit"  class="btn btn-default">&nbsp;&nbsp;提交&nbsp;&nbsp;</button>
		</form>
	</div>
	<jsp:include page="/static/pages/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/index.js"></script>
</html>
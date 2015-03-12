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
	var check=$("#anonymousCheck").is(':checked');
	if(!check&&$("#supplier").val()==""){
		alert("供应商不可为空");
		return false;
	}
	if(!check&&$("#contactName").val()==""){
		alert("联系人不可为空");
		return false;
	}
	if(!check&&$("#contactWay").val()==""){
		alert("联系方式不可为空");
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
<body style="background-color: white;">
	<jsp:include page="/static/pages/header.jsp"></jsp:include>
	<div style="width: 830px;margin: auto;padding: 0px 0px 20px 0px">首页><font color="#366AC9" style="font-size: 14px">投诉与建议</font> <span style="margin-left: 200px;color: red">${msg}</span></div>	
	<div class="center">
		<div class="c_top">
			<img alt="" src="<%=basePath%>static/images/suggestion_t.png">
			<a href="<%=request.getContextPath()%>/index">《返回</a>
		</div>
		<div class="c_mid">
			<form class="form-horizontal" action="<%=basePath%>back/suggestion/insert" onsubmit="return check()" method="POST">
				<div class="form-group" style="margin-top: 20px;display: none">
						<label for="title"  class="col-sm-2 control-label">标题</label>
						<div class="col-sm-10"> <input  class="form-control" id="title" name="title" placeholder=""></div>
				</div>
				<div style="width:600px;float: left ;margin-top: 30px">
					<div id="contactDiv">
						<div class="form-group">
							<label for="supplier" class="col-sm-3 control-label"><span  >*&nbsp;</span>供应商名称</label>
							<div class="col-sm-9"><input  class="form-control input_height" id="supplier" name="supplier" placeholder="请输入供应商名称">
							</div>
						</div>
						<div class="form-group">
							<label for="contactName" class="col-sm-3 control-label"><span  >*&nbsp;</span>联系人</label>
							<div class="col-sm-9"><input  name="contactName"  class="form-control input_height" id="contactName" placeholder="请输入联系人姓名">
							</div>
						</div>
						<div class="form-group">
							<label for="contactWay" class="col-sm-3 control-label"><span >*&nbsp;</span>联系方式</label>
							<div class="col-sm-9"><input name="contactWay"  class="form-control input_height" id="contactWay" placeholder="手机/邮箱">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="content"  class="col-sm-3 control-label">投诉与建议内容</label> 
						<div class="col-sm-9"> <textarea class="form-control" rows="5" name="content" id="content" placeholder="请输入您的想法"></textarea></div>
					</div>
					<button type="submit"  class="btn btn-default"></button>
				</div>
				<div class="form-group"  style="float: left;margin: 30px 0px 0px 10px;width: 80px">
			        <label style="font-size: 13px">
			           <input type="checkbox" name="anonymousCheck" id="anonymousCheck" onchange="change(this)">&nbsp;匿名评价
				       <input type="hidden" name="anonymous" id="anonymous" value="0">
			        </label>
			    </div>
			</form>
		</div>
	</div>
	<jsp:include page="/static/pages/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/index.js"></script>
<style type="text/css">
	.center{text-align: center;background-color: white;padding:0px 0px 0px 0px;width: 830px;height: 515px;background-color: #EEEEEE}
	.center div{text-align: left}
	h1{font: 26px/65px "微软雅黑";line-height: 45px}
	.info{width: 900px;border-bottom: solid 1px #CCC;}
	.source{margin-left: 50px}
	.content{text-align: left;margin-top: 20px;width: 900px;padding:0px 10px 0px 10px; }
	.c_top{height: 50px;width: 100%;border-bottom: 1px solid #D2D2D2;}
	.c_top img{margin: 10px 0px 0px 40px}
	.c_top a{color:#999999;float: right; margin: 16px 20px 0px 0px}
	label{font-weight: 100;font-size: 14px}
	label span{font-size: 16px;margin-top: 5px;color: red}
	.input_height{height: 40px  !important}
	.btn{width: 108px;height: 41px;background-image: url("../static/images/submit_bt_07.png");float: right;}
	.c_mid{width: 690px;margin: auto;}
</style>
</html>
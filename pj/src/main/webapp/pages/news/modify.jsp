<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改新闻</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
<style type="text/css">
html,body{margin: 0px;padding: 0px}
.edui-scale{
-webkit-box-sizing:content-box;border-box:content-box;-moz-box-sizing:content-box;
}
</style>
</head>
<body onload="init()">
	<h1 style="width:200px; margin:10px auto 0px auto;">修改新闻</h1>
	<div style="width: 1000px;margin: 20px auto;">
		<form class="form-horizontal" role="form" enctype="multipart/form-data" action="<%=request.getContextPath()%>/news/modify" onsubmit="return check();" name="form" method="POST">
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">标题</label>
		    <div class="col-sm-10" >
		      <input type="text" class="form-control" name="title" value='${news.title}' id="inputPassword3">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">类型</label>
		    <div class="col-sm-10" >
		     <select class="form-control" readonly name="type" id="typeSel"  onchange="changeSel()">
				  <option value="1">公司新闻</option>
				  <option value="2">业务公告</option>
				  <option value="3">制度规范</option>
				  <option value="4">顶部图片</option>
				</select>
		    </div>
		  </div>
		  <div class="form-group" id="editorCont">
		    <label for="inputPassword3" class="col-sm-2 control-label">内容</label>
		    <div class="col-sm-10" >
		       <jsp:include page="/static/pages/editor.jsp"></jsp:include>
		       <input type="hidden" name="content">
		       <input type="hidden" name="onlyTxt">
		       <input type="hidden" name="id" value="${news.id}">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">附件</label>
		    <div class="col-sm-10" >
		      <input type="file" id="exampleInputFile" name="file" style="float: left"><span style="float:right;color: red;" >不选择文件则表示不修改</span><span style="float:right;color: red;display: none" id="waring">只支持图片文件</span>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">提交</button>
		    </div>
		  </div>
		</form>
	</div>
</body>
<script type="text/javascript">
function init(){
	$("#typeSel").val('${news.type}');
	if($("#typeSel").val()==4)
	changeSel();
	UM.getEditor('myEditor').setContent('${news.content}', false);
}
function changeSel(){
	if($("#typeSel").val()==4){
		$("#editorCont").css("display","none");
		$("#waring").css("display","block");
	}
	else{
		$("#editorCont").css("display","block");
		$("#waring").css("display","none");
	}
}
function check(){
	var form=document.forms.form;
	if(form.title.value==""){
		alert("标题不能为空")
		return false;
	}
	var txt=UM.getEditor('myEditor').getContentTxt();
	var cont=UM.getEditor('myEditor').getContent();
	if((txt==""||cont=="")&&$("#typeSel").val()!=4){
		alert("内容不能为空")
		return false;
	}
	form.content.value=cont;
	form.onlyTxt.value=txt;
	return true;
	
}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增新闻</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
 <style type="text/css">
  html,body{margin: 0px;padding: 0px}
  </style>
</head>
<body>
	<h1 style="width:200px; margin:10px auto 0px auto;">新闻添加</h1>
	<div style="width: 1000px;margin: 20px auto;">
		<form class="form-horizontal" role="form" enctype="multipart/form-data" action="<%=request.getContextPath()%>/news/insert" onsubmit="return check();" name="form" method="POST">
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">标题</label>
		    <div class="col-sm-10" >
		      <input type="text" class="form-control" name="title" id="inputPassword3">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">类型</label>
		    <div class="col-sm-10" >
		     <select class="form-control" name="type">
				  <option value="0">公司新闻</option>
				  <option value="1">业务公告</option>
				  <option value="2">制度规范</option>
				</select>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">内容</label>
		    <div class="col-sm-10" >
		       <jsp:include page="/static/pages/editor.jsp"></jsp:include>
		       <input type="hidden" name="content">
		       <input type="hidden" name="summary">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">附件</label>
		    <div class="col-sm-10" >
		      <input type="file" id="exampleInputFile" name="file">
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
function check(){
	
	var form=document.forms.form;
	if(form.title.value==""){
		alert("标题不能为空")
		return false;
	}
	var txt=UM.getEditor('myEditor').getContentTxt();
	var cont=UM.getEditor('myEditor').getContent();
	if(txt==""||cont==""){
		alert("内容不能为空")
		return false;
	}
	form.content.value=cont;
	form.summary.value=txt;
	return true;
	
}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增用户</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>

</head>
<body>
	<h1 style="width:200px; margin:50px auto 0px auto;">新用户添加</h1>
	<div style="width: 600px;margin: 20px auto;">
		<form role="form" action="<%=request.getContextPath()%>/back/user/insert" onsubmit="return check();" name="form" method="POST">
			<div class="form-group">
				<label for="exampleInputEmail1">用户名</label> <input
					  class="form-control" id="exampleInputEmail1" name="userName"
					placeholder="输入用户名">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">用户组选择</label>
					<select class="form-control" name="roleID" id="roleID" placeholder="请选择用户组">
					  <option value="0">普通用户</option>
					  <option value="2">高级用户</option>
					</select>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">密码</label> <input  name="passWord"
					type="password" class="form-control" id="exampleInputPassword1"
					placeholder="输入密码">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">确认密码</label> <input name="passWordAgain"
					type="password" class="form-control" id="exampleInputPassword1"
					placeholder="再输入一次密码">
			</div>
			<button type="submit"  class="btn btn-default" style="float: right;width: 120px">提交</button>
		</form>
	</div>
</body>
<script type="text/javascript">
function check(){
	var from=document.forms.form;
	if(form.userName.value==""){
		alert("用户名不可为空");
		return false;
	}
	if(from.passWord.value==""){
		alert("密码不可为空");
		return false;
	}
	if(from.passWord.value!=from.passWordAgain.value)
	{
		alert("两次输入的密码不一致");
		return false;
	}
	return true;
	
}
</script>
</html>
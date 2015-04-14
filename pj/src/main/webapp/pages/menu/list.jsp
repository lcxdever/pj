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
<title>菜单权限列表</title>
<style type="text/css">
.bs-example {
  background-color: #fff;
  border-color: #ddd;
  border-radius: 4px 4px 0 0;
  -webkit-box-shadow: none;
  box-shadow: none;
  position: relative;
  padding: 45px 15px 15px;
  margin: 0 -15px 15px;
  border-style: solid;
  border-width: 1px 1px;
  -webkit-box-shadow: inset 0 3px 6px rgba(0,0,0,.05);
  box-shadow: inset 0 3px 6px rgba(0,0,0,.05);
}
.bs-example:after {
  position: absolute;
  top: 15px;
  left: 15px;
  font-size: 12px;
  font-weight: 700;
  color: #959595;
  text-transform: uppercase;
  letter-spacing: 1px;
  content: "菜单管理";
}
</style>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
</head>
<body onload="active('menu_manager_menu')">
	<jsp:include page="/static/pages/navibar.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<jsp:include page="/pages/left.jsp"></jsp:include>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="bs-example col-sm-3 ">
					<div class="row">
					 <div class="col-xs-5">
					 </div>
					  <div class="col-xs-2">
					  	<button type="button" class="btn  btn-xs btn-success" placeholder=".col-xs-2" onclick="insert_menu()">新增</button>
					  </div>
					  <div class="col-xs-2">
					  	<button type="button" class="btn  btn-xs btn-warning"  placeholder=".col-xs-2" onclick="modify_menu()">修改</button>
					  </div>
					  <div class="col-xs-2">
					    <button type="button" class="btn  btn-xs btn-danger"  placeholder=".col-xs-2" onclick="delete_menu()">删除</button>
					  </div>
					</div>
					<div style="margin-top: 10px" data-example-id="list-group-anchors">
					    <div class="list-group" id="menus">
					      <a href="#" class="list-group-item">
					        Cras justo odio
					      </a>
					      <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
					      <a href="#" class="list-group-item">Morbi leo risus</a>
					      <a href="#" class="list-group-item">Porta ac consectetur ac</a>
					      <a href="#" class="list-group-item">Vestibulum at eros</a>
					    </div>
					</div>
				</div>
				<div style="float:left;"  class="col-sm-1">
				</div>
				<div style="float:left;background-color: green;"  class="col-sm-8">
					fsfsf
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function menuClick(e){
	 $("#menus a").removeClass("active");
	 $(this).addClass("active");
	 $("#menus").append($('<a href="#" class="list-group-item">test133</a>').click(menuClick));
}
$("#menus a").click(menuClick);
</script>
</html>
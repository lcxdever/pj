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
<title>用户列表</title>
<jsp:include page="/static/pages/bootstrap.jsp"></jsp:include>
</head>
<body onload="active('user_manager_menu')">
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
						<button type="button" class="btn btn-success" style="margin-bottom: 20px;margin-right: 10px;float: right;" onclick="location.href='<%=basePath%>pages/user/add.jsp'">新建用户</button>
						<h5 style="color: red;" class="text-center">${param.msg}</h5>
						<table class="table table-bordered nth-child table-hover">
								<thead>
									<tr>
										<th style="width: 50px;">#</th>
										<th style="width: 100px;">用户名</th>
										<th style="width: 100px;">用户组</th>
										<th style="width: 170px;">创建时间</th>
										<th style="width: 60px;">创建人</th>
										<th style="width: 100px;">操作</th>
									</tr>
								</thead>
							<c:forEach var="user" items="${pagination.valuesList}" varStatus="s">
								<tr>
									<td>${s.index+1}</td>
									<td>${user.userName}</td>
									<td>
										<c:choose>  
										 <c:when test="${user.roleID ==1}">
			             				  		<span>管理员用户</span>
			             				  </c:when>
			             				  <c:when test="${user.roleID ==2}">
			             				  		<span>高级用户</span>
			             				  		<button type="button" class="btn btn-primary btn-xs pull-right" onclick="modifyRole('${user.id}',this)">降级普通</button>
			             				  </c:when>
			             				   <c:otherwise>
			             				   		<span>普通用户</span>
			             				   		<button type="button" class="btn btn-danger btn-xs pull-right" onclick="modifyRole('${user.id}',this)">升级高级</button>
			             				   </c:otherwise>
				             			</c:choose>
									</td>
									<td><fmt:formatDate value="${user.createTime }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>${date }</td>
									<td>${user.createUser}</td>
									<td>
										<button type="button" class="btn  btn-xs btn-info" onclick="modify('${user.id}','${user.userName}','${user.roleID}')">修改</button>
										<button type="button" class="btn btn-xs btn-danger"  onclick="del('${user.id}')">删除</button>
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
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function page(pageNum){
		var action ="<%=basePath%>back/user/list?pageSize=10&pageNum="+pageNum;
	    var form = $("<form></form>")
	        form.attr('action',action)
	        form.attr('method','post')
	    var input1 = $("<input type='hidden' name='userName' />")
	        input1.attr('value',10)
	        form.append(input1)
	        form.appendTo("body")
	        form.css('display','none')
	        form.submit()		
	}
	function modify(id,name,roldID){
	var action = "<%=basePath%>pages/user/modify.jsp";
    var form = $("<form></form>")
        form.attr('action',action)
        form.attr('method','post')
    var input1 = $("<input type='hidden' name='id' />")
        input1.attr('value',id)
    var input2 = $("<input type='hidden' name='userName' />")
        input2.attr('value',name)
    var input3 = $("<input type='hidden' name='roleID' />")
        input3.attr('value',roldID)
        form.append(input1)
        form.append(input2)
        form.append(input3)
        form.appendTo("body")
        form.css('display','none')
        form.submit()
	}
	function modifyRole(id,o){
		var roleType=2;
		if($(o).hasClass("btn-primary"))
			roleType=0;
		$.post("<%=basePath%>back/user/modifyRole",{id:id,roleID:roleType},function(result){
		     if(result.success){
		    	 if(roleType==0){
		    		 $(o).html("升级高级");
		    		 $(o).prev().html("普通用户");
		    		 $(o).addClass("btn-danger").removeClass("btn-primary");
		    	 }else{
		    		 $(o).html("降级普通");
		    		 $(o).prev().html("高级用户");
		    		 $(o).addClass("btn-primary").removeClass("btn-danger");
		    	 }
		     }
			 alert(result.desc)
		  });
	}
	function del(id){
		if(window.confirm("您确认要删除吗")){
		var action = "<%=basePath%>back/user/delete";
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
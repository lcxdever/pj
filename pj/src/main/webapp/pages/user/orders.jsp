<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<title>高德支付后台管理</title>

<!-- Bootstrap core CSS -->
<link
	href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/css/bootstrap/bootstrap-datetimepicker.min.css" />"
	rel="stylesheet">
	
<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/dashboard.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">	

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<!-- 
					<li><a href="<%=basePath%>front/finance/budget/manager/?pageid=1">预算管理</a></li>
					 -->
					<li><a href="<%=basePath%>front/finance/batch/manager/?pageid=1">批量付款</a></li>
					<li><a href="<%=basePath%>front/finance/orders/manager/?pageid=1">订单管理</a></li>
					<!-- 
					<li><a href="<%=basePath%>front/finance/search/manager/?pageid=1">申请查询</a></li>
					 -->
					<li><a href="<%=basePath%>front/finance/export/manager/?pageid=1">统计报表</a></li>
				</ul>

			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div style="text-align: center;">
					<h2 class="sub-header">订单管理列表</h2>
				</div>
				<div class="table-responsive">
					<c:choose>
						<c:when test="${ status == '000' }">
							<form class="form-inline" role="form" method="get" action="<%=basePath%>front/finance/orders/manager/?pageid=1">
							  <div class="row" style="padding-left: 15px;padding-top: 10px;">	
							  	  <div class="form-group">
								    <label for="pageid"></label>
								    <input type="hidden" class="form-control input-sm sr-only" id="pageid" name="pageid" value="1">
								  </div>
								  <div class="form-group">
								    <label for="orderSerialNum">订单号:</label>
								    <input type="text" class="form-control input-sm" id="orderSerialNum" name="orderSerialNum" value="${orderSerialNum }" placeholder="订单流水号" style="width: 150px;">
								  </div>
								  <div class="form-group" style="padding-right:5px;">
								    <label for="departId">部门名称:</label>
								    <select class="form-control input-sm" id="departId" name="departId" style="width: 120px;">
								    	<option value="">全部</option>
								    	<c:forEach var="user" items="${userList }">
								    		<c:choose>
												<c:when test="${departId eq user.id }">
													<option value="${user.id }" selected="selected">${user.departName}</option>
												</c:when>
												<c:otherwise>
													<option value="${user.id }">${user.departName}</option>
												</c:otherwise>
											</c:choose>
								    	</c:forEach>
								    </select>
								  </div>
								  <div class="form-group"  style="padding-right:5px;">
								    <label for="orderStatus">支付状态:</label>
								    <select class="form-control input-sm" id="orderStatus" name="orderStatus" style="width: 120px;">
								    	<c:choose>
								    		<c:when test="${orderStatus eq -1 }">
									    		<option selected="selected" value="-1">全部</option>
										    	<option value="0">待审核</option>
										    	<option value="5">审核中</option>
										    	<option value="6">审核完成,待支付</option>
										    	<option value="1">已提交</option>
										    	<option value="2">支付确认</option>
										   		<option value="3">部门应答成功</option>
										   		<option value="4">部门应答失败</option>
										   		<option value="7">审核异常</option>
										   		<option value="8">处理中</option>
								    		</c:when>
								    		<c:when test="${orderStatus eq 0 }">
									    		<option value="-1">全部</option>
										    	<option selected="selected" value="0">待审核</option>
										    	<option value="5">审核中</option>
										    	<option value="6">审核完成,待支付</option>
										    	<option value="1">已提交</option>
										    	<option value="2">支付确认</option>
										   		<option value="3">部门应答成功</option>
										   		<option value="4">部门应答失败</option>
										   		<option value="7">审核异常</option>
										   		<option value="8">处理中</option>
								    		</c:when>
								    		<c:when test="${orderStatus eq 5 }">
									    		<option value="-1">全部</option>
										    	<option value="0">待审核</option>
										    	<option selected="selected"  value="5">审核中</option>
										    	<option value="6">审核完成,待支付</option>
										    	<option value="1">已提交</option>
										    	<option value="2">支付确认</option>
										   		<option value="3">部门应答成功</option>
										   		<option value="4">部门应答失败</option>
										   		<option value="7">审核异常</option>
										   		<option value="8">处理中</option>
								    		</c:when>
								    		<c:when test="${orderStatus eq 6 }">
									    		<option value="-1">全部</option>
										    	<option value="0">待审核</option>
										    	<option value="5">审核中</option>
										    	<option selected="selected" value="6">审核完成,待支付</option>
										    	<option value="1">已提交</option>
										    	<option value="2">支付确认</option>
										   		<option value="3">部门应答成功</option>
										   		<option value="4">部门应答失败</option>
										   		<option value="7">审核异常</option>
										   		<option value="8">处理中</option>
								    		</c:when>
								    		<c:when test="${orderStatus eq 1 }">
									    		<option value="-1">全部</option>
										    	<option value="0">待审核</option>
										    	<option value="5">审核中</option>
										    	<option value="6">审核完成,待支付</option>
										    	<option selected="selected" value="1">已提交</option>
										    	<option value="2">支付确认</option>
										   		<option value="3">部门应答成功</option>
										   		<option value="4">部门应答失败</option>
										   		<option value="7">审核异常</option>
										   		<option value="8">处理中</option>
								    		</c:when>
								    		<c:when test="${orderStatus eq 2 }">
									    		<option value="-1">全部</option>
										    	<option value="0">待审核</option>
										    	<option value="5">审核中</option>
										    	<option value="6">审核完成,待支付</option>
										    	<option value="1">已提交</option>
										    	<option selected="selected" value="2">支付确认</option>
										   		<option value="3">部门应答成功</option>
										   		<option value="4">部门应答失败</option>
										   		<option value="7">审核异常</option>
										   		<option value="8">处理中</option>
								    		</c:when>
								    		<c:when test="${orderStatus eq 3 }">
								    			<option value="-1">全部</option>
										    	<option value="0">待审核</option>
										    	<option value="5">审核中</option>
										    	<option value="6">审核完成,待支付</option>
										    	<option value="1">已提交</option>
										    	<option value="2">支付确认</option>
										   		<option selected="selected" value="3">部门应答成功</option>
										   		<option value="4">部门应答失败</option>
									   			<option value="7">审核异常</option>
									   			<option value="8">处理中</option>
								    		</c:when>
								    		<c:when test="${orderStatus eq 4 }">
								    			<option value="-1">全部</option>
										    	<option value="0">待审核</option>
										    	<option value="5">审核中</option>
										    	<option value="6">审核完成,待支付</option>
										    	<option value="1">已提交</option>
										    	<option value="2">支付确认</option>
									   			<option value="3">部门应答成功</option>
									   			<option selected="selected" value="4">部门应答失败</option>
								    			<option value="7">审核异常</option>
								    			<option value="8">处理中</option>
								    		</c:when>
								    		<c:when test="${orderStatus eq 7 }">
								    			<option value="-1">全部</option>
										    	<option value="0">待审核</option>
										    	<option value="5">审核中</option>
										    	<option value="6">审核完成,待支付</option>
										    	<option value="1">已提交</option>
										    	<option value="2">支付确认</option>
									   			<option value="3">部门应答成功</option>
									   			<option value="4">部门应答失败</option>
								    			<option selected="selected" value="7">审核异常</option>
								    			<option value="8">处理中</option>
								    		</c:when>
								    		<c:when test="${orderStatus eq 8 }">
								    			<option value="-1">全部</option>
										    	<option value="0">待审核</option>
										    	<option value="5">审核中</option>
										    	<option value="6">审核完成,待支付</option>
										    	<option value="1">已提交</option>
										    	<option value="2">支付确认</option>
									   			<option value="3">部门应答成功</option>
									   			<option value="4">部门应答失败</option>
								    			<option value="7">审核异常</option>
								    			<option selected="selected" value="8">处理中</option>
								    		</c:when>
								    	</c:choose>
								    </select>
								  </div>
								  <div class="form-group" style="padding-right:5px;">
								  	<label>起止时间:</label>
								    <label class="sr-only" for="startTime">开始时间:</label>
								    <input size="16" class="form-control form_datetime input-sm"  type="text" id="start" name="start" value="${start }" readonly placeholder="开始时间" style="width:120px;">
								   	-
								    <label class="sr-only" for="endTime">截止时间:</label>
								    <input size="16" class="form-control form_datetime input-sm" type="text" id="end" name="end" value="${end }"  readonly placeholder="截止时间" style="width:120px;">
								  </div>
								  <button type="submit" class="btn btn-primary btn-sm" >查询</button>
							  </div>	
							</form>
							<br/>	
							
							<table class="table table-bordered mystyle-table">
								<thead>
								
									<tr>
										<th style="width: 50px;">#</th>
										<th style="width: 100px;">部门名称</th>
										<th style="width: 170px;">订单号</th>
										<th style="width: 60px;">数量</th>
										<th style="width: 110px;">订单金额</th>
										<th style="width: 170px;">订单时间</th>
										<th style="width: 170px;">付款时间</th>
										<th style="width: 110px;">支付状态</th>
										<th style="width: 100px;">操作</th>
									</tr>
								</thead>
								
									<%
									PageBean pageBean = (PageBean)request.getAttribute("pageBean");
									int flag = (pageBean.getCurrentPage()-1)*pageBean.getRowNum();
									String pagesHtml = (String)request.getAttribute("pagesHtml");
									
									List<OrdersPages> list = (List<OrdersPages>)request.getAttribute("list");
									for(int i=0;i<list.size();i++){
										OrdersPages key = list.get(i);
									%> 
									<tr>
									<td style="height: 26px;"><%=flag+i+1 %></td>
									<td><%=key.getDepartName() %></td>
									
									<td><a href="<%=basePath%>front/finance/orders/viewOrderInfo/?id=<%=key.getId()%>&pageid=1"><%=key.getOrderSerialNum() %></a></td>
									<td><%=key.getOrderCount() %></td>
									<td><span style="font-size:14px;color: red;font-weight: bold;"><fmt:formatNumber type="currency"><%=key.getTotalAmount() %></fmt:formatNumber></span></td>
									<td><%=key.getCreatTime()!=null?key.getCreatTime():"" %></td>
									<td><%=key.getPayTime()!=null?key.getPayTime():"" %></td>
									<td>
										<%if(key.getOrderStatus()==3){ %>
										<label class="btn btn-success btn-xs" disabled="disabled" ><%=DataFormat.payStatusFormat(key.getOrderStatus()) %></label>
										<%}else if(key.getOrderStatus()==4){ %>
										<label class="btn btn-danger btn-xs" disabled="disabled" ><%=DataFormat.payStatusFormat(key.getOrderStatus()) %></label>
										<%}else{ %>
										<%=DataFormat.payStatusFormat(key.getOrderStatus()) %>
										<%} %>
									</td>
									<td>
										<%if(key.getOrderStatus()==0){ %>
											<input type="button" class="btn btn-primary btn-xs verifyBtn" value="审核"  data-loading-text="正在处理..." data-orderId="<%=key.getId()%>" >
										<%}else if(key.getOrderStatus()==5){ %>
											<label></label>
										<%}else if(key.getOrderStatus()==6){ %>
											<a class="btn btn-primary btn-xs" href="<%=basePath%>front/finance/orders/viewOrderInfo/?id=<%=key.getId()%>&pageid=1" >付款</a>
										<%}else if(key.getOrderStatus()==7){ %>
											<input type="button" class="btn btn-primary btn-xs verifyBtn" value="重新审核" data-orderId="<%=key.getId()%>">
										<%}else if(key.getOrderStatus()==1){ %>
											<a class="btn btn-primary btn-xs" href="<%=basePath%>front/finance/orders/viewOrderInfo/?id=<%=key.getId()%>&pageid=1" >重新付款</a>
										<%}else if(key.getOrderStatus()==8){ %>
											<input type="button" class="btn btn-primary btn-xs verifyBtn" value="重新审核" data-orderId="<%=key.getId()%>">
										<%}else{ %>
											
										<%} %>
									</td>
									</tr>
									<%} %>
							</table>
							<%@ include file="../pagination.jsp"%>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 200px;">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	      	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <p id="msg" align="center" style="height: 80px;"></p>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="<c:url value="/resources/js/bootstrap/jquery/jquery-1.11.0.min.js" />"><\/script>')
	</script>
	<script
		src="<c:url value="/resources/js/bootstrap/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/docs.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap/bootstrap-datetimepicker.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap/bootstrap-datetimepicker.zh-CN.js" />"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		/*第一次读取最新通知*/
	  	setTimeout(function(){
		  		Push();
	  		},
	  		30000);
		/*2 轮询读取函数*/
	    setInterval(function(){
		  		Push();
	    	}
	    	,30000);		
	  	function Push(){
	  		location.reload();
	  	}
	  	
		$(".form_datetime").datetimepicker({
			format: 'yyyy-mm-dd',
			weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
	        minView: 2,
	        forceParse: 0,
			language:'zh-CN'
			});

		$(".verifyBtn").click(function(){
	      	$.ajax({
	            type: "GET",
	            url: "<%=basePath%>front/finance/orders/verifyOrder/",
	            data: {
	            	orderId 	: 	$(this).attr("data-orderId")
	            	},
	            dataType:"json",
	            success: function(json){
	            		var result = json.result;
	            		if(result == "000"){					//提交审核成功 
	            			location.reload();
	            		}else if(result == "8"){				//已提交过审核,处理中
	            			$("#msg").text(json.msg);
	            			$('#myModal').modal('show'); 
	            		}else {									//审核异常
	            			$("#msg").text(json.msg);
	            			$('#myModal').modal('show');     
	            		}
	           		},
	            error: function( xhr, status, errorThrown ) {
		            	console.log( "Error: " + errorThrown );
		            	console.log( "Status: " + status );
		            	console.dir( xhr );
	            	},
	            beforeSend: function(XMLHttpRequest){
	            	XMLHttpRequest.setRequestHeader("RequestType", "ajax");
	            	} 
	        });
	    });
		
		$("#rePay").click(function(){
			var orderId = $(this).attr("data-orderId");
			var departId = $(this).attr("data-departId");
			
			$.ajax({
	            type: "GET",
	            url: "<%=basePath %>front/finance/alipayInfo/",
	            data: {
	            	orderId 	: 	orderId,
	            	departId	:	departId
	            	},
	            dataType:"json",
	            success: function(json){
	            		location.reload();
	           		},
	            error: function( xhr, status, errorThrown ) {
		            	console.log( "Error: " + errorThrown );
		            	console.log( "Status: " + status );
		            	console.dir( xhr );
	            	},
	            beforeSend: function(XMLHttpRequest){
	            	XMLHttpRequest.setRequestHeader("RequestType", "ajax");
	            	} 
	        });
		});
	});
	</script>		
</body>
</html>
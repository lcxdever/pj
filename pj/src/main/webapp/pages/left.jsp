<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<ul class="nav nav-sidebar">
	<li><a href="<%=basePath%>user/list/10/1">用户管理</a></li>
	<li><a href="<%=basePath%>news/list/10/1?type=1">公司新闻管理</a></li>
	<li><a href="<%=basePath%>news/list/10/1?type=2">业务公告管理</a></li>
	<li><a href="<%=basePath%>news/list/10/1?type=3">制度规范管理</a></li>
	<li><a href="<%=basePath%>news/list/10/1?type=4">顶部图片管理</a></li>
	<li><a href="<%=basePath%>news/list/10/1?type=5">供应链文化管理</a></li>
	<li><a href="<%=basePath%>back/suggestion/list/10/1">投诉与建议</a></li>
	<li><a href="javascript:void(0)">关于系统</a></li>
</ul>
<script type="text/javascript">
function active(index){
	$(".nav").children(":eq("+index+")").addClass("active")
}
</script>

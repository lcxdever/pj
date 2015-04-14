<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<ul class="nav nav-sidebar" id="left_nav">
	<li id="user_manager_menu"><a href="<%=basePath%>back/user/list?pageSize=10&pageNo=1">用户管理</a></li>
	<li id="news_manager_menu"><a href="<%=basePath%>back/news/list?pageSize=10&pageNo=1&type=1">公司新闻管理</a></li>
	<li id="notices_manager_menu"><a href="<%=basePath%>back/news/list?pageSize=10&pageNo=1&type=2">业务公告管理</a></li>
	<li id="rules_manager_menu"><a href="<%=basePath%>back/news/list?pageSize=10&pageNo=1&type=3">制度规范管理</a></li>
	<li id="tops_manager_menu"><a href="<%=basePath%>back/news/list?pageSize=10&pageNo=1&type=4">顶部图片管理</a></li>
	<li id="culture_manager_menu"><a href="<%=basePath%>back/news/list?pageSize=10&pageNo=1&type=5">供应链文化管理</a></li>
	<li id="suggestion_manager_menu"><a href="<%=basePath%>back/suggestion/list?pageSize=10&pageNo=1">投诉与建议</a></li>
	<li id="menu_manager_menu"><a href="<%=basePath%>back/menu/list">菜单权限管理</a></li>
	<li><a href="javascript:void(0)">关于系统</a></li>
</ul>
<script type="text/javascript">
function active(index){
	$("#left_nav").children("#"+index).addClass("active")
}
var basePath="<%=basePath%>";
</script>

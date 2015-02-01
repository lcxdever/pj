<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />  
<title>Insert title here</title>
</head>
<body>
ssfsff
<jsp:include page="/static/pages/editor.jsp"></jsp:include>

<button class="btn" onclick="getContent()">获得内容</button>&nbsp;

<script type="text/javascript">
function getContent() {
    var arr = [];
    arr.push("使用editor.getContent()方法可以获得编辑器的内容");
    arr.push("内容为：");
    arr.push(UM.getEditor('myEditor').getContent());
    alert(arr.join("\n"));
}
</script>
</body>
</html>
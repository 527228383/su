<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/service/reset.css"  type="text/css"/>
<style type="text/css">
	img { border:0}
	body{background:#fff;color:#333;font-size:12px;font-family:Arial,'宋体'}
	.m404 { width:409px; margin:10% auto; padding-right:150px;}
</style>
</head>
<body>
	<div class="m404">
		<a href="##">
			<img src="img/404.png" width="409" height="177" alt="“真的很抱歉，我们搞丢了页面……”要不去首页看看？">
		</a>
	</div>
</body>
</html>
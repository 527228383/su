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
<!-- CSS -->
<link rel="stylesheet" href="css/service/reset.css">
<link rel="stylesheet" href="css/service/supersized.css">
<link rel="stylesheet" href="css/service/style.css">
<!-- Javascript -->
<script src="js/jquery-1.8.0.min.js"></script>
<script src="js/service/supersized.3.2.7.min.js"></script>
<script src="js/service/supersized-init.js"></script>
<script src="js/service/scripts.js"></script>
<script src="js/service/index.js"></script>
</head>
<body>
	<div class="page-container">
         <h1>知领财险管理系统</h1>
         <form action="" method="post">
         	 <div><font id="loginError" color="red" size="2"></font></div>
             <input type="text" id="userName" name="username" class="username" placeholder="Username">
             <input type="password" id="pwd" name="password" class="password" placeholder="Password">
             <button id="login">登录</button>
         </form>
     </div>
	
	
	
</body>
</html>
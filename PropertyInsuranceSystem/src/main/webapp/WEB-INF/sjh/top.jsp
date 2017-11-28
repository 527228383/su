<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<script src="js/jquery-1.8.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/service/main/style.css" rel="stylesheet" type="text/css" />
</head>
<body style="background:url(/images/topbg.gif) repeat-x;">

    <div class="topleft">
    	<a href="main.html" target="_parent"><img src="images/logo.png" title="系统首页" /></a>
    </div> 
    <div class="topright">    
	    <ul>
	    <li>
	    	<c:if test="${sessionScope.employee != null }">
	    		<a>欢迎 ${sessionScope.employee.emp_name } 登录</a>
		    	<a href="login.html" target="_parent">[退出]</a>
	    	</c:if>
	    </li>
	    <li><span><img src="images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
	    <li><a href="#">关于</a></li>
	    </ul>
	    <div class="user">
		    <span>admin</span>
		    <i>消息</i>
		    <b>5</b>
	    </div>    
    </div>
</body>

	<!-- js -->
	<script language="JavaScript" src="js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript">
	$(function(){	
		//顶部导航切换
		$(".nav li a").click(function(){
			$(".nav li a.selected").removeClass("selected")
			$(this).addClass("selected");
		});	
	});	
</script>
</html>
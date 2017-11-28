<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript">
		$(function(){ 
			   $("#bt").click();
		}); 
	</script>
  </head>
  
  <body>
  		欢迎${insure.ins_tel} 登录
  		
  			&nbsp;
  		抵用券${acc.discount}元
  		
  		<a href="insure/firstpage/1" target="second">待支付(${nopaynum})</a>
  		<a href="insure/firstpage/2" target="second">待续保(${continuepay})</a>
  		<a href="insure/firstpage/3" target="second">待评论(${nocomment})</a>
  		
  		<form action="insure/firstpage/1" target="second">
  			<button type="submit" id="bt"></button>
  		</form>
   		<iframe name="second" width="500px" height="300px">
   			
   		</iframe>
   		
   		
  </body>
  
</html>
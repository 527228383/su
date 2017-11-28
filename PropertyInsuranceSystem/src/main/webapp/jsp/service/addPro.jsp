<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" %>
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
<title>添加产品页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
</head>
<body >
	<div class="pagehead" align="center" style="margin:0 auto;width:500px; height:500px; border:1px solid #b8dcff;">
		<h1 style="color:red">添加产品</h1>
		<form  action="product/insertPro"  method="post">
			<p>保险名称:<input type="text" name="pro_name"  id="pr_name"/></p>
			<p>保障项目:<input type="text" name="pro_program"  id="pr_pm"/></p>
		    <p>保障范围:<input type="text" name="pro_scope"  id="pr_sco"/></p>
		    <p>保障期限:<input type="text" name="pro_time"  id="pr_times"/></p>
			<p>
				保险金额:<input style="width:30px" type="text" name="insured_amount" id="pro_mon1"/>
				购买金额:<input style="width:30px" type="text" name="coverage" id="pro_mon2"/>
				<input type="button" value="添加" id="pro_add1">
			</p>
			<div id="box">
				<p>
					<input type="submit" value="添加" id="pro_add2">  
					<a href="product/listpro?type=1"><button type="button">返回</button></a>
				</p>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#pro_add1").click(function(){
				$("#box").before("<div>保险金额:<input style='width:30px' type='text' name='insured_amount'/>&nbsp;购买金额:<input style='width:30px' type='text' name='coverage'/>&nbsp;<input type='button' value='删除' onclick='delmyself(this)'></p><div>")
			});
		});
		function delmyself(obj){
			$(obj).parent().remove();
		}
	</script>
</body>
</html>
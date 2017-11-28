<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title></title>
<script type="text/javascript"></script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="js/jquery-1.8.0.min.js"></script>
<style type="text/css">
	form{
		border:1px dotted #AAAAAA;
		padding:10px 6px 3px 6px;
		margin:0px;
		font:20px Arial;
}
</style>
</head>
	<body>
		<div id="topDiv">
			<div>
				<font>欢迎<span><a >${sessionScope.employee.emp_name }</a></span>登录</font>
			</div>
		</div>
		<h1>产品修改</h1>
		<div align="center" id="proEntity" style="margin:0 auto;width:500px; height:800px; border:1px solid #b8dcff;">
			<form  action="/product/updateProduct" method="post" >
				<p>产品ID:<input type="text" value="${product.id}" name="id" readonly="true"/></p>
				<p>保险名称:<input type="text" value="${product.pro_name}" readonly="true" name="pro_name"/></p>
				<p>保障项目:<input type="text" name="pro_program" value="${product.pro_program}"/></p>
				<p>保障范围:<input type="text" name="pro_scope" value="${product.pro_scope}"></p>
				<p>保障期限:<input type="text" name="pro_time" value="${product.pro_time}"></p>
				<c:forEach items="${product.pro_quote}" var="p">
					<p>
						购买金额:<input value="${p.coverage}" type="text" style="width:50px;" name="coverage"/>
						-保障金额<input type="text" value="${p.insured_amount}"  name="insured_amount" style="width:50px;"/>
					</p><br>
				</c:forEach>
				<input type="submit" value="修改" id="update"/>&nbsp;&nbsp;
				<a href="product/listpro?type=1"><input type="button" value="返回" id="goback"/></a>
			</form>
		</div>
	</body>
</html>

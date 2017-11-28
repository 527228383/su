<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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

</head>
	<body>
		<h1>Main Page</h1>
		<h2>欢迎${sessionScope.employee.emp_name }登录</h2>
		
		<table align="center" bordercolor="red" border="1">
			<tr>
				<td>产品名称</td>
				<td>保障项目</td>
				<td>保障范围</td>
				<td>保障期限</td>
				<td>购买金额</td>
				<td>赔付金额</td>
			</tr>
			
			<c:forEach items="${products }" var="p">
				<tr>
					<td>${p.pro_name }</td>
					<td>${p.pro_program }</td>
					<td>${p.pro_scope }</td>
					<td>${p.pro_time }</td>
					<c:forEach items="${p.pro_quote }" var="pro">
						<td>${pro.coverage }</td>
						<td>${pro.insured_amount }</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
		${pageUtil.currentPage}/${pageUtil.totalPage}
	</body>  
	
	
	
	
</html>














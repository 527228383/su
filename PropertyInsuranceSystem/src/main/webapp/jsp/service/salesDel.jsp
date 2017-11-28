<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script src="js/jquery-1.8.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>经理查询显示页</title>
	</head>
	<body>
		
		
		<div align="center" style="border:1px solid #444;height: 800px;width:1200px;margin:0 auto">
			<table  align="center" bordercolor="#000" border="2" bgcolor="#eee" style="text-align: center;margin-top: 20px"  >
				<tr>
					<td>保单编号</td>
					<td>保险名称</td>
					<td>被保人</td>
					<td>被保人身份证</td>
					<td>联系电话</td>
					<td>保单截止日期</td>
					<td>保费</td>
					<td>业务员</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${claims}" var="p">
					${p.sales_name}
					<tr>
						<td>${p.pol_id }</td>
						<td>${p.pro_name }</td>
						<td>${p.assurerDto.ass_name }</td>
						<td>${p.assurerDto.ass_id_card }</td>
						<td>${p.assurerDto.ass_tel }</td>
						<td>${p.expirationDate }</td>
						<td>${p.b_coverage }</td>
						<td>${p.sales_name }</td>
						<td>
							<a href="/sales/getPolicy/view/${p.pol_id }"><button>保单详情</button></a>
							<a href="/mannager/getPolicydetails?id=${p.pol_id }"><button>赔付详情</button></a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<p align="center">
				<a href="http://localhost/mannager/mannagerAllApply"><button type="button">返回</button></a>
			</p>
		</div>
	</body>
</html>
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
<link href="css/w_styles.css" rel="stylesheet" type="text/css"/>
</head>
	<body>
		<div id="topDiv">
			<div>
				<font>欢迎<span><a >${sessionScope.employee.emp_name }</a></span>登录</font>
			</div>
		</div>
		<div  id="proEntity" style="margin:0 auto;width:800px;  border:1px solid #b8dcff;">
			<form class="contact_form" action="/product/updateProduct" method="post" name="contact_form">
				<ul >
					<li>
						<h2>产品跟新</h2>
						<span class="required_notification">* 表示必填项</span>
					</li>
					<li>
						<label for="id">产品ID:</label>
						<input value="${product.id}" name="id" value="${product.id}" readonly="readonly"  />
					</li>
					<li>
						<label for="pro_name">产品名称:</label>
						<input type="text"  value="${product.pro_name}" readonly="readonly" name="pro_name"  />
					</li>
					<li>
						<label for="pro_program">保障项目:</label>
						<input type="text" name="pro_program" value="${product.pro_program}" />
					</li>
					<li>
						<label for="pro_scope">保障范围:</label>
						<input type="text" name="pro_scope" value="${product.pro_scope}"  />
					</li>
					<li>
						<label for="pro_time">保障期限:</label>
						<input type="text" name="pro_time" value="${product.pro_time}" />
					</li>
					<li>
						<label >产品价格-赔付金额:</label>
						<c:forEach items="${product.pro_quote}" var="p">
							
							<input value="${p.coverage}" type="text"  name="coverage" style="width: 110px;"/>
							<input type="text" value="${p.insured_amount}"  name="insured_amount"  style="width: 115px;"/>
						</c:forEach>
					</li>
					<li>
							<button class="submit" id="update"  type="submit">提交</button><br />
					</li>
				</ul>
			</form>
		</div>
	</body>
</html>

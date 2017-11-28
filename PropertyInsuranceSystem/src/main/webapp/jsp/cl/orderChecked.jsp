<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
	<link href="css/service/sjh/H-ui.min.css" rel="stylesheet" />
	<style type="text/css">
		body{
			font-size: 18px;
		}
		.breadcrumb{
			margin-left: 5px;
		}
		table{
			width: 500px;
			margin: 0 auto;
		}
	</style>
</head>
<body>
	<div class="Hui-article-box">
			<div class="Hui-article">
				<div class="cl pd-20">
					<div class="mt-10">
						<table class="table table-border table-bordered table-hover table-bg">
							<tr align="left">
								<td>订单号:</td><td>${orderDto.id}</td>
							</tr>
							<tr align="left">
								<td>投保人:</td><td>${orderDto.insureDto.ins_name}</td>
							</tr>
							<tr align="left">
								<td>保险名称:</td><td>${orderDto.productDto.pro_name}</td>
							</tr>
							<tr align="left">
								<td>订单提交日期:</td><td><fmt:formatDate value="${orderDto.d_add_date}" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr align="left">
								<td>赔偿限额(元):</td><td>${orderDto.d_insured_amount}</td>
							</tr>
							<tr align="left">
								<td>投保人电话号码:</td><td>${orderDto.insureDto.ins_tel}</td>
							</tr>
							<tr align="left">
								<td>投保财产所在地:</td><td>${checkDetailDto.address}</td>
							</tr>
							<tr align="left">
								<td>财产图片:</td>
								<td>
									<c:forEach items="${checkDetailDto.picList}" var="pic">
									&nbsp;&nbsp;<img alt="事故现场" src="upload/${pic}" style="height:80px;width:80px;">&nbsp;&nbsp;
									</c:forEach>
								</td>
							</tr>
							<tr align="left">
								<td>业务员意见:</td><td>${checkDetailDto.sales_des}</td>
							</tr>
							<tr align="left">
								<td>结论:</td>
								<td>
									<c:if test="${checkDetailDto.sales_dicision==1}">通过</c:if>
									<c:if test="${checkDetailDto.sales_dicision==0}">驳回</c:if>
								</td>
							</tr>
							<tr align="left">
								<td>业务员处理时间:</td><td><fmt:formatDate value="${checkDetailDto.sales_date}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</table>
					</div>
					<div align="center">
						<p><p>
						<input type="button"  class="btn btn-info" onclick="javascript:history.back(-1);" value="返回上一页">
						<p><p>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
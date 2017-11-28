<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>流程管理页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/service/sjh/H-ui.min.css" rel="stylesheet" />
<style type="text/css">
	#deploy{margin-left: 20px;}
	body{font-size: 18px;}
	.breadcrumb{margin-left: 5px;}
	#deployTbl{margin-top: 5px;width: 500px;}
</style>
</head>
<body>
<div class="Hui-article-box">
	<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span> 流程管理 <span class="c-gray en">&gt;</span> 流程管理 </div>
	<div class="Hui-article">
		<div id="deploy">
			<form id="deploy_form" action="act/deployProcess" method="post" enctype="multipart/form-data">
				<table id="deployTbl" class="table table-border table-bordered table-hover table-bg">
					<tr style="background-color: rgb(245,250,254)">
						<th colspan="2">流程部署</th>
					</tr>
					<tr>
						<td>流程名称</td>
						<td><input class="input-text" type="text" id="processName" name="processName" /></td>
					</tr>
					<tr>
						<td>文件</td>
						<td><input type="file" id="zipFile" name="zipFile" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="部署" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="cl pd-20">
			<div class="cl pd-5 bg-1 bk-gray"> <span class="l"> <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"> 批量删除</a></span></div>
			<div class="mt-10">
			<table class="table table-border table-bordered table-hover table-bg">
				<thead>
					<tr>
						<th scope="col" colspan="7">流程定义管理</th>
					</tr>
					<tr class="text-c">
						<th width="25"><input type="checkbox" value="" name=""></th>
						<th width="50">流程 ID</th>
						<th>流程名称</th>
						<th width="160">key</th>
						<th width="90">部署时间</th>
						<th width="50">版本</th>
						<th width="70">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.deployProcess }" var="deploy">
						<tr>
							<td><input type="checkbox" value="" name=""></td>
							<td>${deploy.id }</td>
							<td>${deploy.name }</td>
							<td>${deploy.key }</td>
							<td>
								<fmt:formatDate value="${deploy.time }" pattern="yyyy-MM-dd"/>
							</td>
							<td>${deploy.version }</td>
							<td><a onclick="deleDeploy(this)" name="deleDeploy" id="${deploy.id }">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		<hr/>
		<div align="center" id="pageDiv">
			<a name="1">首页</a>
			<c:if test="${pageUtil.currentPage > 1}">
				<a name="${pageUtil.currentPage - 1 }">上一页</a>
			</c:if>
			<c:if test="${pageUtil.totalPage > 0 }">
				<c:forEach begin="1" end="${pageUtil.totalPage }" var="num">
					<c:if test="${pageUtil.currentPage == num }">
						<font color="red">${num }</font>
					</c:if>
					<c:if test="${pageUtil.currentPage != num }">
						<a name="${num }">${num }</a>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${pageUtil.currentPage < pageUtil.totalPage}">
				<a name="${pageUtil.currentPage + 1 }">下一页</a>
			</c:if>
			<a id="lastPage" name="${pageUtil.totalPage }">尾页</a> <font color="#666666">当前${pageUtil.totalPage == 0 ? 0 : pageUtil.currentPage}/${pageUtil.totalPage }页</font>
			<input type="text" id="goPage" size="1" style="height: 20px; width: 24px;"/>
			<input type="button" value="Go" id="btnGo"/>
		</div>
	</div>
</div>
</body>
</html>
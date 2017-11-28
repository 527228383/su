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
<title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/service/sjh/H-ui.min.css" rel="stylesheet" />
	<style type="text/css">
		#searchDiv{float: right;}
		body{font-size: 18px;}
		.breadcrumb{margin-left: 5px;}
		input[type="text"]{background-color: rgb(199,237,204);}
 	</style>
</head>
	<body >
		<div class="Hui-article-box">
		<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span> 员工信息管理 <span class="c-gray en">&gt;</span> 查看员工信息 </div>
		<div class="Hui-article">
			<div class="cl pd-20">
				<div class="cl pd-5 bg-1 bk-gray">
					<span class="l"> <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"> 批量删除</a>&nbsp;&nbsp;&nbsp;<a class="btn btn-primary radius" href="emp/jumpToAddPage" target="rightFrame"> 添加角色</a></span>
					<div id="searchDiv" style="border: 1px soild red">
						<form action="" method="post" id="searchForm">
							工号: <input type="text" size="10" id="pol_id" value="" />
							姓名: <input type="text" size="10" id="pro_name" size="15" value=""/>
							职位: <input type="text" size="10" id="pro_name" size="15" value=""/>
							入职日期: <input type="text" value="${sessionScope.pageUtil.query.startDate }" id="startDate" name="startDate" onclick="WdatePicker({readOnly:true,maxDate:'%y-%M-%d'})" readonly="readonly" class="Wdate" size="12"/>-<input type="text" onclick="WdatePicker()" readonly="readonly" class="Wdate" size="12" id="endDate" name="endDate" value="${sessionScope.pageUtil.query.endDate }"/>
							<input type="button" value="搜索" id="sub"/>
							<input type="button" value="清空" id="btn"/>
						</form>
					</div>
				</div>
				<div class="mt-10">
				<table class="table table-border table-bordered table-hover table-bg">
					<thead>
						<tr>
							<th scope="col" colspan="10">员工信息管理</th>
						</tr>
						<tr>
							<th width="25"><input type="checkbox" value="" name=""></th>
							<th width="25">工号</th>
							<th width="50">姓名</th>
							<th>职位</th>
							<th>性别</th>
							<th>年龄</th>
							<th>入职日期</th>
							<th>管辖区域</th>
							<th>业务情况</th>
							<th width="70">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.list }" var="emp">
							<tr>
								<td><input type="checkbox" value="" name=""></td>
								<td>${emp.id }</td>
								<td>${emp.emp_name }</td>
								<td>${emp.position_name }</td>
								<td>
									<c:if test="${emp.emp_gender == 1 }">男</c:if>
									<c:if test="${emp.emp_gender == 0 }">女</c:if>
								</td>
								<td>${emp.emp_age }</td>
								<td><fmt:formatDate value="${emp.emp_hiredate }" pattern="yyyy-MM-dd" /></td>
								<td>
									<c:if test="${emp.position_name == '业务员' }">${emp.city_name }</c:if>
									<c:if test="${emp.position_name == '经理' }">${emp.province_name }</c:if>
									<c:if test="${emp.position_name == '超级管理员' }">全国</c:if>
								</td>
								<td>${emp.business }</td>
								<td>
									<a href="emp/jumpToUpdatePage/${emp.id }" target="rightFrame">修改</a>
									<a href="emp/jumpToAddPage" target="rightFrame">删除</a>
								</td>
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
	<!-- js -->
	<script type="JavaScript" src="js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="js/service/sjh/layer.js"></script> 
	<script type="text/javascript" src="js/service/sjh/H-ui.admin.page.js"></script>
	<script type="text/javascript">
		
	</script>
</html>
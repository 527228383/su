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
		#searchDiv{
			float: right;
		}
		body{
			font-size: 18px;
		}
		.breadcrumb{
			margin-left: 5px;
		}
		input[type="text"]{
			background-color: rgb(199,237,204);
			box-sizing: border-box;
			border-radius:4px;
			border:1px solid #c8cccf;
			color:#6a6f77;
			-web-kit-appearance:none;
		    -moz-appearance: none;
			outline:0;
			height: 23px;
			text-decoration:none;
		}
		#btnGo,#sub,#btn{
			background: rgb(90,152,222);
			border: none;
			padding: 3px 7px;
			color: white;
			box-shadow: 1px 1px 5px #B6B6B6;
			border-radius: 10px;
			text-shadow: 1px 1px 1px #9E3F3F;
			cursor: pointer;
			border:1px solid #c8cccf;
		}
 	</style>
</head>
	<body >
		<div class="Hui-article-box">
		<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span> 员工信息管理 <span class="c-gray en">&gt;</span> 查看员工信息 </div>
		<div class="Hui-article">
			<div class="cl pd-20">
				<div class="cl pd-5 bg-1 bk-gray">
					<span class="l"> <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius" id="allDel"> 批量删除</a>&nbsp;&nbsp;&nbsp;<a class="btn btn-primary radius" href="emp/jumpToAddPage" target="rightFrame"> 添加员工</a></span>
					<div id="searchDiv" style="border: 1px soild red">
						<form action="emp/getEmpList" method="post" id="searchForm">
							<input type="hidden" name="currentPage" />
							工号: <input type="text" size="10" name="emp_id"  value="${requestScope.pageUtil.query.emp_id }"/>
							姓名: <input type="text" size="10" name="emp_name" size="15"  value="${requestScope.pageUtil.query.emp_name }"/>
							职位: <input type="text" size="10" name="pos_name" size="15"  value="${requestScope.pageUtil.query.pos_name }"/>
							
							入职日期: <input type="text" value='<fmt:formatDate value="${requestScope.pageUtil.query.startDate }" pattern="yyyy-MM-dd"/>' name="startDate" onclick="WdatePicker({readOnly:true,maxDate:'%y-%M-%d'})" readonly="readonly" class="Wdate" size="12"/>-<input type="text" onclick="WdatePicker()" readonly="readonly" class="Wdate" size="12" name="endDate" value='<fmt:formatDate value="${requestScope.pageUtil.query.endDate }" pattern="yyyy-MM-dd"/>'/>
							<input type="submit" value="搜索" id="sub"/>
							<input type="button" value="清空" id="btn"/>
						</form>
					</div>
				</div>
				<div class="mt-10">
				<form action="emp/deleteEmployee" method="post" id="empForm">
				<table class="table table-border table-bordered table-hover table-bg">
					<thead>
						<tr>
							<th scope="col" colspan="10">员工信息管理</th>
						</tr>
						<tr>
							<th width="25"><input type="checkbox" id="allEmp"></th>
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
								<td><input type="checkbox" class="ckbox" name="ids" value="${emp.id }"></td>
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
									<c:if test="${emp.position_name == '业务员' }">${emp.province_name }-${emp.city_name }</c:if>
									<c:if test="${emp.position_name == '经理' }">${emp.province_name }</c:if>
									<c:if test="${emp.position_name == '超级管理员' }">全国</c:if>
									<c:if test="${emp.position_name == '人事' }">全国</c:if>
								</td>
								<td>${emp.business }</td>
								<td>
									<a href="emp/jumpToUpdatePage/${emp.id }" target="rightFrame">修改</a>
									<a href="emp/deleteEmployee?ids=${emp.id }" name="id" class="delOne">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</form>
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
	<script src="/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".ckbox").click(function(){
				var flag = true;
				$(".ckbox").each(function(){
					if(!$(this).prop("checked")){
						flag = false;
					}
				});
				$("#allEmp").prop("checked", flag);
			});
			
			//全选
			$("#allEmp").click(function(){
				$(".ckbox").prop("checked", $("#allEmp").prop("checked"));
			});
			
			//清空
			$("#btn").click(function(){
				$("input[name='emp_id']").val("");
				$("input[name='pro_name']").val("");
				$("input[name='pos_name']").val("");
				$("input[name='startDate']").val("");
				$("input[name='endDate']").val("");
			});
			
			//上下页
			$("#pageDiv a").click(function(){
				$("input[name='currentPage']").val($(this).attr("name"));
				$("#searchForm").submit();
			})
			
			//单删
			$(".delOne").click(function(){
				if(!confirm("确定要删除该员工吗?")){
					return false;
				}
			});
			
			//全删
			$("#allDel").click(function(){
				var count = 0;
				$("input[name='ids']").each(function(){
					if($(this).prop("checked")){
						count += 1;
					}
				});
				if(count > 0){
					if(confirm("确认要删除选中的员工吗?")){
						$("#empForm").submit();
					}
				}else{
					alert("请选择要删除的员工!");
				};
			});
			
			// go
			$("#btnGo").click(function(){
				var $page = $.trim($("#goPage").val());
				var $maxPage = $.trim($("#lastPage").attr("name"));
				if($page != ""){
					if($page <= $maxPage ){
						$("input[name='currentPage']").val($(this).attr("name"));
						$("#searchForm").submit();
					}else{
						alert("请输入有效页码!");
					}
				}else{
					alert("请输入页码!");
				}
				
				
			});
		})
	</script>
</html>
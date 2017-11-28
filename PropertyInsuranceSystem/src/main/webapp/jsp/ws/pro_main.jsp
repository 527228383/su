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
		}
 	</style>
</head>
	<body >
		<div class="Hui-article-box">
		<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 产品列表展示 </div>
		<div class="Hui-article">
			<div class="cl pd-20">
				<div class="cl pd-5 bg-1 bk-gray">
					<span class="l"> <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius" id="allDel"> 批量删除</a>&nbsp;&nbsp;&nbsp;<a class="btn btn-primary radius" href="<%=basePath%>jsp/ws/addPro.jsp" target="rightFrame"> 添加产品</a></span>
					<div id="searchDiv" style="border: 1px soild red">
						<form action="/product/listpro?type=1" method="post" id="searchForm">
							<input type="hidden" name="currentPage" />
							产品名称: <input type="text" size="10" name="pro_name" size="15"  value="${pageUtil.query.pro_name }"/>
							<input type="submit" value="搜索" id="sub"/>
							<input type="button" value="清空" id="btn"/>
						</form>
					</div>
				</div>
				<div class="mt-10">
				<form action="product/deleteProducts" method="post" id="proForm">
				<table class="table table-border table-bordered table-hover table-bg">
					<thead>
						<tr>
							<th scope="col" colspan="10">产品管理</th>
						</tr>
						<tr>
							<th width="25"><input type="checkbox" id="allPro"></th>
							<th style="text-align: center" width="250">产品编号</th>
							<th style="text-align: center" width="150">产品名称</th>
							<th style="text-align: center" width="180">保障项目</th>
							<th style="text-align: center" width="100">保障项范围</th>
							<th style="text-align: center">保障期限</th>
							<th style="text-align: center">产品图片</th>
							<th style="text-align: center" width="100">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products }" var="p">
							<tr>
								<td><input type="checkbox" class="ckbox" name="ids" value="${p.id}"></td>
								<td style="text-align: center" >${p.id}</td>
								<td style="text-align: center">${p.pro_name }</td>
								<td style="text-align: center">${p.pro_program }</td>
								<td style="text-align: center">${p.pro_scope }</td>
								<td style="text-align: center">${p.pro_time }</td>
								<td style="text-align: center"><img alt="" src="<%=basePath%>${p.pro_pic}" width="50px" height="50px"></td>
								<td style="text-align: center">
									<a href="/product/selectById?id=${p.id}" target="rightFrame">修改</a>
									<a href="/product/deleteProducts?ids=${p.id}" name="id" class="delOne">删除</a>
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
				$("#allPro").prop("checked", flag);
			});
			
			//全选
			$("#allPro").click(function(){
				$(".ckbox").prop("checked", $("#allPro").prop("checked"));
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
			});
			//单删
			$(".delOne").click(function(){
				if(!confirm("删除后不可恢复,确定要删除该产品吗?")){
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
					if(confirm("产品删除不可恢复,确定要删除吗?")){
						$("#proForm").submit();
					}
				}else{
					alert("请选择要删除的产品!");
				};
			});
			
			// go
			$("#btnGo").click(function(){
				var $page = $.trim($("#goPage").val());
				
				var $maxPage = $.trim($("#lastPage").attr("name"));
				if($page != ""){
					if(($page <= $maxPage) && ($page>0)){
						$("input[name='currentPage']").val($("#goPage").val());
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
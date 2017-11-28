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
			margin: 0 auto;
			width: 750px;
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
		<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span> 客户理赔管理 <span class="c-gray en">&gt;</span> <span id="cdType">未处理</span> </div>
		<div class="Hui-article">
			<div class="cl pd-20">
			<div id="searchDiv" style="border: 1px soild red">
				<form action="act/getNoDealWithClaimDetails" method="post" id="searchForm">
					<input type="hidden" name="currentPage" id="currentPage"/>
					保单号: <input type="text" name="pol_id" value="${requestScope.pageUtil.query.pol_id }"/>
					产品名称: <input type="text"  name="pro_name" size="15" value="${requestScope.pageUtil.query.pro_name }"/>
					保险期限: <input type="text" value='<fmt:formatDate value="${requestScope.pageUtil.query.startDate }" pattern="yyyy-MM-dd"/>' name="startDate" name="startDate" onclick="WdatePicker({readOnly:true,maxDate:'%y-%M-%d'})" readonly="readonly" class="Wdate" size="12"/>-<input type="text" onclick="WdatePicker()" readonly="readonly" class="Wdate" size="12" name="endDate" name="endDate" value='<fmt:formatDate value="${requestScope.pageUtil.query.endDate }" pattern="yyyy-MM-dd"/>'/>
					<input type="submit" value="搜索" id="sub"/>
					<input type="button" value="清空" id="btn"/>
				</form>
			</div>
				<div class="mt-10">
				<table class="table table-border table-bordered table-hover table-bg">
					<thead>
						<tr>
							<th scope="col" colspan="9">客户理赔处理</th>
						</tr>
						<tr class="text-c">
							<th width="240">保单号</th>
							<th width="40">受保人</th>
							<th width="130">受保人身份证</th>
							<th width="90">联系电话</th>
							<th width="90">保单有效期</th>
							<th>产品名称</th>
							<th width="60">保险费</th>
							<th width="60">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.list }" var="cd">
							<tr>
								<td>${cd.pol_id }</td>
								<td>${cd.assurerDto.ass_name }</td>
								<td>${cd.assurerDto.ass_id_card }</td>
								<td>${cd.assurerDto.ass_tel }</td>
								<td><fmt:formatDate value="${cd.expirationDate}" pattern="yyyy-MM-dd" /></td>
								<td>${cd.pro_name }</td>
								<td>${cd.b_coverage }</td>
								<td>
									<a href="emp/getPolicyById/${cd.pol_id }" target="rightFrame">保单详情</a>
									<a href="emp/getClaimDetailsDto/${cd.id }">理赔详情</a>
								</td>
							</tr>
						</c:forEach>
						<c:if test="${requestScope.list == null}">
							<tr>
								<td colspan="8">
									<font color="red" size="3">暂时没有未处理的理赔</font>
								</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				</div>
			</div>
			<hr/>
			<div align="center" id="pageDiv">
				<a name="1">首页</a>
				<c:if test="${requestScope.pageUtil.currentPage > 1}">
					<a name="${requestScope.pageUtil.currentPage - 1 }">上一页</a>
				</c:if>
				<c:if test="${requestScope.pageUtil.totalPage > 0 }">
					<c:forEach begin="1" end="${requestScope.pageUtil.totalPage }" var="num">
						<c:if test="${requestScope.pageUtil.currentPage == num }">
							<font color="red">${num }</font>
						</c:if>
						<c:if test="${requestScope.pageUtil.currentPage != num }">
							<a name="${num }">${num }</a>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${requestScope.pageUtil.currentPage < requestScope.pageUtil.totalPage}">
					<a name="${requestScope.pageUtil.currentPage + 1 }">下一页</a>
				</c:if>
				<a id="lastPage" name="${requestScope.pageUtil.totalPage }">尾页</a> <font color="#666666">当前${requestScope.pageUtil.totalPage == 0 ? 0 : requestScope.pageUtil.currentPage}/${requestScope.pageUtil.totalPage }页</font>
				<input type="text" id="goPage" size="1" style="height: 20px; width: 24px;"/>
				<input type="button" value="Go" id="btnGo"/>
			</div>
			</div>
		</div>
	</body>
	<script src="js/jquery-1.8.0.min.js"></script>
	<script src="/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		//上下页
		$("#pageDiv a").click(function(){
			$("input[name='currentPage']").val($(this).attr("name"));
			$("#searchForm").submit();
		})
		
		// go
		$("#btnGo").click(function(){
			var $page = $.trim($("#goPage").val());
			var $maxPage = $.trim($("#lastPage").attr("name"));
			if($page != ""){
				if($page <= $maxPage ){
					$("input[name='currentPage']").val($("#goPage").val());
					$("#searchForm").submit();
				}else{
					alert("请输入有效页码!");
				}
			}else{
				alert("请输入页码!");
			}
		});
		
		//清空
		$("#btn").click(function(){
			$("input[name='pol_id']").val("");
			$("input[name='pro_name']").val("");
			$("input[name='startDate']").val("");
			$("input[name='endDate']").val("");
		});
		
	</script>
</html>
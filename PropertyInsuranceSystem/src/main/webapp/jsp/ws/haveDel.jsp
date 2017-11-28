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
			width: 730px;
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
		<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span> 客户理赔管理 <span class="c-gray en">&gt;</span> <span id="cdType">已处理</span> </div>
		<div class="Hui-article">
			<div class="cl pd-20">
			<div id="searchDiv" style="border: 1px soild red">
				<form action="act/getHaveDealWithClaimDetails" method="get" id="page">
					<input type="hidden" name="currentPage" id="currentPage"/>
					保单号: <input type="text" name="pol_id" value="${pageUtil.query.pol_id }"/>
					产品名称: <input type="text"  name="pro_name" size="15" value="${pageUtil.query.pro_name }"/>
					保险期限:<input type="text" value='<fmt:formatDate value="${pageUtil.query.startDate }" pattern="yyyy-MM-dd"/>' name="startDate" onclick="WdatePicker({readOnly:true,maxDate:'%y-%M-%d'})" readonly="readonly" class="Wdate" size="12"/>-<input type="text" onclick="WdatePicker()" readonly="readonly" class="Wdate" size="12" name="endDate" value='<fmt:formatDate value="${pageUtil.query.endDate }" pattern="yyyy-MM-dd"/>'/>
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
							<th width="40">保单号</th>
							<th width="60">保险名称</th>
							<th width="40">被保人</th>
							<th width="130">被保人身份证</th>
							<th width="90">联系电话</th>
							<th width="70">保单截止日期</th>
							<th width="60">保险费</th>
							<th width="40">经办人</th>
							<th width="60">操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list}" var="p">
						<tr  class="tr2" onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
								<td><font size="2.5">${p.pol_id }</font></td>
								<td><font size="2.5">${p.pro_name }</font></td>
								<td><font size="2.5">${p.assurerDto.ass_name }</font></td>
								<td><font size="2.5">${p.assurerDto.ass_id_card }</font></td>
								<td><font size="2.5">${p.assurerDto.ass_tel }</font></td>
								<td><font size="2.5"><fmt:formatDate value="${p.expirationDate }" pattern="yyyy-MM-dd" /></font></td>
								<td><font size="2.5">${p.b_coverage }</font></td>
								<td><a href="/mannager/listSalesDel?emp_id=${p.sales_id }"><font size="2.5px">${p.sales_name }</font></a></td>
								<td>
									<a href="/sales/getPolicy/view/${p.pol_id }"><button style="padding-top:2.5px"><font size="2.5">保单详情</font></button></a>
									<a href="emp/getClaimDetailsDto/${p.id }"><button style="padding-top:2.5px"><font size="2.5">赔付详情</font></button></a>
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
	<script src="js/jquery-1.8.0.min.js"></script>
	<script src="/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#btn").click(function(){
				$("input[name='pol_id']").val("");
				$("input[name='pro_name']").val("");
				$("input[name='startDate']").val("");
				$("input[name='endDate']").val("");
			});
			
		});
		
		//上下页
		$("#pageDiv a").click(function(){
			$("input[name='currentPage']").val($(this).attr("name"));
			$("#page").submit();
		});
		
		// go
		$("#btnGo").click(function(){
			var $page = $.trim($("#goPage").val());
			var $maxPage = $.trim($("#lastPage").attr("name"));
			if($page != ""){
				if($page <= $maxPage ){
					$("input[name='currentPage']").val($("#goPage").val());
					$("#page").submit();
				}else{
					alert("请输入有效页码!");
				}
			}else{
				alert("请输入页码!");
			}
			
			
		});
		
	</script>
</html>
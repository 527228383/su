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
		<script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
		<title>经理首页</title>
		<script type="text/javascript">
			$(function(){
				$("#reset").click(function(){
					$("[type='text']").val("");
					resetForm();
				});
				var currentPage = parseInt($("#currentPage").val());
				var totalPage = parseInt($("#totalPage").val());
				
				if(currentPage<=1){
					$("#home_page").prop("disabled","disabled");
					$("#up_page").prop("disabled","disabled");
				}
				if(currentPage>totalPage){
					$("#next_page").prop("disabled","disabled");
					$("#end_page").prop("disabled","disabled");
				}
				$("#home_page").click(function(){
					$("#currentPage").val(1);
					$("#page").submit();
				});
				$("#up_page").click(function(){
					$("#currentPage").val(currentPage-1);
					$("#page").submit();
				});
				$("#next_page").click(function(){
					$("#currentPage").val(currentPage+1);
					$("#page").submit();
				});
				$("#end_page").click(function(){
					$("#currentPage").val(totalPage);
					$("#page").submit();
				});
				$("#goto").click(function(){
					var gotopage=$("#goto_page").val();
					if(gotopage>totalPage || gotopage<1){
						alert("您的输入有误,请正确输入");
					}
					$("#currentPage").val($("#goto_page").val());
					$("#page").submit();
				});
			})
			function resetForm(){
				$("#currentPage").val(1);
				$("#page").submit();
			}
		</script>
	</head>
	<body>
		<h2>欢迎${sessionScope.employee.emp_name }登录</h2>
		<div align="center" style="border:1px solid #444;height: 100px;width:1200px;margin:0 auto">
			<p>
				<a href="/mannager/mannagerAllApply"><button>全部保单</button></a>
				<a href="/mannager/mannagerAllApply?s=1"><button>待处理</button></a>
				<a href="/mannager/mannagerAllApply?s=2"><button>已处理</button></a>
			</p>
		</div>
		<div align="center" style="border:1px solid #444;height: 100px;width:1200px;margin:0 auto">
			<form action="mannager/mannagerAllApply" method="get" id="page">
				<p>
					<input type="hidden" name="currentPage" id="currentPage" value="${pageUtil.currentPage}"/>
					<input type="hidden" name="totalPage" id="totalPage" value="${pageUtil.totalPage}"/>
					产品名称：<input name="pro_name" type="text">
					保单号:<input name="pol_id" type="text">
					订单提交日期:<input type="text" name="startDate" value="<fmt:formatDate value="${query.startDate}" pattern="yyyy-MM-dd"/>" class="Wdate" onclick="WdatePicker()"/>-<input type="text" name="endDate" value="<fmt:formatDate value="${query.endDate}" pattern="yyyy-MM-dd"/>" class="Wdate" onclick="WdatePicker()"/>&nbsp;&nbsp;
					<button type="submit">搜索</button>&nbsp;&nbsp;
					<button type="button" id="reset">重置</button>
				</p>
			</form>
		</div>
		<div align="center" style="border:1px solid #444;height: 300px;width:1200px;margin:0 auto">
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
				<c:forEach items="${claimDetailsDto}" var="p">
					<tr>
						<td>${p.pol_id }</td>
						<td>${p.pro_name }</td>
						<td>${p.assurerDto.ass_name }</td>
						<td>${p.assurerDto.ass_id_card }</td>
						<td>${p.assurerDto.ass_tel }</td>
						<td>${p.expirationDate }</td>
						<td>${p.b_coverage }</td>
						<td><a href="/mannager/listSalesDel?id=${p.sales_id }">${p.sales_name }</a></td>
						<td>
							<a href="/sales/getPolicy/view/${p.pol_id }"><button>保单详情</button></a>
							<a href="/mannager/getPolicydetails?id=${p.pol_id }"><button>赔付详情</button></a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<p align="center">
				<button type="button" id="home_page">首页</button>&nbsp;&nbsp;
				<button type="button" id="up_page">上一页</button>&nbsp;&nbsp;
				<button type="button" id="next_page">下一页</button>&nbsp;&nbsp;
				<button type="button" id="end_page">尾页</button>&nbsp;&nbsp;
				当前页是<font color="red">${pageUtil.currentPage}</font>/<font color="red">${pageUtil.totalPage}</font>&nbsp;
				共<font color="red">${pageUtil.rowSize}</font>条数据&nbsp;
				<input style="width:45px" type="text" id="goto_page"/>
				<button type="button" id="goto">跳转</button>
			</p>
		</div>
	</body>
</html>
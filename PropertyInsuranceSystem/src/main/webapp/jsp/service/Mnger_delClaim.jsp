<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.zl.util.PageUtil" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'MyJsp.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#addPic").click(function(){
 				var $tr=$("<tr align='left'><td></td><td><input type='file' name='pics'/></td></tr>");
				$("table #pic_property").append($tr);
			})
		});
	</script>
  </head>
  <body>
	<center>
		<p>
		<h2>理赔申请表</h2>
		<form action="mannager/MannagerReviewClaim" method="post" enctype="multipart/form-data">
			<!-- 隐藏域传递保单ID -->	
			<input type="text" name="pol_id" value="${claimDetailsDto.pol_id}"/>
			<table cellpadding="1" cellspacing="1" border="1" bordercolor="grey">
				<tr align="left">
					<td>投保人:</td><td>${claimDetailsDto.insureDto.ins_name}</td>
				</tr>
				<tr align="left">
					<td>保单号:</td><td>${claimDetailsDto.pol_id}</td>
				</tr>
				<tr align="left">
					<td>保险名称:</td><td>${claimDetailsDto.pro_name}</td>
				</tr>
				<tr align="left">
					<td>赔偿限额(元):</td><td>${claimDetailsDto.b_insured_amount}
						<input type="hidden" value="${claimDetailsDto.b_insured_amount}" name="b_insured_amount">
				</td>
					
				</tr>
				<tr align="left">
					<td>投保人电话号码:</td><td>${claimDetailsDto.insureDto.ins_tel}</td>
				</tr>
				<tr align="left">
					<td>事故发生时间:</td><td>${claimDetailsDto.accident_date}</td>
				</tr>
				<tr align="left">
					<td>事故发生地点:</td><td>${claimDetailsDto.address}</td>
				</tr>
				<%-- <tr id="pic_property" align="left">
					
					<td>事故现场图片:</td>

					<c:forEach items="${claimDetailsDto.picList}" var="pic" varStatus="in" >
						<td>${pic.get(in)} </td>
					</c:forEach>
				</tr> --%>
				<tr align="left">
					<td>事故描述:</td><td>${claimDetailsDto.accident_des}</td>
				</tr>
				<tr align="left">
					<td>业务员:</td><td>${claimDetailsDto.sales_name}</td>
				</tr>
				<tr align="left">
					<td>审核意见:</td><td>${claimDetailsDto.sales_idea}</td>
				</tr>
				<tr align="left">
					<td>结论:</td><td><input type="radio" name="mgr_dicision" value="1"/>通过<input type="radio" name="mgr_dicision" value="0"/>驳回</td>
				</tr>	
				<tr align="left">
					<td>经理建议:</td><td><textarea cols="50" rows="10" name="mgr_idea"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="提交"/>
		</form>
	</center>
  </body>
</html>
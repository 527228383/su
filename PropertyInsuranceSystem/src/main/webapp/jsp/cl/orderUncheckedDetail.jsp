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
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#addPic").click(function(){
				var $tr=$("<tr align='left'><td></td><td><input type='file' name='pics'/><input type='button' class='btn' value='删除' onclick='delPic(this)'/></td></tr>");
				$("table #position").before($tr);
			});
		});
		function delPic(obj){
			$(obj).parent().parent().remove();
		};
	</script>
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
		<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span> 待处理订单 <span class="c-gray en">&gt;</span> 待核实 </div>
			<div class="Hui-article">
				<div class="cl pd-20">
					<div class="mt-10">
					<form action="sales/checkOrder" method="post" enctype="multipart/form-data">
						<!-- 隐藏域传递订单ID -->
						<input type="hidden" name="ins_id" value="${orderDto.id}"/>
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
								<td>投保财产所在地:</td><td><input type="text" name="address"/></td>
							</tr>
							<tr align="left">
								<td>财产图片:</td><td><input type="file" name="pics"/><input type="button" id="addPic" class="btn btn-default"value="添加图片"/></td>
							</tr>
							<tr id ="position" align="left">
								<td>业务员意见:</td><td><textarea cols="50" rows="10" name="sales_des"></textarea></td>
							</tr>
							<tr align="left">
								<td>结论:</td><td><input type="radio" name="sales_dicision" value="1"/>通过
								<input type="radio" name="sales_dicision" value="0"/>驳回</td>
							</tr>
						</table>
						<center>
							<input type="submit" class="btn btn-primary"value="提交"/>
							<input type="reset"class="btn btn-primary" value="重置"/>
						</center>
					</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
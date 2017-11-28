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
		body{
			font-size: 18px;
		}
		.breadcrumb{
			margin-left: 5px;
		}
		table{
			width: 600px;
			margin: 0 auto;
		}
	</style>
</head>
<body>
	<div class="Hui-article-box">
		<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 发布产品信息 </div>
			<div class="Hui-article">
				<div class="cl pd-20">
					<div class="mt-10">
					<form action="product/insertPro"  method="post" enctype="multipart/form-data" >
						<table class="table table-border table-bordered table-hover table-bg">
							<tr style="background-color: rgb(245,250,254)">
								<th colspan="2">添加产品</th>
							</tr>
							<tr>
								<td width="200px">产品名称</td>
								<td>
									<font id="nameMess" color="red" size="2"></font><br/>
									<input class="input-text" type="text" name="pro_name"  id="pr_name"/>
								</td>
							</tr>
							<tr>
								<td>保障项目</td>
								<td>
									<font id="ageMess" color="red" size="2"></font><br/>
									<input class="input-text" type="text" name="pro_program"  id="pr_pm"/>
								</td>
							</tr>
							<tr>
								<td>保障范围</td>
								<td>
									<font id="genderMess" color="red" size="2"></font><br/>
									<input  class="input-text" type="input-text" name="pro_scope"  id="pr_sco" /> 
								</td>
							</tr>
							<tr>
								<td>保障期限</td>
								<td>
									<font id="idCardMess" color="red" size="2"></font><br/>
									<input class="input-text" type="input-text" name="pro_time"  id="pr_times" />
								</td>
							</tr>
							<tr>
								<td>产品价格-赔付金额</td>
								<td>
										<input type="input-text" name="coverage" id="pro_mon1"/>-
	
										<input  type="input-text" name="insured_amount" id="pro_mon1"/>
										<input type="button" class="btn btn-info" value="添加报价" id="pro_add1">
								</td>	
							</tr>
							<tr>
								<td>添加产品图片</td>
								<td><input type="file" name="pic"></td>
							</tr>
							<tr id="center">
								<td></td>
								<td>
									<input type="submit"  class="btn btn-primary" value="添加产品" id="pro_add2"/> 
								</td>
							</tr>
						</table>
					</form>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<!-- 	<script type="text/javascript" src="js/jquery.validate.js"></script> -->
<!-- 	<script type="text/javascript" src="js/messages_zh.js"></script> -->
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
	<script>
		$(function(){
			$("#pro_add1").click(function(){
				$("#center").before("<tr><td></td><td><input type='input-text' name='coverage'/>-<input  type='input-text' name='insured_amount'/>&nbsp;<input type='button'class='btn' value='删除' onclick='delmyself(this)'></tr>");
			});
		});
		function delmyself(obj){
			$(obj).parent().parent().remove();
		}
		
		
	</script>
</html>
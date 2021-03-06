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
			width: 500px;
			margin: 0 auto;
		}
	</style>
</head>
<body>
	<div class="Hui-article-box">
		<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span> 客户理赔管理 <span class="c-gray en">&gt;</span> 理赔详情 </div>
			<div class="Hui-article">
				<div class="cl pd-20">
					<div class="mt-10">
					<form action="act/dealWithClaimDetails" method="post" enctype="multipart/form-data">
						<table class="table table-border table-bordered table-hover table-bg">
							<tr align="left">
								<td>投保人:</td><td>${claimDetailsDto.insureDto.ins_name}</td>
							</tr>
							<tr align="left">
								<td>保险名称:</td><td>${claimDetailsDto.pro_name}</td>
							</tr>
							<tr align="left">
								<td>赔偿限额(元):</td><td>${claimDetailsDto.b_insured_amount}</td>
							</tr>
							<tr align="left">
								<td>投保人电话号码:</td><td>${claimDetailsDto.insureDto.ins_tel}</td>
							</tr>
							<tr align="left">
								<td>事故发生时间:</td>
								<td>
									<c:if test="${claimDetailsDto.accident_date != '' }">
										<fmt:formatDate value="${claimDetailsDto.accident_date }" pattern="yyyy-MM-dd" />
									</c:if>
								</td>
							</tr>
							<tr align="left">
								<td>事故发生地点:</td><td>${claimDetailsDto.address }</td>
							</tr>
							<tr align="left">
								<td>事故现场图片:</td>
								<td>
									<c:forEach items="${claimDetailsDto.picList }" var="pic">
										<img src="${pic }">
									</c:forEach>
								</td>
							</tr>
							<tr id="position" align="left">
								<td>事故描述:</td><td>${claimDetailsDto.accident_des }</td>
							</tr>
							<tr align="left">
								<td>业务员名字:</td><td>${claimDetailsDto.sales_name }</td>
							</tr>
							<tr align="left">
								<td>业务员意见:</td><td>${claimDetailsDto.sales_idea }</td>
							</tr>
							<tr align="left">
								<td>结论:</td><td>通过</td>
							</tr>
							<tr align="left">
								<td>时间:</td>
								<td>
									<c:if test="${claimDetailsDto.sales_date != '' }">
										<fmt:formatDate value="${claimDetailsDto.sales_date }" pattern="yyyy-MM-dd"></fmt:formatDate>
									</c:if>
								</td>
							</tr>
							<tr align="left">
								<td>经理名字:</td><td>${claimDetailsDto.mgr_name}</td>	
							</tr>
							<tr align="left">
								<td>经理意见:</td><td>${claimDetailsDto.mgr_idea }</td>
							</tr>
							<tr align="left">
								<td>结论:</td><td>通过</td>
							</tr>
							<tr align="left">
								<td>时间:</td>
								<td>
									<c:if test="${claimDetailsDto.mgr_date != '' }">
										<fmt:formatDate value="${claimDetailsDto.mgr_date }" pattern="yyyy-MM-dd"></fmt:formatDate>
									</c:if>
								</td>
							</tr>
							<tr align="left">
								<td>管理员名字:</td><td>${claimDetailsDto.admin_name}</td>	
							</tr>
							<tr align="left">
								<td>管理员意见:</td><td>${claimDetailsDto.admin_idea }</td>
							</tr>
							<tr align="left">
								<td>结论:</td><td>通过</td>
							</tr>
							<tr align="left">
								<td>时间:</td>
								<td>
									<c:if test="${claimDetailsDto.admin_date != '' }">
										<fmt:formatDate value="${claimDetailsDto.admin_date }" pattern="yyyy-MM-dd"></fmt:formatDate>
									</c:if>
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
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
	<script>
		$(function(){
			$("#upSerBtn").click(function(){
				var $emp_id = $.trim($("#emp_id").val());
				if($emp_id != ""){
					$.ajax({  
				        type:"post",  
				        url:"emp/jumpToUpdatePage/" + $emp_id,  
				        data:{url: "service/personnel/upEmp"},  
				        dataType:"text",  
				        error: function(data){alert("error");},  
				        success:function(data){  
				            $("#rightDiv").html(data);  
				        }  
				    });
				}else{
					alert("请输入员工工号!");
				}
			});
			
			$("#upBtn").click(function(){
				var $id = $("#id").val();
				var $address = $("#emp_address").val();
				var $joinTime = $("#emp_hiredate").val();
				var $position = $("select option:selected").val();
				$.ajax({  
			        type:"post",  
			        url:"emp/updateEmployee/",  
			        data:{url: "service/personnel/upEmp",emp_position_id: $position,  id: $id, emp_address: $address, emp_hiredate: $joinTime},  
			        dataType:"text",  
			        error: function(data){alert("修改失败");},  
			        success:function(data){
			        	alert("修改成功!");
			            $("#rightDiv").html(data);  
			        }  
			    });
			});
			
			$("select[name='emp_province_id']").change(function(){
				var $city = $("select[name='emp_city_id']");
				var $pcode = $("select[name='emp_province_id'] option:selected").val();
				$city.empty();
				$.ajax({
					url: "emp/getCityByPriCode/" + $pcode,
					type: "post",
					dataType: "json",
					success: function(data){
						if(data != "" && data != null){
							var $op = "";
							$.each(data, function(i, n){
								$op += "<option value" + n.city_code + ">" + n.city_name + "</option>";
							});
							$city.append($op);
						}else{
							alert("该省份没有地级市");
						}
					},
					error: function(){
						alert("网络超时");
					}
				})
			})
		})
	</script>
</html>
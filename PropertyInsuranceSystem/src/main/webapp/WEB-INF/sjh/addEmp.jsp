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
		body{font-size: 18px;}
		.breadcrumb{margin-left: 5px;}
		table{width: 500px;margin: 0 auto;}
	</style>
</head>
<body>
	<div class="Hui-article-box">
		<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span> 员工信息管理 <span class="c-gray en">&gt;</span> 添加员工信息 </div>
			<div class="Hui-article">
				<div class="cl pd-20">
					<div class="mt-10">
					<form action="emp/updateEmployee" method="post">
						<table class="table table-border table-bordered table-hover table-bg">
							<tr style="background-color: rgb(245,250,254)">
								<th colspan="2">添加员工</th>
							</tr>
							<tr>
								<td width="200px">姓名</td>
								<td><input class="input-text" type="text" name="emp_name" /></td>
							</tr>
							<tr>
								<td>年龄</td>
								<td><input class="input-text" type="text" name="emp_age" /></td>
							</tr>
							<tr>
								<td>性别</td>
								<td>
									<input type="radio" name="emp_gender" checked="checked" /> 男
									<input type="radio" name="emp_gender" /> 女
								</td>
							</tr>
							<tr>
								<td>身份证</td>
								<td><input class="input-text" type="text" name="emp_id_card" /></td>
							</tr>
							<tr>
								<td>户籍地</td>
								<td><input class="input-text" type="text" name="emp_address" /></td>
							</tr>
							<tr>
								<td>职位</td>
								<td>
									<select name="emp_position_id">
										<option value="0">-请选择-</option>
										<c:forEach items="${requestScope.posList }" var="pos">
											<option value="${pos.id }">${pos.pos_name }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>入职日期</td>
								<td><input type="text" id="emp_hiredate" value='<fmt:formatDate value="${requestScope.upEmp.emp_hiredate }" pattern="yyyy-MM-dd"/>' class="Wdate" onclick="WdatePicker()" readonly="readonly" size="12"/></td>
							</tr>
							<tr>
								<td>管辖区域</td>
								<td colspan="2">
									<select name="emp_province_id">
										<option value="0">-省份-</option>
										<c:forEach items="${requestScope.priList }" var="p">
											<option value="${p.pcode }">${p.pname }</option>
										</c:forEach>
									</select>
									<select name="emp_province_id">
										<option value="0">-城市-</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<input id="upBtn" type="button" value="修改" />
									<input type="reset" value="重置" />
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
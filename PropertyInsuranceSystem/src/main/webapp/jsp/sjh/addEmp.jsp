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
		input[type="text"]{
			border-radius:4px;
		}
	</style>
</head>
<body>
	<div class="Hui-article-box">
		<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span> 员工信息管理 <span class="c-gray en">&gt;</span> 添加员工信息 </div>
			<div class="Hui-article">
				<div class="cl pd-20">
					<div class="mt-10">
					<form action="emp/addEmployee" method="post" id="addForm">
						<table class="table table-border table-bordered table-hover table-bg">
							<tr style="background-color: rgb(245,250,254)">
								<th colspan="2">添加员工</th>
							</tr>
							<tr>
								<td width="200px">姓名</td>
								<td>
									<font id="nameMess" color="red" size="2"></font><br/>
									<input class="input-text" type="text" name="emp_name" id="emp_name"/>
								</td>
							</tr>
							<tr>
								<td>年龄</td>
								<td>
									<font id="ageMess" color="red" size="2"></font><br/>
									<input class="input-text" type="text" name="emp_age"/>
								</td>
							</tr>
							<tr>
								<td>性别</td>
								<td>
									<font id="genderMess" color="red" size="2"></font><br/>
									<input type="radio" name="emp_gender" checked="checked" value="1" /> 男
									<input type="radio" name="emp_gender" value="0" /> 女
								</td>
							</tr>
							<tr>
								<td>身份证</td>
								<td>
									<font id="idCardMess" color="red" size="2"></font><br/>
									<input class="input-text" type="text" name="emp_id_card" />
								</td>
							</tr>
							<tr>
								<td>户籍地</td>
								<td>
									<font id="addressMess" color="red" size="2"></font><br/>
									<input class="input-text" type="text" name="emp_address" />
								</td>
							</tr>
							<tr>
								<td>职位</td>
								<td>
									<font id="posMess" color="red" size="2"></font><br/>
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
								<td>
									<font id="joinMess" color="red" size="2"></font><br/>
									<input name="emp_hiredate" type="text" id="emp_hiredate" value='<fmt:formatDate value="${requestScope.upEmp.emp_hiredate }" pattern="yyyy-MM-dd"/>' class="Wdate" onclick="WdatePicker({maxDate:new Date()})" readonly="readonly" size="12"/>
								</td>
							</tr>
							<tr>
								<td>管辖区域</td>
								<td colspan="2">
									<font id="proMess" color="red" size="2"></font>
									<font id="cityMess" color="red" size="2"></font><br/>
									<select name="emp_province_id">
										<option value="0">-省份-</option>
										<c:forEach items="${requestScope.priList }" var="p">
											<option value="${p.pcode }">${p.pname }</option>
										</c:forEach>
									</select>
									<select name="emp_city_id">
										<option value="0">-城市-</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<input id="addbtn" type="button" value="添加" />
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
	<script type="text/javascript" src="js/jquery.validate.js"></script>
	<script type="text/javascript" src="js/messages_zh.js"></script>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
	<script>
		
		$(function(){
			var name = false;
			var age = false;
			var gender = false;
			var id_card = false;
			var address = false;
			var position = false;
			var joinDate = false;
			var province = false;
			var city = false;

			$("#addbtn").click(function(){
				var $name = $.trim($("input[name='emp_name']").val());
				var $age =  $.trim($("input[name='emp_age']").val());
				var $gender =  $.trim($("input[name='emp_gender']").val());
				var $id_card =  $.trim($("input[name='emp_id_card']").val());
				var $address =  $.trim($("input[name='emp_address']").val());
				var $position =  $.trim($("select[name='emp_position_id'] option:selected").val());
				var $joinDate =  $.trim($("input[name='emp_hiredate']").val());
				var $province =  $.trim($("select[name='emp_province_id'] option:selected").val());
				var $city = $.trim($("select[name='emp_city_id'] option:selected").val());
				if($name == ""){
					name = false;
					$("#nameMess").text("请输入姓名");
				}else{
					$("#nameMess").text("");
					name = true;
				}
				if($age == ""){
					age = false;
					$("#ageMess").text("请输入年龄");
				}else{
					var n = /^([0-9]{0,2})|(1([0-1][0-9]|20))$/;
					if(!(n.test($("input[name='emp_age']").val())
								&& $("input[name='emp_age']").val() > 0
								&& $("input[name='emp_age']").val() < 130)){
						$("#ageMess").text("年龄范围1~130岁");
						age = false;
					}else{
						$("#ageMess").text("");
						age = true;
					}
				}
				if($gender == ""){
					gender = false;
					$("#genderMess").text("请选择性别");
				}else{
					$("#genderMess").text("");
					gender = true;
				}
				
				if($id_card == ""){
					id_card = false;
					$("#idCardMess").text("请输入身份证号");
				}else{
					var id = /^\w{15}|\w{18}$/;
					if(!id.test($("input[name='emp_id_card']").val())){
						$("#idCardMess").text("请输入有效身份证号");
						id_card = false;
					}else{
						$("#idCardMess").text("");
						id_card = true;
					}
				}
				if($address == ""){
					address = false;
					$("#addressMess").text("请输入户籍地");
				}else{
					$("#addressMess").text("");
					address = true;
				}
				if($position == 0){
					position = false;
					$("#posMess").text("请选择职位");
				}else{
					$("#posMess").text("");
					position = true;
				}
				if($joinDate == ""){
					joinDate = false;
					$("#joinMess").text("请输入入职日期");
				}else{
					$("#joinMess").text("");
					joinDate = true;
				}
				if($province == 0){
					province = false;
					$("#proMess").text("请选择省份");
				}else{
					$("#proMess").text("");
					province = true;
				}
				if($city == 0){
					city = false;
					$("#cityMess").text("请选择城市");
				}else{
					$("#cityMess").text("");
					city = true;
				}
				if(name && age && gender && id_card && address
							&& position && joinDate && province && city){
					$("#addForm").submit();
				}
			})
			
			$("select[name='emp_province_id']").change(function(){
				var $city = $("select[name='emp_city_id']");
				var $pcode = $("select[name='emp_province_id'] option:selected").val();
				$city.empty();
				if($pcode != 0){
					$.ajax({
						url: "emp/getCityByPriCode/" + $pcode,
						type: "post",
						dataType: "json",
						success: function(data){
							if(data != "" && data != null){
								var $op = "";
								$.each(data, function(i, n){
									$op += "<option value=" + n.city_code + ">" + n.city_name + "</option>";
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
				}else{
					$city.append("<option value='0'>-城市-</option>");
				}
			})
		})
	</script>
</html>
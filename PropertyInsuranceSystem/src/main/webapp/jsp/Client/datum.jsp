<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		
		<form action="<%=basePath%>/insure/addDatum">
			投保人姓名:     <input type="text" name="ins_name"><br><br>
			投保人联系方式:  <input type="text" name="ins_tel"><br><br>
			投保人身份证号码: <input type="text" name="ins_id_card"><br><br>
			投保人电子邮件:  <input type="text" name="ins_email"><br><br>
			投保人地址:     <input type="text" name="ins_city"><br><br>
			产品的购买价格: <input type="text" name="coverage"><br><br>
			产品的赔付价格: <input type="text" name="insured_amount"><br><br>
			
			产品的ID:<input type="text" name="id" value="${pro.id }"><br><br>
			
			
			受保人姓名:     <input type="text" name="ass_name"><br><br>
			受保人联系方式:  <input type="text" name="ass_tel"><br><br>
			受保人身份证号码: <input type="text" name="ass_id_card"><br><br>
			受保人电子邮件:  <input type="text" name="ass_email"><br><br>
			受保人地址:     <input type="text" name="ass_city"><br><br>
			<button type="submit">提交</button>
		</form>
	</div>
</body>
</html>
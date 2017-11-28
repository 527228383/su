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
<title>支付页面</title>
 <link rel="stylesheet" href="css/style.css">

    <style>
        .container-small{
            max-width: 900px;
        } 
        .abc{
            cursor:pointer;
           } 
    </style>
</head>
<body>
	<header class="top-bar">
	    <div class="container">
	        <div class="clearfix">
	            <ul class="top-bar-text float_left">
	                <li><i class="icon-technology-1"></i>Phone +123-456-7890</li>
	                <li><i class="icon-note"></i>Mail@Fortuneteam.com</li>
	                <li style="font-size:14px"><i class="icon-world"></i>广东省深圳市淘金地大厦</li>
	            </ul>
	            <ul class="social float_right">
	                <li><a href="<%=basePath%>insure/showfirst">个人中心</a></li>
	            </ul>
	        </div>
	    </div>
    </header>

    <br /><br /><br />
     <form action="<%=basePath%>insure/updatePayment" method="post">
        <div class="container container-small">
            <div>
	           
	                <table class="table" style="width: 80%;font-size: small;" align="center">
	                    <thead>
	                        <tr>
	                            <th>产品名称</th>
	                            <th>生效日期</th>
	                            <th>金额</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td>${pro.pro_name }</td>
	                            <td>${time }</td>
	                            <td>${coverage }</td>
	                        </tr>                       
	                    </tbody>
	                </table>
	                <input type="hidden" name="insured_amount" value="${insured_amount }">
	                <input type="hidden" name="coverage" value="${coverage }">
            </div>
            <br /><br />
            <div class="form-inline" style="font-weight: 800;margin-left: 150px;">
                <input class="btn btn-warning form-control" type="submit" value="立即支付" >
                &nbsp;&nbsp;&nbsp;
                 <a href="<%=basePath%>insure/selectQuote?id=${pro.id}">
                    <input class="btn btn-info form-control" type="button" value="返回" >
                 </a>
                <br /><br />
            </div>
        </div>
    </form>
        <br /><br /><br />	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品评价页面</title>
<link rel="stylesheet" href="css/style.css">
    <style>
        .container-small{
            max-width: 900px;
        } 
        #tab td{
            font-size: x-small;
            max-width: 300px;
            font-weight: 200;
        }
        #tab2 td{
            font-size: x-small;
            max-width: 300px;
        }
        #tab2 th{
            font-size: small;
        }   
    </style>
</head>
<body>
    <div class="boxed_wrapper">
            <div class="container container-small">
                <div>
                    <table id="tab2" class="table">
                        <thead>
                            <tr>
                                <th>评论者</th>
                                <th>心得</th>
                                <th>日期</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>黄*</td>
                                <td>我非常喜欢这款短期交通意外险，每次我和我的家人坐飞机都要买这款保险，它方便灵活，价格很优惠，下次我会再来的。</td>
                                <td>2017-09-20 15:24</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        <div style="height: 80px;"></div>
</div>
</body>
</html>
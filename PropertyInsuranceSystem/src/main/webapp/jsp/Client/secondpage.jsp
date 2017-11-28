<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
   			<table>
   				<tr align="center">
   					<td>产品名称</td>
   					
 					<c:if test="${ye==1}">
 						<td>添加时间</td>
 					</c:if>
 					
 					<c:if test="${ye==2}">
 						<td>失效时间</td>
 					</c:if>
 					<c:if test="${ye==3}">
 						<td>生效时间</td>
 					</c:if>
   					<!-- <td>日期</td> --><td>被保人</td>
   					<td>保单号</td>
   					<td>保险期限</td>
   				</tr>
   				<c:forEach items="${nopay}" var="n">
   					<tr align="center">
   					<td>
   					${n.productDto.pro_name} 
   					</td>
   					<c:if test="${ye==1}">
 						<td>
   						<fmt:formatDate value="${n.d_add_date}" pattern="yyyy-MM-dd"/>
   						</td>
 					</c:if>
 					<c:if test="${ye==2}">
 						<td>
 						<fmt:formatDate value="${n.b_lose_date}" pattern="yyyy-MM-dd"/>
 						</td>
 					</c:if>
   					<c:if test="${ye==3}">
 						<td>
   						<fmt:formatDate value="${n.b_effect_date}" pattern="yyyy-MM-dd"/>
   						</td>
 					</c:if>
   					<td>
   					${n.assurerDto.ass_name} 
   					</td>
   					<td>
   					${n.id} 
   					</td>
   					<td>
   					${n.productDto.pro_time} 
   					</td>
   					</tr>
   				</c:forEach>
   			</table>
   		
   			<c:if test="${ye==1}">
	   			<a href="javascript:test1()">上页</a>
	   			<a href="javascript:test2()">下页</a>
   			</c:if>
	   		<c:if test="${ye==2}">
	   			<a href="javascript:test3()">上页</a>
	   			<a href="javascript:test4()">下页</a>
	   		</c:if>
	   		<c:if test="${ye==3}">
	   			<a href="javascript:test5()">上页</a>
	   			<a href="javascript:test6()">下页</a>
	   		</c:if>
   			
   			<script type="text/javascript">
   				function test1(){
   					if(${page=='1'}){
   						alert('已经是第一页了')	
   					}else{
   						location.href="insure/firstpage/1?page=${page-1}"
   					}
   				}
   				function test2(){
   					if(${totalpage=='0'}){
   						alert('已经是最后一页了！')
   					}
   					if(${page}==${totalpage}){
   						alert('已经是最后一页了')	
   					}else{
   						location.href="insure/firstpage/1?page=${page+1}"
   					}
   				}
   				function test3(){
   					if(${totalpage=='0'}){
   						alert('已经是最后一页了！')
   					}else if(${page=='1'}){
   						alert('已经是第一页了')	
   					}
   					else{
   						location.href="insure/firstpage/2?page=${page-1}"
   					}
   				}
   				function test4(){
   					if(${totalpage=='0'}){
   						alert('已经是最后一页了！')
   					}
   					if(${page}==${totalpage}){
   						alert('已经是最后一页了')	
   					}else{
   						location.href="insure/firstpage/2?page=${page+1}"
   					}
   				}
   				function test5(){
   					if(${page=='1'}){
   						alert('已经是第一页了')	
   					}else{
   						location.href="insure/firstpage/3?page=${page-1}"
   					}
   				}
   				function test6(){
   					if(${page}==${totalpage}){
   						alert('已经是最后一页了')	
   					}else{
   						location.href="insure/firstpage/3?page=${page+1}"
   					}
   				}
   			</script>
  </body>
</html>
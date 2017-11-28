<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人资料</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css">
<style type="text/css">

.container-small{
	max-width: 500px;
}
</style>
<script type="text/javascript" src="js/Client/jquery-1.8.0.min.js"></script>
<br/><br/>
<div class="container container-small well" style="border-radius: 0px;">
<script type="text/javascript">

var a=false;
var b=false;
var c=false;
var d=false;
var e=false;
var f=false;
var g=false;
var h=false;
var i=false;
var url=document.referrer;
   $(function(){
      
       $("#back").click(function(){
    	   location.href=url;
       });
   });
   
   
   
   function CityTwo(){
       var pcode = $("#provinceTwo").val();
       $("#cityTwo option:not(:first)").remove();
       $.ajax({
           url:"<%=basePath%>insure/Province",
           type:"post",
           data:{"province_code":pcode},
           dataType:"json",
           success:function(data){
               $.each(data,function(i,n){
                       $("#cityTwo").append("<option value="+n.city_code+">"+n.city_name+"</option>");
               });
           },
           error:function(data){
               alert("请求失败");
           }
       });
   }
</script>
</head>
	<h1 align="center">个人资料</h1>
  <body>
  	<form action="/insuredata/updatePersonalInfo" >
  	<div class="form-group">
  		<label >电话号码：</label>
  		<input readonly="readonly" class="form-control" type="text" name="ins_tel" value="${insureDto.ins_tel }"> 
  	</div>
  	<div class="form-group">
  		<label>密码：</label>
  		<input class="form-control" type="text" name="ins_pwd" value="${insureDto.ins_pwd}" readonly="readonly"> 
  	</div>
  	
  	<div class="form-group">
  		<label>真实姓名:</label>
  		<input class="form-control" type="text"  name="ins_name" value="${insureDto.ins_name }">
  	</div>
  	<div class="form-group">
  		<label>证件类型:</label>
   			<select class="form-control">
   				<option selected>身份证</option>
   				<option>护照</option>
   				<option>外国人居留证</option>
   			</select>
  	</div >
  	<div class="form-group">
  		<label>证件号码：</label>
  		<input class="form-control" type="text" name="ins_id_card" value="${insureDto.ins_id_card }">
  	</div>
  	<div class="form-inline">
  		<label>性别:</label>
  
   		<input class="form-control" type="radio" name="ins_gender" checked value='1'/>男
   		<input class="form-control" type="radio" name="ins_gender" value='0' />女
   		
  	</div >
  	<div class="form-group">
  		<label>出生日期:</label>
  		<input class="form-control" type="text" value="${fn:substring(insureDto.ins_id_card,6,10)}-${fn:substring(insureDto.ins_id_card,10,12)}-${fn:substring(insureDto.ins_id_card,12,14)}">
  	</div>
  	
  	<div class="form-group">
  		<label>常住城市:</label>

  		<select style=" font-size: 14px" id="provinceTwo" onchange="CityTwo()">
	          <option>--请选择省份--</option>
               <c:forEach items="${province }" var="p">
               	  <option value="${p.pcode }">${p.pname}</option>
               </c:forEach>
	     </select>
          &nbsp;&nbsp;&nbsp;
          <select style=" font-size: 14px" id="cityTwo" name="ins_city">
               <option value="">--请选择城市--</option>
          </select>

  	</div>
  	<div class="container">
  	</div>
  	<div class="form-group" >
  		<input class="btn btn-info" type="submit" value="修改"/>
		<input class="btn btn-warning" type="button" value="返回" id="back"/>
  	</div>
	</form>		
  </body>

  
  </div>

  <script type="text/javascript">
  	function city(){
  		var pcode=$("#province").val();
  		 $("#city option:not(:first)").remove();
         $.ajax({
             url:"<%=basePath%>insure/Province",
             type:"post",
             data:{"province_code":pcode},
             dataType:"json",
             success:function(data){
                 $.each(data,function(i,n){
                         $("#city").append("<option value="+n.city_code+">"+n.city_name+"</option>");
                 });
             },
             error:function(data){
                 alert("请求失败");
             }
         });
     }
  	
  </script> 
  

</html>
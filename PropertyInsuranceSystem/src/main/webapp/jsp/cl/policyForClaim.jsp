<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.zl.util.PageUtil" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'MyJsp.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/service/cl/css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/service/sjh/H-ui.min.css" rel="stylesheet" />
	<style type="text/css">
		#searchDiv{
			float: right;
		}
		body{
			font-size: 18px;
		}
		.breadcrumb{
		margin-left: 5px;
		}
		input[type="text"]{
			background-color: rgb(199,237,204);
			box-sizing: border-box;
			border-radius:4px;
			border:1px solid #c8cccf;
			color:#6a6f77;
			-web-kit-appearance:none;
		    -moz-appearance: none;
			outline:0;
			height: 25px;
			text-decoration:none;
		}
	</style>
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#reset").click(function(){//重置搜索框
				$("[type='text']").val("");
				firstPage();
			});
			var currentPage=parseInt($("#currentPage").val());//当前页码
			var totalPage=parseInt($("#totalPage").val());//总页码数
			if(currentPage<=1){
				$("#firstPage").prop("disabled","disabled");
				$("#prevPage").prop("disabled","disabled");
			};
			if(currentPage>=totalPage){
				$("#nextPage").prop("disabled","disabled");
				$("#lastPage").prop("disabled","disabled");
			};
			$("#firstPage").click(function(){//首页
				$("#currentPage").val(1);
				$("#page").submit();
			});
			$("#prevPage").click(function(){//上一页
				$("#currentPage").val(currentPage-1);
				$("#page").submit();
			});
			$("#nextPage").click(function(){//下一页
				$("#currentPage").val(currentPage+1);
				$("#page").submit();
			});
			$("#lastPage").click(function(){//尾页
				$("#currentPage").val(totalPage);
				$("#page").submit();
			});
			$("#goto").click(function(){//跳转页码
				var gotoPage=parseInt($("#gotoPage").val());
				if(gotoPage>totalPage || gotoPage<=0){
					alert("请输入正确的页码!");
					return;
				}
				$("#currentPage").val($("#gotoPage").val());
				$("#page").submit();
			});
		});
		function firstPage(){//首页
			$("#currentPage").val(1);
			$("#page").submit();
		}
	</script>
  </head>
  <body>
	<div class="Hui-article-box">
		<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span> 待处理订单 <span class="c-gray en">&gt;</span> <span id="cdType">待审核</span> </div>
		<div class="Hui-article">
			<div class="cl pd-20">
			<div id="searchDiv" style="border: 1px soild red">
		<p>
		<form action="act/getNoDealWithClaimDetails" method="post" id="page">
			<input type="hidden" name="currentPage" id="currentPage" value="${pageUtil.currentPage}"/>
			<input type="hidden" name="totalPage" id="totalPage" value="${pageUtil.totalPage}"/>
			<table class="table no-border">
		        <tr class="text-c">
		        	<td width="10%" align="right" nowrap="nowrap">保单号：</td><td><input type="text" name="pol_id" class="span3" value="${query.pol_id}"/></td>
		        	<td width="10%" align="right" nowrap="nowrap">保险名称：</td><td><input type="text" name="pro_name" class="span3" value="${query.pro_name}"/></td>
				    <td width="10%" align="right" nowrap="nowrap">保险截止日期：</td>
				    <td width="10%" align="right" nowrap="nowrap"><input type="text" name="startDate" onclick="WdatePicker({readOnly:true,maxDate:'%y-%M-%d'})" readonly="readonly" class="Wdate" size="12" value="<fmt:formatDate value="${query.startDate}" pattern="yyyy-MM-dd"/>"/> - <input type="text" name="endDate" onclick="WdatePicker({readOnly:true,maxDate:'%y-%M-%d'})" readonly="readonly" class="Wdate" size="12" value="<fmt:formatDate value="${query.endDate}" pattern="yyyy-MM-dd"/>"/></td>
			    	<td width="20%" class="text-center"><input type="button" class="btn" value="搜索" onclick="firstPage()"/></td>
			    	<td width="20%" class="text-left"><input type="button"  class="btn"value="清空" id="reset"/></td>
		        </tr>
	        </table>
		</form>
		<p>
		<div class="mt-10">
   			<table class="table table-border table-bordered table-hover table-bg">
   			<thead>
				<tr class="text-c">
					<th width="250">保单号</th>
					<th width="50">受保人</th>
					<th width="140">受保人身份证号</th>
					<th width="100">电话号码</th>
					<th width="100">保险名称</th>
					<th width="100">保险截止日期</th>
					<th width="100">保险费(元)</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="policyDto" varStatus="i">
				<tr align="center">
					<td>${policyDto.pol_id}</td>
					<td>${policyDto.assurerDto.ass_name}</td>
					<td>${policyDto.assurerDto.ass_id_card}</td>
					<td>${policyDto.assurerDto.ass_tel}</td>
					<td>${policyDto.pro_name}</td>
					<td><fmt:formatDate value="${policyDto.expirationDate}" pattern="yyyy-MM-dd"/></td>
					<td>${policyDto.b_coverage}</td>
					<td>
						<a href="sales/getPolicy/view/${policyDto.pol_id}">查看保单</a>
						<a href="emp/getClaimDetailsDto/${policyDto.id}">理赔审核</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<p>
		</div>
		</div>
	</div>
</div>
</div>
		<center>
		<div>
			<input type="button"  class="btn"id="firstPage" value="首页"/>&nbsp;&nbsp;
			<input type="button"  class="btn"id="prevPage" value="上一页"/>&nbsp;&nbsp;
			<input type="button"  class="btn"id="nextPage" value="下一页"/>&nbsp;&nbsp;
			<input type="button" class="btn" id="lastPage" value="尾页"/>&nbsp;&nbsp;
			当前<font color="blue">${pageUtil.currentPage}</font>/<font color="blue">${pageUtil.totalPage}</font>页&nbsp;&nbsp;
			共<font color="blue">${pageUtil.rowSize}</font>条数据
			<input type="text" id="gotoPage" size="3">
			<input type="button" class="btn" id="goto" value="Go"><p>
		</div>
		</center>
  </body>
</html>
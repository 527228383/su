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
	<link href="css/service/sjh/H-ui.min.css" rel="stylesheet" type="text/css" />
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
		<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span>
		<c:if test="${listOrders[0].d_state_id!=10}">
			待处理订单
		</c:if>
		<c:if test="${listOrders[0].d_state_id==10}">
			已处理
		</c:if>
		<span class="c-gray en">&gt;</span> <span id="cdType">
		<c:if test="${listOrders[0].d_state_id==1}">
			待支付
		</c:if><c:if test="${listOrders[0].d_state_id==2}">
			待核实
		</c:if>
		<c:if test="${listOrders[0].d_state_id==10}">
			核保未通过
		</c:if>
</span> </div>
		<div class="Hui-article">
			<div class="cl pd-20">
			<div id="searchDiv" style="border: 1px soild red">
			<p>
  				<form action="sales/listOrders/${operate}" method="post" id="page">
  					<input type="hidden" name="currentPage" id="currentPage" value="${pageUtil.currentPage}"/>
					<input type="hidden" name="totalPage" id="totalPage" value="${pageUtil.totalPage}"/>
	    			<table class="table no-border">
				        <tr class="text-c">
				        	<td width="10%" align="right" nowrap="nowrap">订单号：</td><td><input type="text" name="order_id" class="span3" value="${query.order_id}"/></td>
				        	<td width="10%" align="right" nowrap="nowrap">保险名称：</td><td><input type="text" name="pro_name" class="span3" value="${query.pro_name}"/></td>
						    <td width="10%" align="right" nowrap="nowrap">订单提交日期：</td>
						    <td width="10%" align="right" nowrap="nowrap"><input type="text" name="startDate" onclick="WdatePicker({readOnly:true,maxDate:'%y-%M-%d'})" readonly="readonly" class="Wdate" size="12" value="<fmt:formatDate value="${query.startDate}" pattern="yyyy-MM-dd"/>"/> - <input type="text" name="endDate" onclick="WdatePicker({readOnly:true,maxDate:'%y-%M-%d'})" readonly="readonly" class="Wdate" size="12" value="<fmt:formatDate value="${query.endDate}" pattern="yyyy-MM-dd"/>"/></td>
					    	<td width="20%" class="text-center"><input type="button" class="btn" value="搜索" onclick="firstPage()"/></td>
					    	<td width="20%" class="text-left"><input type="button" class="btn" value="清空" id="reset"/></td>
				        </tr>
			        </table>
	    		</form>
	    		<p>
	    		<div class="mt-10">
    			<table class="table table-border table-bordered table-hover table-bg">
			    	<thead>
				    	<tr class="text-c">
					        <th width="190">订单号</th>
					        <th width="50">投保人</th>
					        <th width="140">投保人身份证号</th>
					        <th width="90">电话号码</th>
					        <th width="90">保险名称</th>
					        <th width="100">订单提交日期</th>
					        <th width="80">保险费(元)</th>
					        <th width="80">订单状态</th>
					        <th width="60">操作</th>
				        </tr>
			        </thead>
			        <tbody>
				    <c:forEach items="${listOrders}" var="orderDto" varStatus="i">
						<tr align="center">
							<td>${orderDto.id}</td>
							<td>${orderDto.insureDto.ins_name}</td>
							<td>${orderDto.insureDto.ins_id_card}</td>
							<td>${orderDto.insureDto.ins_tel}</td>
							<td>${orderDto.productDto.pro_name}</td>
							<td><fmt:formatDate value="${orderDto.d_add_date}" pattern="yyyy-MM-dd"/></td>
							<td>${orderDto.d_coverage}</td>
							<td>
								<c:if test="${orderDto.d_state_id==1}">
									待支付
								</c:if>
								<c:if test="${orderDto.d_state_id==2}">
									待核实
								</c:if>
								<c:if test="${orderDto.d_state_id==10}">
									核保未通过
								</c:if>
							</td>
							<td>
								<a href="sales/getOrder/view/${orderDto.id}">查看订单</a>
								<c:choose>
									<c:when test="${orderDto.d_state_id==1}">
										<a href="#">提醒客户</a>
									</c:when>
									<c:when test="${orderDto.d_state_id==2}">
										<a href="sales/getOrder/check/${orderDto.id}">订单核实</a>
									</c:when>
									<c:when test="${orderDto.d_state_id==10}">
										<a href="sales/getCheckDetail/${orderDto.id}">核实详情</a>
									</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
			        </tbody>
			    </table>
			    </div>
    		</div>  
		</div> 
	</div> 
</div> 
		<center>
			<div>
				<input type="button" id="firstPage" class="btn" value="首页"/>&nbsp;&nbsp;
				<input type="button" id="prevPage" class="btn" value="上一页"/>&nbsp;&nbsp;
				<input type="button" id="nextPage"  class="btn"value="下一页"/>&nbsp;&nbsp;
				<input type="button" id="lastPage" class="btn" value="尾页"/>&nbsp;&nbsp;
				当前<font color="blue">${pageUtil.currentPage}</font>/<font color="blue">${pageUtil.totalPage}</font>页&nbsp;&nbsp;
				共<font color="blue">${pageUtil.rowSize}</font>条记录
				<input type="text" id="gotoPage" size="3">
				<input type="button" class="btn" id="goto" value="Go"><p>
			</div>
		</center>
</body>
</html>
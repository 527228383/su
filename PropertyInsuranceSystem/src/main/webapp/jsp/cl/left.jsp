<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<link href="css/service/main/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			//导航切换
			$(".menuson li").click(function(){
				$(".menuson li.active").removeClass("active");
				$(this).addClass("active");
			});
			
			$('.title').click(function(){
				var $ul = $(this).next('ul');
				$('dd').find('ul').slideUp();
				if($ul.is(':visible')){
					$(this).next('ul').slideUp();
				}else{
					$(this).next('ul').slideDown();
				}
			});
		});	
	</script>
</head>
<body style="background:#f0f9fd;">
    <dl class="leftmenu">
	    <dd>
		    <div class="title">
		    	<span><img src="images/leftico02.png" /></span>待处理订单
		    </div>
	    	<ul class="menuson">
		        <li><cite></cite><a href="sales/listOrders/1" target="rightFrame">待支付</a><i></i></li>
		        <li><cite></cite><a href="sales/listOrders/2" target="rightFrame">待核实</a><i></i></li>
	        </ul>    
	    </dd>
	    <dd>
	    	<div class="title">
	    		<span><img src="images/leftico03.png" /></span>已处理
	   		</div>
		    <ul class="menuson">
		        <li><cite></cite><a href="sales/listOrders/10" target="rightFrame">核保未通过</a><i></i></li>
		        <li><cite></cite><a href="sales/listPolicys/3" target="rightFrame">生效中</a><i></i></li>
	        </ul>     
	    </dd> 
	    <dd>
	    	<div class="title">
	    		<span><img src="images/leftico02.png" /></span>待处理保单
	    	</div>
		    <ul class="menuson">
		        <li><cite></cite><a href="sales/listPolicys/4" target="rightFrame">待续保</a><i></i></li>
		        <li><cite></cite><a href="act/getNoDealWithClaimDetails" target="rightFrame">待审核</a><i></i></li>
		    </ul>    
	    </dd>
	    <dd>
	    	<div class="title">
	    		<span><img src="images/leftico03.png" /></span>已处理
	    	</div>
		    <ul class="menuson">
		        <li><cite></cite><a href="act/getHaveDealWithClaimDetails" target="rightFrame">审核中</a><i></i></li>
<!-- 		        <li><cite></cite><a href="sales/listPolicys/8" target="rightFrame">已赔付</a><i></i></li> -->
<!-- 		        <li><cite></cite><a href="sales/listPolicys/9" target="rightFrame">已驳回</a><i></i></li> -->
		    </ul>    
	    </dd>   
    </dl>
</body>
</html>
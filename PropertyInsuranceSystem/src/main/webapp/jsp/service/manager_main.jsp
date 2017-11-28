<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<style type="text/css">
		.top{
			position:absolute;
			top:0px;
			left:0px;
			width:100%;
			height:15%;
			border:1px solid;
			}
		.left{
			position:absolute;
			top:15%;
			left:0px;
			width:15%;
			height:85%;
			border:1px solid;
			}
		.right{
			position:absolute;
			top:15%;
			left:15%;
			width:85%;
			height:85%;
			border:1px solid;
		}
	</style>
  </head>
  <body>
	<div class="par">
		<div class="top">
			<div align="left" style="width:200px;height:50px">知领财险后台管理系统</div><div style="float:right"><a href="#" target="_top">账户设置</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="user/exit" target="_top">退出登录</a><br></div>
		</div>
		<div class="left" align="center">
<!-- 			<ul> -->
<%-- 				<c:forEach items="${loginUser.role.powers}" var="power"> --%>
<%-- 					<li style="line-height: 40px"><a href="${power.url}" target="right">${power.pname}</a></li> --%>
<%-- 				</c:forEach> --%>
<!-- 			</ul> -->
            <p><a href="sales/listOrders/all" target="right"><span id="allOrder">客户保单信息</span></a></p>
            <p><a href="sales/listOrders/1" target="right" style="color:#666666;">待处理(<span style="color:#FF0000;">${countMap.order1}</span><span style="color:#666666;">)</span></a></p>
            <p><a href="sales/listOrders/2" target="right" style="color:#666666;">已处理(<span style="color:#FF0000;">${countMap.order2}</span><span style="color:#666666;">)</span></a></p>
			<p><a href="sales/listPolicys/3" target="right" style="color:#666666;">保单详情(<span style="color:#FF0000;">${countMap.policy6}</span><span style="color:#000666;">)</span></a></p>
            <p><a href="sales/listPolicys/4" target="right" style="color:#666666;">理赔详情(<span style="color:#FF0000;">${countMap.policy8}</span><span style="color:#000666;">)</span></a></p>

<!--             <p><a href="sales/policys/10" target="right" style="color:#666666;">核保未通过</a></p> -->
            <p><a href="sales/listPolicys/all" target="right">产品信息</a></p> 
<!--             <p><a href="sales/policys/3" target="right" style="color:#666666;">生效中</a></p> -->
            <p><a href="sales/listPolicys/5" target="right" style="color:#666666;">添加(<span style="color:#FF0000;">${countMap.policy4}</span><span style="color:#666666;">)</span></a></p>
            <p><a href="sales/listPolicys/6" target="right" style="color:#666666;">修改(<span style="color:#FF0000;">${countMap.policy5}</span><span style="color:#666666;">)</span></a></p>
		</div>
		<div class="right">
			<!--定义一个iframe框架,点击超链接在该框架下显示-->
			<iframe name="right"frameborder="0"height="100%"width="100%">
			</iframe>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#allOrder").click();
		})
	</script>
  </body>
</html>
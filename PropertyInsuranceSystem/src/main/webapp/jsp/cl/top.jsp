<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>知领财险后台管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="js/service/cl/css/style.css" rel="stylesheet" type="text/css" />
	<link href="js/service/cl/css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="js/service/cl/css/css.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/service/cl/js/jquery1.9.0.min.js"></script>
	<script type="text/javascript" src="js/service/cl/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function(){	
		//顶部导航切换
		$(".nav li a").click(function(){
			$(".nav li a.selected").removeClass("selected");
			$(this).addClass("selected");
		});
	});
</script>
  </head>
  <body style="background:url(images/topbg.gif) repeat-x;">

    <div class="topleft">
    	<a href="main.jsp" target="_parent"><img src="images/logo.png" title="系统首页" /></a>
    </div>
    <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=2&color=%23FFFFFF&num=5" width="650" height="70" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
  <div class="topright">    
    <ul>
	    <li><i class="icon-question-sign icon-white"></i> <a href="#">帮助</a></li>
	    <li><a href="#">关于</a></li>
	    <li><i class="icon-off icon-white"></i> <a id="modal-973558" href="#modal-container-973558" role="button" data-toggle="modal">退出</a></li>
    </ul>
     
    <div class="user">
	    <span>${sessionScope.employee.emp_name}</span>
<!-- 	    <i>待处理</i> -->
<!-- 	    <b>5</b> -->
    </div>    
    <!-- 退出 -->
      <div id="modal-container-973558" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:300px; margin-left:-150px; top:30%">
		<div class="modal-header">
		 	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">注销系统</h3>
		</div>
	  <div class="modal-body">
		<p>
			您确定要注销退出系统吗？
		</p>
	  </div>
	  <div class="modal-footer">
		 <button class="btn btn-xs" data-dismiss="modal" aria-hidden="true">关闭</button> <a class="btn btn-xs" style="line-height:20px;" href="user/exit" >确定退出</a>
	  </div>
    <!--  -->
    </div>
  </div>
</body>
</html>
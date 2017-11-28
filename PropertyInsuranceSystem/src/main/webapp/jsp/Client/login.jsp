<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">

 	<style>
		.container-small{
			max-width: 400px;
		} 	
		.abc{
			cursor:pointer;
		}	
 	</style>
 	<script type="text/javascript" src="js/Client/jquery.js"></script>
 	<script type="text/javascript" src="js/Client/login.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#yanzheng").click(function(){
				$("#div0").hide();
				$("#div1").css('display','block');
			})
			$("#a").click(function(){
				$("#div0").show();
				$("#div1").css('display','none');
			})
		})
		
	</script>
</head>
<body>
<%  String cookieTel="";
		String cookiePwd="";
  			Cookie [] coos=request.getCookies();
  			if(coos!=null){
  				for(Cookie coo:coos){
  					if("cookieTel".equals(coo.getName())){
  						cookieTel=coo.getValue() ;
  					}
  					if("cookiePwd".equals(coo.getName())){
  						cookiePwd=coo.getValue();
  					}
  				}
  			} 
  	%>
<div class="boxed_wrapper">

<header class="top-bar">
    <div class="container">
        <div class="clearfix">
            <ul class="top-bar-text float_left">
                <li><i class="icon-technology-1"></i>Phone +123-456-7890</li>
                <li><i class="icon-note"></i>Mail@Fortuneteam.com</li>
                <li><i class="icon-world"></i>广东省深圳市淘金地大厦</li>
            </ul>
        </div>
    </div>
</header>

<section class="theme_menu stricky">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="main-logo">
                    <a href="index.html"><img src="images/logo/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-md-9 menu-column">
                <nav class="menuzord" id="main_menu">
                   <ul class="menuzord-menu">
                        <li><a href="<%=basePath%>jsp/Client/index.jsp" style="font-size:16px;">首页</a></li>
                        <li><a href="<%=basePath%>product/listpro?type=2" style="font-size:16px;">购买保险</a></li>
                        <li><a href="<%=basePath%>insure/showfirst" style="font-size:16px;">个人中心</a></li>
                        <li><a href="<%=basePath%>jsp/Client/contact.jsp"" style="font-size:16px;">服务大厅</a></li>
                    </ul><!-- End of .menuzord-menu -->
                </nav> <!-- End of #main_menu -->
            </div>
            <div class="right-column">
            	<div style="margin-top: 20px;">
					<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=9" width="800" height="60" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
				</div>
            </div>
        </div>
                

   </div> <!-- End of .conatiner -->
</section>
	<br /><br /><abbr />

	<div class="container container-small" id="div0">
		<h2>登录&nbsp;
			<small style="font-size:medium;">没有账号?<a href="insure/regindex">注册</a></small>
		</h2>	
		<br /><br />
		<form >
			<div class="form-group">
				<label>手机号</label>
				<!--
                	作者：offline
                	时间：2017-11-15
                	描述：手机号验证
                -->
				<input type="text" class="form-control" id="tel" value="<%= cookieTel%>" onblur="test1()"/><font id="f1"></font>
			</div>
			
			<div class="form-group">
				<label>密码</label>
				<!--
                	作者：offline
                	时间：2017-11-15
                	描述：密码验证
                -->
				<input type="password" class="form-control" id="pwd" value="<%= cookiePwd %>" onblur="test2()"/><font id="f3"></font>
				<!--
                	作者：offline
                	时间：2017-11-15
                	描述：提示登录失败信息
                -->
				<font id="loginFont"></font>
				
			</div>
			<form class="form-group">
				<a style="font-size: small;color: lightseagreen;" id="yanzheng" class="abc">手机验证码登录</a>
			</form>
			
			<div class="form-group">
				<label class="checkbox" style="margin: 15px;">
			<input type="checkbox" id="isno"/>记住密码？
			</label>
			</div>
			<div class="form-group" style="padding-top: 15px;">
				<!--
                	作者：offline
                	时间：2017-11-15
                	描述：ajax登录
                -->
				<input type="button" class="btn btn-warning btn-block" value="登录" id="login"/>
			</div>
			
		</form>
		
	</div>	



	<div class="container container-small" id="div1" style="display: none;">
		<h2>登录&nbsp;
			<small style="font-size:medium;">没有账号?<a href="insure/regindex">注册</a></small>
		</h2>	
		<br /><br />
		<form>
			<div class="form-group">
				<label>手机号</label>
				<!--
                	作者：offline
                	时间：2017-11-15
                	描述：手机号验证
                -->
				<input type="text" class="form-control" id="tela" onblur="test3()"/><font id="f1a"></font>
			</div>
			
			<div class="form-group row col-xs-7" >
				<label>动态验证码</label> 
				<input type="password" class="form-control" style="width: 200px;" id="pwda"/>
			</div>
			
			<div class="form-group col-xs-5">
				<label></label> 
				<label></label> 
				<input type="button" value="发送短信动态登录码" class="btn btn-warning btn-block" style="width: 150px;" id="message">
				<!--
                	作者：offline
                	时间：2017-11-15
                	描述：登录错误提示
                -->
                <br/>
				<font id="loginFonta" style="float: left;"></font>
			</div>
		
			<a style="margin-right: 200px;color:lightseagreen;font-size: small;" class="abc" id="a">已有账号登录</a>

			<div class="form-group" style="padding-top: 15px;">
				<label></label> 
				<!--
                	作者：offline
                	时间：2017-11-15
                	描述：登录
                -->
				<input type="button" class="btn btn-warning btn-block" value="登录" id="login1"/>
			</div>
			
		</form>
		
		
	</div>	
		
		
		
		
		
		
		
		
		
<!-- Scroll Top Button -->
	<button class="scroll-top tran3s color2_bg">
		<span class="fa fa-angle-up"></span>
	</button>
	<!-- pre loader  -->
	<div class="preloader"></div>


	<!-- jQuery js -->
	<script src="js/Client/jquery.js"></script>
	<!-- bootstrap js -->
	<script src="js/Client/bootstrap.min.js"></script>
	<!-- jQuery ui js -->
	<script src="js/Client/jquery-ui.js"></script>
	<!-- owl carousel js -->
	<script src="js/Client/owl.carousel.min.js"></script>
	<!-- jQuery validation -->
	<script src="js/Client/jquery.validate.min.js"></script>
	<!-- google map -->
	<script src="http://ditu.google.cn/maps/api/js?key=AIzaSyCRvBPo3-t31YFk588DpMYS6EqKf-oGBSI"></script> 
	<script src="js/Client/gmap.js"></script>
	<!-- mixit up -->
	<script src="js/Client/wow.js"></script>
	<script src="js/Client/jquery.mixitup.min.js"></script>
	<script src="js/Client/jquery.fitvids.js"></script>
    <script src="js/Client/bootstrap-select.min.js"></script>
	<script src="js/Client/menuzord.js"></script>

	<!-- revolution slider js -->
	<script src="assets/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script src="assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.video.min.js"></script>

	<!-- fancy box -->
	<script src="js/Client/jquery.fancybox.pack.js"></script>
	<script src="js/Client/jquery.polyglot.language.switcher.js"></script>
	<script src="js/Client/nouislider.js"></script>
	<script src="js/Client/jquery.bootstrap-touchspin.js"></script>
	<script src="js/Client/SmoothScroll.js"></script>
	<script src="js/Client/jquery.appear.js"></script>
	<script src="js/Client/jquery.countTo.js"></script>
	<script src="js/Client/jquery.flexslider.js"></script>
	<script src="js/Client/imagezoom.js"></script>	
	<script id="map-script" src="js/Client/default-map.js"></script>
	<script src="js/Client/custom.js"></script>

</div>
	</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
<style>
		.container-small{
			max-width: 560px;
			font-size: smaller;
		} 		
 </style>
</head>
<body>
	<body>
		<div class="boxed_wrapper">



<header class="top-bar">
    <div class="container">
        <div class="clearfix">
            <ul class="top-bar-text float_left">
                <li><i class="icon-technology-1"></i>Phone +123-456-7890</li>
                <li><i class="icon-note"></i>Mail@Fortuneteam.com</li>
                <li style="font-size:14px"><i class="icon-world"></i>广东省深圳市淘金地大厦</li>
            </ul>
            <ul class="social float_right">
               <c:choose>
                    <c:when test="${insure.ins_name!=null && insure.ins_name!='' }">
                        <li style="color:white;">欢迎&nbsp;&nbsp;<a href="">${insure.ins_name }&nbsp;&nbsp;</a>登录</li>
                        <li><a href="<%=basePath%>insure/logout">注销登录</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<%=basePath%>jsp/Client/login.jsp">登录</a></li>
                        <li><a href="<%=basePath%>jsp/Client/register.jsp">注册</a></li>
                    </c:otherwise>
                </c:choose>
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
	                    <c:choose>
		                    <c:when test="${insure.ins_name!=null && insure.ins_name!='' }">
		                          <li><a href="<%=basePath%>insure/showfirst" style="font-size:16px;">个人中心</a></li>
		                    </c:when>
		                    <c:otherwise>
		                        <li><a href="<%=basePath%>jsp/Client/login.jsp">个人中心</a></li>
		                    </c:otherwise>
               			 </c:choose>
                        <li><a href="<%=basePath%>jsp/Client/contact.jsp"" style="font-size:16px;">服务大厅</a></li>
                    </ul><!-- End of .menuzord-menu -->
                </nav> <!-- End of #main_menu -->
            </div>
            <div class="right-column">
            	<div style="margin-top: 20px; ">
                    <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=9" width="800" height="60" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
                </div>
            </div>
        </div>
                
   </div> <!-- End of .conatiner -->
</section>
	

		 <br />
		 <div class="container container-small well" style="border-radius: 0px;">
			<br />
			<h4 align="center">保单评价</h4>
			<br /><br />
		<div class="form-group">
			<table class="table table-bordered" style="width: 90%;background-color: white;" align="center">
				<thead>
					<tr>
						<th>险种名称</th>
						<th>单号</th>
						<th>成交日期</th>
						<th>金额(元)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span>${policyDto.productDto.pro_name }</span></td>
						<td><span>${policyDto.id }</span></td>
						<td><span><fmt:formatDate value="${policyDto.b_effect_date }" pattern="yyyy-MM-dd"/></span></td>
						<td><span>${policyDto.b_coverage }</span></td>
					</tr>
				</tbody>
			</table>	
		</div>
		<br /><br />
		

		<form action="<%=basePath%>insure/addComment" method="post" >
			<input type="hidden" name="policy_id" value="${policyDto.id}">
			<input type="hidden" name="product_id" value="${policyDto.productDto.id}">
			<input type="hidden" name="ins_id" value="${policyDto.insureDto.id }">
		<div class="form-group" style="width: 90%;" align="center">
			<span >请对以上保单满意度进行评价</span><br /><br />
			
			<span style="color: orange;">评分:</span>&nbsp;&nbsp;
				<label class="radio-inline">
					<input type="radio" name="grade" value='1'/>1星
				</label>
				<label class="radio-inline">
					<input type="radio" name="grade"  value='2'/>2星
				</label>
				<label class="radio-inline">
					<input type="radio" name="grade"  value='3'/>3星
				</label>
				<label class="radio-inline">
					<input type="radio" name="grade"  value='4'/>4星
				</label>
				<label class="radio-inline">
					<input type="radio" name="grade" checked  value='5'/>5星
		</div>
		<br />
		<div class="form-group" style="width: 90%;" align="center">
			<span>感受</span><br />
			<textarea rows="5" cols="55" name="content"></textarea>
		</div>
		<br /><br />
		<div class="form-group" style="width: 90%;" align="center">
			<input class="btn btn-warning btn-block" value="提交评价"  type="submit" style="width: 200px;height: 30px;margin-bottom: 30px ;"/>
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
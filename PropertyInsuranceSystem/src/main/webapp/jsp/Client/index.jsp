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
	<title>首页</title> 
	<!-- mobile responsive meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/responsive.css">
</head>

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
                    <c:when test="${sessionScope.insure.ins_name!=null && sessionScope.insure.ins_name!='' }">
                        <li style="color:white;">欢迎&nbsp;&nbsp;<a href="<%=basePath%>insure/showfirst">${sessionScope.insure.ins_name }</a>&nbsp;&nbsp;登录</li>
                        <li><a href="<%=basePath%>insure/logout">注销登录</a></li>
                    </c:when>
                    <c:when test="${sessionScope.insure.ins_tel!=null && sessionScope.insure.ins_tel!='' }">
                        <li style="color:white;">欢迎&nbsp;&nbsp;<a href="<%=basePath%>insure/showfirst">${sessionScope.insure.ins_tel }</a>&nbsp;&nbsp;登录</li>
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
		                    <c:when test="${insure.ins_tel!=null && insure.ins_tel!='' }">
		                          <li><a href="<%=basePath%>insure/showfirst" style="font-size:16px;">个人中心</a></li>
		                    </c:when>
		                    <c:otherwise>  
		                        <li><a href="<%=basePath%>jsp/Client/login.jsp" style="font-size:16px;">个人中心</a></li>
		                    </c:otherwise>
               			 </c:choose>
                        <li><a href="<%=basePath%>jsp/Client/contact.jsp" style="font-size:16px;">服务大厅</a></li>
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

<!--Start rev slider wrapper-->     
<section class="rev_slider_wrapper">
    <div id="slider1" class="rev_slider"  data-version="5.0">
        <ul>
            
            <li data-transition="fade">
                <img src="images/slider/1.jpg"  alt="" width="1920" height="550" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >
                
                <div class="tp-caption  tp-resizeme" 
                    data-x="left" data-hoffset="15" 
                    data-y="top" data-voffset="125" 
                    data-transform_idle="o:1;"         
                    data-transform_in="x:[-175%];y:0px;z:0;rX:0;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0.01;s:3000;e:Power3.easeOut;" 
                    data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;" 
                    data-mask_in="x:[100%];y:0;s:inherit;e:inherit;" 
                    data-splitin="none" 
                    data-splitout="none"
                    data-responsive_offset="on"
                    data-start="700">
                    <div class="slide-content-box">
                        <h1>我们为您的家庭财产保驾护航</h1>
                        <p>With over 10 years of experience helping businesses to find <br> comprehensive solutions. </p>
                    </div>
                </div>
            </li>
            <li data-transition="fade">
                <img src="images/slider/2.jpg"  alt="" width="1920" height="580" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >
                
                <div class="tp-caption tp-resizeme"
                    data-x="right" data-hoffset="15" 
                    data-y="center" data-voffset="-4" 
                    data-transform_idle="o:1;"         
                    data-transform_in="x:[-175%];y:0px;z:0;rX:0;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0.01;s:3000;e:Power3.easeOut;" 
                    data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;" 
                    data-mask_in="x:[100%];y:0;s:inherit;e:inherit;" 
                    data-splitin="none" 
                    data-splitout="none"  
                    data-responsive_offset="on"
                    data-start="500">
                    <div class="slide-content-box">
                        <h1>我们为您提供最优质的服务</h1>
                        <p>With over 10 years of experience helping businesses to find <br>comprehensive solutions. </p>
                    </div>
                </div>
            </li>
            <li data-transition="fade">
                <img src="images/slider/3.jpg"  alt="" width="1920" height="580" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1">
                
                <div class="tp-caption  tp-resizeme" 
                    data-x="left" data-hoffset="15" 
                    data-y="top" data-voffset="125" 
                    data-transform_idle="o:1;"         
                    data-transform_in="x:[-175%];y:0px;z:0;rX:0;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0.01;s:3000;e:Power3.easeOut;" 
                    data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;" 
                    data-mask_in="x:[100%];y:0;s:inherit;e:inherit;" 
                    data-splitin="none" 
                    data-splitout="none"
                    data-responsive_offset="on"
                    data-start="700">
                    <div class="slide-content-box">
                        <h1>连续多年被客户评为<br />最满意的保险公司</h1>
                        <p>With over 10 years of experience helping businesses to find <br>comprehensive solutions. </p>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</section>
<!--End rev slider wrapper--> 



<section class="why-choose sec-padd">
    <div class="container">
        <div class="section-title center">
            <h2>为什么选择知领</h2>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="item">
                    <figure class="img-box">
                        <a href="#"><img src="images/resource/1.jpg" alt=""></a>
                        <div class="overlay-box">
                            <div class="inner-box">
                                <div class="icon_box">
                                    <span class="icon-graphic"></span>
                                </div>
                                <h4>全面覆盖</h4>
                                <div class="text">
                                    <p>在中国大陆任何地区出险，您都可在全国任何一家知领财产保险公司网点进行索赔，您将得到标准一致的理赔服务。</p>
                                </div>
                            </div>
                        </div>
                    </figure>  
                </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="item">
                    <figure class="img-box">
                        <a href="#"><img src="images/resource/2.jpg" alt=""></a>
                        <div class="overlay-box">
                            <div class="inner-box">
                                <div class="icon_box">
                                    <span class="icon-layers"></span>
                                </div>
                                <h4>口袋理赔</h4>
                                <div class="text">
                                    <p>简易事故自助理赔,15分钟定损,一个工作日实时到账</p>
                                </div>
                            </div>
                        </div>
                    </figure>  
                </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="item">
                    <figure class="img-box">
                        <a href="#"><img src="images/resource/3.jpg" alt=""></a>
                        <div class="overlay-box">
                            <div class="inner-box">
                                <div class="icon_box">
                                    <span class="icon-computer"></span>
                                </div>
                                <h4>优质服务</h4>
                                <div class="text">
                                    <p>免费提供快递功能的资料袋，只需要一个电话，快递人员免费上门收取材料（邮寄费平安承担）。</p>
                                </div>
                            </div>
                        </div>
                    </figure>  
                </div>
            </div>

        </div>
    </div>
</section>


<section class="service">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="about-info sec-padd">
                    <div class="section-title">
                        <h2>特色服务</h2>
                    </div>
                    <div class="text">
                        <p>知领家财险闪电快赔服务</p>
                    </div>
              
                </div>
            </div>
            <div class="no-padd item col-md-3 col-sm-6 col-xs-12">
                <div class="center">
                    <div class="icon_box">
                        <span class="icon-people"></span>
                        <h4>一证快赔(1万元及以下)</h4>
                    </div>
                </div>
                <div class="overlay-box center">
                    <div class="icon_box">
                        <span class="icon-people"></span>
                        <h4>一证快赔(1万元及以下)</h4>
                    </div>
                    <div class="text">
                        <p>赔款万元以下（含），索赔资料齐全，只需填写一张单证，次日通知银行付款。 </p>
                    </div>
                </div>
            </div>
            <div class="no-padd item col-md-3 col-sm-6 col-xs-12">
                <div class="center">
                    <div class="icon_box">
                        <span class="icon-arrows-2"></span>
                        <h4>足不出户,赔款到"户"</h4>
                    </div>
                </div>
                <div class="overlay-box center">
                    <div class="icon_box">
                        <span class="icon-arrows-2"></span>
                        <h4>足不出户,赔款到"户"</h4>
                    </div>
                    <div class="text">
                        <p>免费提供快递功能的资料袋，只需要一个电话，快递人员免费上门收取材料（邮寄费平安承担）。</p>
                    </div>
                </div>
            </div>
            <div class="no-padd item col-md-3 col-sm-6 col-xs-12">
                <div class="center">
                    <div class="icon_box">
                        <span class="icon-cup"></span>
                        <h4>绿色通道,及时快赔(1万元以上)</h4>
                    </div>
                </div>
                <div class="overlay-box center">
                    <div class="icon_box">
                        <span class="icon-cup"></span>
                        <h4>绿色通道,及时快赔(1万元以上)</h4>
                    </div>
                    <div class="text">
                        <p>大灾期间（台风、洪水等）发生事故，优先赔付，达成赔付意向次日内即可赔付。</p>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</section>




<!--Fact Counter-->





<section class="latest-project sec-padd">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-12 col-xs-12">
                <div class="section-title">
                    <h2>相关产品</h2>
                </div>
                <div class="text">
                    <p>我们在短时间内完成了超过10000个项目所有的项目都是由我们的专家团队完成的，他们100%满意。</p>
                </div>
            </div>
            <div class="col-md-9 col-sm-12 col-xs-12">
                <div class="latest-project-carousel owl-carousel owl-theme">
                    <div class="item">
                        <div class="single-latest-project-carousel">
                            <div class="img-box">
                                <img src="images/resource/4.jpg" alt="Awesome Image">
                                <div class="overlay">
                                    <div class="box">
                                        <div class="content">
                                            <div class="top">
                                                <a href=""></a>
                                            </div><!-- /.top -->
                                            <div class="bottom">
                                                <div class="title center">
                                                    <h3>产品名称</h3>
                                                    <span>Finance</span>
                                                </div>
                                            </div>
                                        </div><!-- /.content -->
                                    </div><!-- /.box -->
                                </div><!-- /.overlay -->
                            </div><!-- /.img-box -->
                        </div><!-- /.single-latest-project-carousel -->
                    </div>
                    <div class="item">
                        <div class="single-latest-project-carousel">
                            <div class="img-box">
                                <img src="images/resource/5.jpg" alt="Awesome Image">
                                <div class="overlay">
                                    <div class="box">
                                        <div class="content">
                                            <div class="top">
                                                <a href=""><i class="fa fa-link"></i></a>
                                            </div><!-- /.top -->
                                            <div class="bottom">
                                                <div class="title center">
                                                    <h3>产品名称</h3>
                                                    <span>Finance</span>
                                                </div>
                                            </div>
                                        </div><!-- /.content -->
                                    </div><!-- /.box -->
                                </div><!-- /.overlay -->
                            </div><!-- /.img-box -->
                        </div><!-- /.single-latest-project-carousel -->
                    </div>
                    <div class="item">
                        <div class="single-latest-project-carousel">
                            <div class="img-box">
                                <img src="images/resource/6.jpg" alt="Awesome Image">
                                <div class="overlay">
                                    <div class="box">
                                        <div class="content">
                                            <div class="top">
                                                <a href=""><i class="fa fa-link"></i></a>
                                            </div>
                                            <div class="bottom">
                                                <div class="title center">
                                                    <h3>产品名称</h3>
                                                    <span>Finance</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
                
    </div>
</section>







     
     <!--Footer Bottom-->
     <section class="footer-bottom">
        <div class="container">
            <div class="pull-left copy-text">
                <p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
                
            </div><!-- /.pull-right -->
            <div class="pull-right get-text">
                <ul>
                    <li><a>Legal</a></li>
                    <li><a>Sitemap</a></li>
                    <li><a> Privacy Policy</a></li>
                    <li><a>Terms & Condition</a></li>
                </ul>
            </div><!-- /.pull-left -->
        </div><!-- /.container -->
    </section>
     
</footer>

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

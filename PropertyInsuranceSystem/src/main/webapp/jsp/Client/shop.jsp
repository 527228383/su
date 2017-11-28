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
    <title>产品展示页面</title> 

    <!-- mobile responsive meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" href="images/favicon/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="images/favicon/favicon-16x16.png" sizes="16x16">
    <style type="text/css">
        .uls li a{
            color: dodgerblue;
            font-size: inherit;
        }
    </style>
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
                        <li><a href="<%=basePath%>insure/backmycenter" style="font-size:16px;">个人中心</a></li>
                        <li><a href="<%=basePath%>jsp/Client/contact.jsp" style="font-size:16px;">服务大厅</a></li>
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

<div class="breadcumb-wrapper">
    <div class="container">
        <div class="pull-left">
            <ul class="list-inline link-list">
                
                <li>
                    <a href="<%=basePath%>jsp/Client/index.jsp" style="font-size: 14px;">首页</a>
                </li>
                <li>
                    <font style="font-size: 14px;">购买产品</font>
                </li>
            </ul><!-- /.list-line -->
        </div><!-- /.pull-left -->
        
    </div><!-- /.container -->
</div>

<div class="产品">
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-12 col-xs-12">
                <div class="row">
                
                <c:forEach items="${products }" var="p">
                    <div class="col-md-4 col-sm-6 col-xs-12 hover-effect">
                        <div class="single-shop-item">
                            <div class="img-box">
                                <img src="images/shop/s6.png" alt="Awesome Image">
                                <div class="default-overlay-outer">
                                    <div class="inner">
                                        <div class="content-layer">
                                            <a href="<%=basePath%>insure/selectQuote?id=${p.id}" class="thm-btn thm-tran-bg">立即报价</a>
                                            <a href="<%=basePath%>product/getById?id=${p.id}" class="thm-btn thm-tran-bg">查看详情</a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.img-box -->
                            <div class="content-box">
                                <h4><a href="product/getById?id=${p.id}">${p.pro_name }</a></h4>
                                <div class="rating"><span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span></div>
                                <div class="item-price">¥
                                    <c:forEach items="${p.pro_quote }" var="pro" varStatus="i">
				                       ${pro.coverage}&nbsp;
				                       <c:if test="${i.count<2}">—</c:if>
				                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                    
                </div>
                <div class="border-bottom" ></div>
                <br>
                <div class="container">
                    <div class="col-xs-2"></div>
                    <div class="page_pagination col-xs-5">
			            <ul class="uls">
			                <li><a href="<%=basePath%>product/listpro?currentPage=1&type=2">首页</a></li>
			                <c:choose>
			                     <c:when test="${pageUtil.currentPage-1<=0}">
			                         <li>上一页</li>
			                     </c:when>
			                     <c:otherwise>
			                         <li><a href="<%=basePath%>product/listpro?currentPage=${pageUtil.currentPage-1}&type=2">上一页</a></li>
			                     </c:otherwise>
			                </c:choose>
			                <li>${pageUtil.currentPage}/${pageUtil.totalPage}</li>
			                <c:choose>
                                 <c:when test="${pageUtil.currentPage+1>pageUtil.totalPage}">
                                     <li>下一页</li>
                                 </c:when>
                                 <c:otherwise>
                                     <li><a href="<%=basePath%>product/listpro?currentPage=${pageUtil.currentPage+1}&type=2">下一页</a></li>
                                 </c:otherwise>
                            </c:choose>
			                <li><a href="<%=basePath%>product/listpro?currentPage=${pageUtil.totalPage}&type=2">尾页</a></li>
			            </ul>
			        </div>
                 </div>
            </div>

            <div class="col-md-3 col-sm-12 col-xs-12 sidebar_styleTwo">
                <div class="wrapper">
                    <div class="sidebar_search">
                        <form action="<%=basePath%>product/listpro">
                            <input type="text" placeholder="产品名称" name="pro_name" value="${pro_name }">
                            <input type="hidden"  name="currentPage" value="1">
                            <input type="hidden"  name="type" value="2">
                            <button class="tran3s color1_bg" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                        </form>
                    </div> <!-- End of .sidebar_styleOne -->

                    <div class="sidebar_categories">
                        <div class="theme_inner_title">
                            <h4>教你如何买保险</h4>
                        </div>
                        <ul class="list">
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                        </ul>
                    </div> <!-- End of .sidebar_categories -->

                    <div class="best_sellers clear_fix wow fadeInUp">
                        <div class="theme_inner_title">
                            <h4>受欢迎保险</h4>
                        </div>
                        <div class="best-selling-area">
                            <div class="best_selling_item clear_fix border">
                                <div class="img_holder float_left">
                                    <img src="images/shop/s11.png" alt="image">
                                </div> <!-- End of .img_holder -->

                                <div class="text float_left">
                                    <a href="shop-single.html"><h6>健康保险</h6></a>
                                    <span>¥24.99</span>
                                    <ul>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    </ul>
                                </div> <!-- End of .text -->
                            </div> <!-- End of .best_selling_item -->

                            <div class="best_selling_item clear_fix border">
                                <div class="img_holder float_left">
                                    <img src="images/shop/s12.png" alt="image">
                                </div> <!-- End of .img_holder -->

                                <div class="text float_left">
                                    <a href="shop-single.html"><h6>汽车保险</h6></a>
                                    <span>¥34.99</span>
                                    <ul>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    </ul>
                                </div> <!-- End of .text -->
                            </div> <!-- End of .best_selling_item -->

                            <div class="best_selling_item clear_fix">
                                <div class="img_holder float_left">
                                    <img src="images/shop/s13.png" alt="image">
                                </div> <!-- End of .img_holder -->

                                <div class="text float_left">
                                    <a href="shop-single.html"><h6>家庭保险</h6></a>
                                    <span>¥34.99</span>
                                    <ul>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                    </ul>
                                </div> <!-- End of .text -->
                            </div> <!-- End of .best_selling_item -->
                        </div>
                    </div> <!-- End of .best_sellers -->
                </div> <!-- End of .wrapper -->
            </div>
                    
        </div>
    </div> 
</div> 





<!-- Scroll Top Button -->
	<!-- jQuery js -->
	<script src="Client/js/jquery.js"></script>
	<!-- bootstrap js -->
	<script src="Client/js/bootstrap.min.js"></script>
	<!-- jQuery ui js -->
	<script src="Client/js/jquery-ui.js"></script>
	<!-- owl carousel js -->
	<script src="Client/js/owl.carousel.min.js"></script>
	<!-- jQuery validation -->
	<script src="Client/js/jquery.validate.min.js"></script>
	<!-- google map -->
	<script src="http://ditu.google.cn/maps/api/js?key=AIzaSyCRvBPo3-t31YFk588DpMYS6EqKf-oGBSI"></script> 
	<script src="Client/js/gmap.js"></script>
	<!-- mixit up -->
	<script src="Client/js/wow.js"></script>
	<script src="Client/js/jquery.mixitup.min.js"></script>
	<script src="Client/js/jquery.fitvids.js"></script>
    <script src="Client/js/bootstrap-select.min.js"></script>
	<script src="Client/js/menuzord.js"></script>

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
	<script src="Client/js/jquery.fancybox.pack.js"></script>
	<script src="Client/js/jquery.polyglot.language.switcher.js"></script>
	<script src="Client/js/nouislider.js"></script>
	<script src="Client/js/jquery.bootstrap-touchspin.js"></script>
	<script src="Client/js/SmoothScroll.js"></script>
	<script src="Client/js/jquery.appear.js"></script>
	<script src="Client/js/jquery.countTo.js"></script>
	<script src="Client/js/jquery.flexslider.js"></script>
	<script src="Client/js/imagezoom.js"></script>	
	<script id="map-script" src="Client/js/default-map.js"></script>
	<script src="Client/js/custom.js"></script>

</div>
	
</body>
</html>

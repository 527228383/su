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
			max-width: 900px;
		} 	
		.abc{
			cursor:pointer;
		}
		.tabContainer a{
			font-size:large;
			color:red;
		}
		.rig_nav a{
		 font-size:large;
		}	
 	</style>
 	<script type="text/javascript" src="js/Client/jquery.js"></script>
 	<script type="text/javascript" src="js/Client/login.js"></script>
	<script type="text/javascript">
		
		
	</script>
</head>
<body>

<div class="boxed_wrapper"></div>

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
                        <li><a href="<%=basePath%>jsp/Client/mycenter.jsp" style="font-size:16px;">个人中心</a></li>
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


	<br/><br/>
	<div class="container container-small ">
	 <div class="mainbody">
    <div class="currmenu">
      <ul class="rig_nav list-inline">
        <li class="rig_seleli"><a href="<%=basePath%>insure/index">首页</a></li>
        <li ><a href="<%=basePath%>insure/showOrder">我的保险</a></li>
        <li ><a href="<%=basePath%>insuredata/personal_Info">我的资料</a></li>
      </ul>
    </div>
    <br/><br/>
    
    <div class="rig_lm02">
      
      <div class="detail">
        <div class="det_inner">
          <div class="jd col-xs-3"><img src="./aaaa_files/jd.jpg" alt="" title=""></div>
          <div class="bs col-xs-3">
            <p><img src="./aaaa_files/bs_01.jpg" alt="" title=""> 实名认证用户</p>
            <p><img src="./aaaa_files/bs_02.jpg" alt="" title=""> 未实名认证用户</p>
          </div>
          <div class="scordeti col-xs-3" >
            <ul>
              <li>
	                <img src="./aaaa_files/juan (2).png" alt="" title="" width="80px" height="80px">
	                </br></br>
                <a href="insure/returnmoneypackage">我的钱包</a>
              </li>
             
            </ul>
          </div>
          
          <div class="col-xs-3">
          	<ul>
          		 <li>
                 <img src="./aaaa_files/juan (1).png" alt="" title="" width="80px" height="80px">
               </br></br><a>投保抵用券 ${acc.discount}</a>
              </li>
          	</ul>
          </div>
        </div>
      </div>
    </div>
    </div>
    </div>
    <br/><br/><br/>
    <div class="rig_lm03 container container-small">
      
      <div class="detail">
        <div class="inner03">
          <div id="tabCot_product" class="zhutitab">
            <div class="tabContainer ">
              <ul class="tabHead list-inline" id="tabCot_product">
                <li class="currentBtn" ><a href="<%=basePath%>insure/showOrder" rel="1"  >待支付</a><span class="grey_numb">${nopaynum}</span></li>
                <li><a href="<%=basePath%>insure/selectpolicy"  rel="2">待评价</a><span class="red_numb"> ${nocomment}</span></li>
                <li><a href="<%=basePath%>insure/selectpolicy"  rel="3">待续保</a><span class="red_numb">${continuepay}</span></li>
              </ul>
            </div>
            <br/>
            
           <img alt="" src="./aaaa_files/U18.png">
           <br/><br>
           <div  >
			<img style="margin-left:-50px" alt="" src="./aaaa_files/u19.png">
			</div>
           
           </div>
          </div>
          </div>
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


	</body>
</html>

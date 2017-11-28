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
    <title>服务大厅</title>
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




<div class="inner-banner has-base-color-overlay text-center" style="background: url(images/background/1.jpg);">
    <div class="container">
        <div class="box">
            <h3>知&nbsp;领&nbsp;财&nbsp;险</h3>
        </div><!-- /.box -->
    </div><!-- /.container -->
</div>



<section class="contact_details sec-padd">
    <div class="container">
        <div class="section-title">
            <h3>服务大厅</h3>
        </div>
        
      
        <div class="row">
            <div class="col-md-4 col-sm-8 col-xs-12">
                <div class="default-cinfo">
                    <div class="accordion-box">
                        <!--Start single accordion box-->
                        <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                            <div class="acc-btn active">
                                理赔介绍
                                <div class="toggle-icon">
                                    <i class="plus fa fa-angle-right"></i><i class="minus fa fa-angle-down"></i>
                                </div>
                            </div>
                            <div class="acc-content collapsed">
                                <ul class="contact-infos">
                                    <li>
                                        <div class="icon_box">
                                            <i class=""></i>
                                        </div><!-- /.icon-box -->
                                        <div class="text-box">
                                            <p><a href="">理赔流程</a></p>
                                        </div><!-- /.text-box -->
                                    </li>
                                    <li>
                                        <div class="icon_box">
                                            <i class=""></i>
                                        </div><!-- /.icon-box -->
                                        <div class="text-box">
                                            <p><a href="">理赔进度查询</a></p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="icon_box">
                                            <i class=""></i>
                                        </div><!-- /.icon-box -->
                                        <div class="text-box">
                                            <p>理赔网点</p>
                                        </div><!-- /.text-box -->
                                    </li>
                                    <li>
                                        <div class="icon_box">
                                            <i class=""></i>
                                        </div><!-- /.icon-box -->
                                        <div class="text-box">
                                            <p>理赔常见问题</p>
                                        </div>
                                    </li>
                                    
                                </ul>
                            </div>
                        </div>

                        <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                            <div class="acc-btn">
                                保单服务
                                <div class="toggle-icon">
                                    <span class="plus fa fa-angle-right"></span><span class="minus fa fa-angle-down"></span>
                                </div>
                            </div>
                            <div class="acc-content">
                                <ul class="contact-infos">
                                    <li>
                                        <div class="icon_box">
                                            <i class=""></i>
                                        </div><!-- /.icon-box -->
                                        <div class="text-box">
                                            <p>配送进度查询</p>
                                        </div><!-- /.text-box -->
                                    </li>
                                    <li>
                                        <div class="icon_box">
                                            <i class=""></i>
                                        </div><!-- /.icon-box -->
                                        <div class="text-box">
                                            <p><a href="">电子保单信息</a></p>
                                        </div><!-- /.text-box -->
                                    </li>
                                    <li>
                                        <div class="icon_box">
                                            <i class=""></i>
                                        </div><!-- /.icon-box -->
                                        <div class="text-box">
                                            <p><a href="">保单加保</a></p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                            <div class="acc-btn">
                                增值服务
                                <div class="toggle-icon">
                                    <span class="plus fa fa-angle-right"></span><span class="minus fa fa-angle-down"></span>
                                </div>
                            </div>
                            <div class="acc-content">
                                <ul class="contact-infos">
                                    <li>
                                        <div class="icon_box">
                                            <i class=""></i>
                                        </div><!-- /.icon-box -->
                                        <div class="text-box">
                                            <p>免费道路救援</p>
                                        </div><!-- /.text-box -->
                                    </li>
                                    <li>
                                        <div class="icon_box">
                                            <i class=""></i>
                                        </div><!-- /.icon-box -->
                                        <div class="text-box">
                                            <p>各地特色服务</p>
                                        </div><!-- /.text-box -->
                                    </li>
                                  
                                </ul>
                            </div>
                        </div>


                    </div>
                </div>
                    
            </div>
            <div class="col-md-8 col-sm-12 col-xs-12">
                <div class="home-google-map">
                    <div 
                        class="google-map" 
                        id="contact-google-map" 
                        data-map-lat="41.363800" 
                        data-map-lng="-74.273110" 
                        data-icon-path="images/logo/map-marker.png"
                        data-map-title="Chester"
                        data-map-zoom="11" >

                    </div>

                </div>
            </div>
        </div>
    </div>
</section>

<!--
	作者：smx_23@163.com
	时间：2017-11-14
	描述：

<div class="container">
    <div class="border-bottom"></div>
</div>
-->


<div class="breadcumb-wrapper">
    <div class="container">
        <div class="pull-left">
            <ul class="list-inline link-list">
                
                <li>
                    关于我们
                </li>
            </ul><!-- /.list-line -->
        </div><!-- /.pull-left -->
        
    </div><!-- /.container -->
</div>


<section class="about-faq sec-padd">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="about-info">
                    <h4>公司简介</h4>
                    <br>
                    <div class="text">
                        <p style="font-size:x-small;">中国知领财险（集团）股份有限公司（以下简称“知领财险”）是1991年5月13日成立的保险集团公司，总部设在上海，是国内领先的“A+H”股上市综合性保险集团。</p><br>
                        <p style="font-size: x-small;">知领财险以“在你身边的一流保险金融服务集团”为愿景，坚持“以客户需求为导向，专注保险主业，推动和实现可持续的价值增长”的经营理念，遵循“保险姓保”的行业发展规律，在实践中不断深化、强化、固化，成为一家资本雄厚，价值创造、风险管控能力强，专业化水平较高的综合性保险集团。</p><br>
                        <p style="font-size: x-small;">知领财险以“做一家负责任的保险公司”为使命，以“诚信天下，稳健一生，追求卓越”为企业核心价值观，将企业社会责任全面融入公司的商业模式中，为客户、股东、员工、行业、社会、环境等利益相关方创造共享价值，连续七年获中国企业社会责任榜“杰出企业奖”。</p><br>
                        <p style="font-size: x-small;">2017 年是知领财险新一轮三年规划的开局之年，公司将启动实施“数字太保”战略举措，积极践行“创新数字体验，优化数字供给，共享数字生态”的使命，持续提升公司价值，更好地回报股东、客户和社会！</p><br>
                    </div>

                   
                </div>
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="img-box">
                            <img src="images/resource/c7.png" alt="">
                        </div>
                        <br>
                        <h4>Our CMO</h4>
                        <br>
                        <p>To exceed our customers’ expectations with innovattive & bespoke Assurance, Testing, Inspecttions and Certifications services for their operations.</p>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="img-box">
                            <img src="images/resource/c8.png" alt="">
                        </div>
                        <br>
                        <h4>Our CPO</h4>
                        <br>
                        <p>To become the world’s most trusted partner for Quality Assurance. Be a great place to work where people are inspired to be the best they can be.</p>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</section>





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
	<script src="js/Client/validation.js"></script>
	<script src="js/Client/jquery.appear.js"></script>
	<script src="js/Client/jquery.countTo.js"></script>
	<script src="js/Client/jquery.flexslider.js"></script>
	<script src="js/Client/imagezoom.js"></script>	
	<script id="map-script" src="js/Client/default-map.js"></script>
	<script src="js/Client/custom.js"></script>

</div>
	
</body>
</html>

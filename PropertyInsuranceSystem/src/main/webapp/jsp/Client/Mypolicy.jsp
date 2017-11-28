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
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Insert title here</title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/responsive.css">
  <script type="text/javascript" src="js/Client/jquery-1.8.0.min.js"></script>
 	<style>
		.container-small{
			max-width: 1200px;
			font-size: smaller;
			
		} 	
		.tby-small p{
			font-size: x-small;
		}	
		.checkbox{
			margin-left: 15px;
			font-size: x-small;
		}
		.uls li a{
			color: dodgerblue;
			font-size: inherit;
		}
 	</style>

 	<script type="text/javascript">
	$(function(){
		$("#sub").click(function(){
			$("#pg").val(1);
			$("#fm").submit();
		})
		$("#cd").click(function(){
			$("cd").val("");
		})
	
	})
	function firstpage(){
		$("#pg").val(1);
		alert('hh');
		$("#fm").submit();
	}
	function lastpage(){
		$("#pg").val("${pagesum}");
		$("#fm").submit();
	}
	function nextpage(){
		if("${page}"=="${pagesum}"){
			alert('最后一页了');
		}else{
			$("#pg").val("${page+1}");
			$("#fm").submit();
		}
	}
	function uppage(){
		if("${page}"==1){
			alert('最后一页了');
		}else{
			$("#pg").val("${page-1}");
			$("#fm").submit();
		}
	}
</script>
</head>
<body>

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
                        <li><a href="blog-grid.html" style="font-size:16px;">服务大厅</a></li>
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
	
	
	<br /><br />
	    <div class="container">
	        <div class="pull-left">
	            <ul class="list-inline " style="font-size: small;">
	                
	                <li>
	                    <a href="<%=basePath%>insure/showOrder" style="color: #00ccff;">我的订单</a>
	                </li>
	                	<a href="<%=basePath%>insure/selectpolicy">我的保单</a>
	                <li>
	                    <a href="<%=basePath%>insure/selectlipei">理赔查询</a>
	                </li>
	            </ul><!-- /.list-line -->
	        </div><!-- /.pull-left -->
	        
	    </div><!-- /.container -->
	
		 <br /><br />
		 
		<div class="container container-small ">
			<div class="well">
			<br />
			<div class="col-xs-2">
				我的交易提醒:
			</div>
			
			
			
		<form action="<%=basePath%>insure/selectpolicy" id="fm">
			<div class="col-xs-2" ">
				<!-- 时间筛选 -->
				<input type="hidden" name="page" id="pg">
				<select name="type">
					<c:choose>
						<c:when test="${type=='1'}">
							<option value='1' selected="selected">生效中</option>
							<option value='2'>待续保</option>
						</c:when>
						<c:otherwise>
							<option value='1' >生效中</option>
							<option value='2' selected="selected">待续保</option>
						</c:otherwise>
					</c:choose>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
	
			<div class="col-xs-3"></div>
			<div class="col-xs-3">
				 <div class="input-group">
				 <!-- 产品名称、被保人、保单号 -->
                <input type="text" class="form-control" name="condition" value="${condition}" id="cd"/>
               	<!-- 当前页数，用于分页 -->
                 <span class="input-group-addon""><i class="glyphicon glyphicon-search" id="sub"></i></span>
            </div>
			</div>
		</form>
		
		<br /><br />
		<div class="container">
		
		
		<div class="form-group col-xs-2">
			
		</div>
		<div class="form-group col-xs-6"></div>
		<div class="form-group col-xs-2">	
		</div>
		</div>
		</div>


		<div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>保单内容</th>
						<th>常驻城市</th>
						<th>金额(元)</th>
					
					</tr>
				</thead>
	
				<tbody class="tby-small">
				<c:forEach items="${ls}" var="n">
					<tr>
						<td>
							<p>
								<div class="form-group">
									<label class="checkbox" >
										${n.productDto.pro_name}
									</label>
								</div>
							</p>
							<p><span>订单生效日期&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${n.b_effect_date}" pattern="yyyy-MM-dd"/></span></p>
							<p><span>订单失效日期&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${n.b_lose_date}" pattern="yyyy-MM-dd"/></span></p>
							<p><span>投保单号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${n.id}</span></p>
							<p><span>被保险人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${n.assurerDto.ass_name}</span></p>
						</td>
						<td>
							${n.assurerDto.ass_city_name}
						</td>
						<td>
							${n.b_coverage}
						</td>
						<td>
							<p><a href="<%=basePath%>sales/getPolicy/view/${n.id}">保单详情</a></p>
						</td>
						
						<td>
							<c:choose>
								<c:when test="${n.b_com_mark=='1'}">
										<td><a href="<%=basePath%>insure/writeComment/${n.id}">评论</a></td>
								</c:when>
								<c:otherwise>
									<td>已评论</td>
								</c:otherwise>
							</c:choose>
						</td>

						<td>
							<c:choose>
								<c:when test="${n.b_state_id=='4'}">
									<td><a href="<%=basePath%>insure/continuepolicy?id=${n.id}&count=${n.b_coverage}" onclick="return confirm('是否确定要续保')">我要续保</a></td>
								</c:when>
								<c:when test="${n.b_state_id>='5' and n.b_state_id<='7' }">
									<td>已发起理赔</td>
								</c:when>
								<c:otherwise>
									<td><a href="<%=basePath%>act/start/${n.id}" onclick="return confirm('是否确定要申请理赔')">我要索赔</a></td>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			
		</div>
		
		<div class="container">
			<div class="col-xs-4">
				<label style="margin-top: 20px;">
					总共:&nbsp;<span>${pagesum}</span>&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;页数:&nbsp;<span>${page}</span>/<span>${pagesum}</span>
				</label>
			</div>
		<div class="page_pagination col-xs-8 ">
			<ul class="uls">
				<li><a href="javascript:firstpage()">首页</a></li>
				<li><a href="javascript:uppage()">上页</a></li>
				<li><a href="javascript:nextpage()">下页</a></li>
				<li><a href="javascript:lastpage()">尾页</a></li>
			</ul>
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

</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
 	<style>
		.container-small{
			max-width: 560px;
			font-size: smaller;
		} 	
		.container-ss label{
			font-size: x-small;
			font-weight: 400;
		}
 	</style>
</head>
<body>
	<div class="boxed_wrapper">

		 <br />
		 <div class="container container-small well">
		
			<br />
			<h4 align="center">知领保险股份有限公司投保申请单</h4>
			<br />
			<div class="float_right">
				<label class="input-group" style="margin-right: 10px;">
					申请单号：<span>${orderDto.id}</span>
				</label>
			</div>
			<br /><br />
			<div>
				<p style="font-size: x-small;margin-left: 30px ;">以来信息来源于您的投保申请，是为您提供理赔及售后服务的重要依据，请务必仔细核对。</p>
			</div>
			<br /><br />
			<div >
				<label style="margin-left: 30px;">投保人信息</label>
			</div>
			<br />
			<div class="container container-ss" style="width: 90%;">
				<div class="col-xs-6" style="background-color: white;">
					<br/>
					<label>
						投保人姓名：<span>${orderDto.insureDto.ins_name }</span>
					</label><br/><br/>
					<label>
						证件类型：<span>二代身份证</span>
					</label><br/><br/>
					<label>
						出生日期：<span>${fn:substring(orderDto.insureDto.ins_id_card,6,10)}-${fn:substring(orderDto.insureDto.ins_id_card,10,12)}-${fn:substring(orderDto.insureDto.ins_id_card,12,14)} </span>
					</label><br/><br/>
				</div>
				<div class="col-xs-6" style="background-color: white;">
					<br/>
					<label>
						<c:if test="${orderDto.insureDto.ins_gender=='1'}">
							性别：<span>男</span>
						</c:if>
						<c:if test="${orderDto.insureDto.ins_gender=='0'}">
							性别：<span>女</span>
						</c:if>
					</label><br/><br/>
					<label>
						证件号码：<span>${orderDto.insureDto.ins_id_card}</span>
					</label><br/><br/>
					<label>
						手机号码：<span>${orderDto.insureDto.ins_tel }</span>
					</label><br/><br/>
				</div>
			</div>
			
			<br /><br />
			<div >
				<label style="margin-left: 30px;">被保险人信息</label>
			</div>
			<br />
			<div class="container container-ss" style="width: 90%;">
				<div class="col-xs-6" style="background-color: white;">
					<br/>
					<label>
						被保险人姓名：<span>${orderDto.assurerDto.ass_name }</span>
					</label><br/><br/>
					<label>
						<c:if test="${orderDto.assurerDto.ass_gender=='1'}">
							性别：<span>男</span>
						</c:if>
						<c:if test="${orderDto.assurerDto.ass_gender=='0'}">
							性别：<span>女</span>
						</c:if>
					</label><br/><br/>
					<label>
						证件号码：<span>${orderDto.assurerDto.ass_id_card }</span>
					</label><br/><br/>
					<label>
						手机号码：<span>${orderDto.assurerDto.ass_tel}</span>
					</label><br/><br/>
				</div>
				<div class="col-xs-6" style="background-color: white;">
					<br/>
					<label>
						与投保人关系：<span>其他</span>
					</label><br/><br/>
					<label>
						证件类型：<span>二代身份证</span>
					</label><br/><br/>
					<label>
						出生日期：<span>${fn:substring(orderDto.assurerDto.ass_id_card,6,10)}-${fn:substring(orderDto.assurerDto.ass_id_card,10,12)}-${fn:substring(orderDto.assurerDto.ass_id_card,12,14)} </span>
					</label><br/><br/>
					<label>
						&nbsp;
					</label><br/><br/>
				</div>
			</div>
			<br /><br />
			<div >
				<label style="margin-left: 30px;">保障责任</label>
			</div>
			<br />
			<div class="container container-ss" style="width: 90%;">
				<div class="col-xs-6" style="background-color: white;">
					<br />
					<label >
						<span>${orderDto.productDto.pro_name}</span>&nbsp;损失保险
					</label>
				</div>
				<div class="col-xs-6" style="background-color: white;">
					<br />
					<label >
					<span>最高可赔付&nbsp;${orderDto.d_insured_amount}&nbsp;万元</span>
					</label>
				</div>	
			</div>
			<br /><br />
			<div >
				<label style="margin-left: 30px;">保险期限及保费</label>
			</div>
			<br />
			<div class="container container-ss" style="width: 90%;">
				<div style="background-color: white;">
					<br />
					<label>
						保险期限：<span>______</span>&nbsp;零时起&nbsp;至&nbsp;<span>______</span>&nbsp;二十四时止
					</label><br/><br/>
					<label>
						合计保费：<span style="font-size: 20px;color: orange;">${orderDto.d_coverage}</span>元
					</label><br/><br/>
				</div>
				
			</div>
			
			<br /><br />
			<div >
				<label style="margin-left: 30px;">其他信息</label>
			</div>
			<br />
			<div class="container container-ss" style="width: 90%;">
				<div style="background-color: white;">
					<br />
					<label>
						电子保单：发送至投保人的电子邮箱&nbsp;<span>${orderDto.insureDto.ins_email}</span>
					</label><br/><br/>
				</div>
				
			</div>
			
			<br /><br />
			
			
			<div >
				<p style="width: 90%;float: right;font-size: xx-small;font-weight: 200;">最终解释权：中国知领财险股份有限公司</p>
			</div>
		</div>
		<div align="center">
			<p><p>
			<input type="button"  class="btn btn-info" onclick="javascript:history.back(-1);" value="返回上一页">
			<p><p>
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
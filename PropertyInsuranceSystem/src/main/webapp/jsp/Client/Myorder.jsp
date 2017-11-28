<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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

		//提交表单

		$("#sub").click(function(){
			
			$("#pg").val(1);
			$("#fm").submit();
		});
		
		//清空条件
		$("#pn").click(function(){
			$("#pn").val("");
		});
		
		//全选框
		$("#allselect").click(function(){

			$("[name='updateid']").each(function(){
				$(this).prop("checked",$("#allselect").prop('checked'));
			});
		});


		$("[name='updateid']").click(function(){
		
			if($("[name='updateid']:checked").size()==$("[name='updateid']").size()){
				$("#allselect").prop("checked",true);
			}else{
				$("#allselect").prop("checked",false);
			}
		});
		
		//全选删除
		$("[name='del']").click(function(){
			if($("[name='updateid']:checked").size()!="0"){
				alert("hah");
				$("#fr").attr("action","<%=basePath%>insure/update_dd/1");
				$("#fr").submit();
			}
		});
		//全选支付
	});
	
	//首页
	function firstpage(){
		$("#pg").val(1);
		alert('hh');
		$("#fm").submit();
	}
	//尾页
	function lastpage(){

		$("#pg").val("${PageUtil.totalPage}");
		$("#fm").submit();
	}
	//下一页
	function nextpage(){

		if("${PageUtil.currentPage}"=="${PageUtil.totalPage}"){
			alert('最后一页了')

		}else{

			$("#pg").val("${PageUtil.currentPage+1}");

			$("#fm").submit();
		}
		
	}
	//上一页
	function uppage(){
		if("${PageUtil.currentPage}"==1){
			alert('第一页了')

		}else{
			$("#pg").val("${PageUtil.currentPage+1}");

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
		<form action="<%=basePath%>insure/showOrder" method="post" id='fm'>
			<div class="col-xs-2" ">
				<!-- 时间筛选 -->
				
				<select name="time_mark" id="time">
					<c:if test="${query.time_mark=='1'}">
						<option value='1' selected="selected">三天内</option>
						<option value='2'>三天前</option>
					</c:if>
					<c:if test="${query.time_mark=='2'}">
						<option value='1'>三天内</option>
						<option value='2' selected="selected">三天前</option>
					</c:if>
				</select>
			</div>
			<div class="col-xs-2" ">
				<!-- 条件筛选 -->

				<select name="typeid" id="type">
					<c:if test="${query.typeid=='1'}">
						<option value='1' selected="selected">待支付</option>
						<option value='2'>待支付（需核实）</option>
						<option value='3'>已支付（待核实）</option>
						<option value='4'>已支付（核实未通过）</option>
					</c:if>
					<c:if test="${query.typeid=='2'}">
						<option value='1'>待支付</option>
						<option value='2' selected="selected">待支付（需核实）</option>
						<option value='3'>已支付（待核实）</option>
						<option value='4'>已支付（核实未通过）</option>
					</c:if>
					<c:if test="${query.typeid=='3'}">
						<option value='1'>待支付</option>
						<option value='2'>待支付（需核实）</option>
						<option value='3' selected="selected">已支付（待核实）</option>
						<option value='4'>已支付（核实未通过）</option>
					</c:if>
					<c:if test="${query.typeid=='4'}">
						<option value='1'>待支付</option>
						<option value='2'>待支付（需核实）</option>
						<option value='3'>已支付（待核实）</option>
						<option value='4' selected="selected">已支付（核实未通过）</option>
					</c:if>
				</select>
			</div>
			
			<div class="col-xs-3"></div>
			<div class="col-xs-3">
				 <div class="input-group">
				 <!-- 产品名称、被保人、保单号 -->
                <input type="text" class="form-control" name="pro_name" id="pn" value="${query.pro_name}"/>
               	<!-- 当前页数，用于分页 -->
                <input type="hidden" name="currentPage" id="pg">
                 <span class="input-group-addon""><i class="glyphicon glyphicon-search" id="sub"></i></span>
            </div>
			</div>
		</form>

		<br /><br />
		<div class="container">
		<form class="form-group col-xs-2 ">
				<label class="checkbox ">
				<!-- 全选框 -->
				<input type="checkbox" id="allselect"/>
				全选
				</label>
		</form>	
		
		<div class="form-group col-xs-2">
			<c:if test="${query.typeid!='3'}">
					<input class="btn btn-default" value="删除选中的" name="del" style="width: 100px;height: 25px;margin-top: 5px;"/>
			</c:if>
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
	

		 <form id="fr">
		 
				<tbody class="tby-small">
				<c:forEach items="${ls}" var="n">
					<tr>
						<input type="hidden" value="${n.d_coverage}" name="d_coverage"/>
						<td>
							<p>
								<div class="form-group">
									<label class="checkbox" >
										<input type="checkbox" name="updateid" value="${n.id}"/>${n.productDto.pro_name}
									</label>
								</div>
							</p>
							<p><span>订单生成日期&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${n.d_add_date}" pattern="yyyy-MM-dd"/></span></p>
							<p><span>投保单号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${n.id}</span></p>
							<p><span>被保险人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${n.assurerDto.ass_name}</span></p>
						</td>
						<td>
							${n.assurerDto.ass_city_name}
						</td>
						<td>
							${n.d_coverage}
						</td>
						<td>
							<c:choose>
								<c:when test="${query.typeid=='4'}">
									<a href="<%=basePath%>sales/getCheckDetail/${n.id}" >拒绝理由</a>
								</c:when>
								<c:otherwise>
									<p><a href="<%=basePath%>insure/selectOrderByid/${n.id}">订单详情</a></p>
								</c:otherwise>
								</c:choose>
						</td>
						<td>
							<c:if test="${query.typeid=='1'}">
								<a href="<%=basePath%>insure/update_dd/1?updateid=${n.id}" onclick="return confirm('确定要删吗')">删除</a>
							</c:if>
							<c:if test="${query.typeid=='2'}">
								<a href="<%=basePath%>insure/update_dd/1?updateid=${n.id}" onclick="return confirm('确定要删吗')">删除</a>
							</c:if>
							<c:if test="${query.typeid=='4'}">
								<a href="<%=basePath%>insure/update_dd/1?updateid=${n.id}" onclick="return confirm('确定要删吗')">删除</a>
							</c:if>
						</td>
						
						<td>
							<c:if test="${query.typeid=='1'}">
								<a href="<%=basePath%>insure/updatePayment?typeid=2&ord_id=${n.id}&coverage=${n.d_coverage}&condition=1" onclick="return confirm('确定要支付吗')">支付</a>
							</c:if>	
							<c:if test="${query.typeid=='2'}">
								<a href="<%=basePath%>insure/updatePayment?typeid=3&ord_id=${n.id}&coverage=${n.d_coverage}&condition=1" onclick="return confirm('确定要支付吗')">支付</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			
		</div>
		
		<div class="container">
			<div class="col-xs-4">
				<label style="margin-top: 20px;">
					总共:&nbsp;<span>${PageUtil.totalPage}</span>&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;页数:&nbsp;<span>${PageUtil.currentPage}</span>/<span>${PageUtil.totalPage}</span>
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
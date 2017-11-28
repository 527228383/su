<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">

	<style type="text/css">
		.container-small{
			max-width: 450px;
		}
	</style>
  	<script type="text/javascript" src="js/Client/jquery-1.8.0.min.js">
  	</script>
  	<script type="text/javascript">
	$(function(){
			var a=0;
			$("#bt1").click(function(){
				$("#div").css("display",'block');
				a=1;
			});
			
			$("#bt2").click(function(){
				$("#div").css("display",'block');
				a=2;
			});
			
			$("#bt3").click(function(){
				if(a==1){
					 var  s=confirm('确定要充值吗？');
					 if(s){
					
						$("#mark").val('1');
						$("#fm").submit();
					 }
				}else if(a==2){
					 var  s=confirm('确定要提现吗？');
					 if(s){
				
						 $("#mark").val('2');
						 $("#fm").submit();
					 }
				}
			});
			$("#bankno").blur(function(){
				var bankno=$("#bankno").val();
				luhmCheck(bankno);
			})
		});
	function luhmCheck(bankno){
		if (bankno.length < 16 || bankno.length > 19) {
			//$("#banknoInfo").html("银行卡号长度必须在16到19之间");
			return false;
		}
		var num = /^\d*$/;  //全数字
		if (!num.exec(bankno)) {
			//$("#banknoInfo").html("银行卡号必须全为数字");
			return false;
		}
		//开头6位
		var strBin="10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99";    
		if (strBin.indexOf(bankno.substring(0, 2))== -1) {
			//$("#banknoInfo").html("银行卡号开头6位不符合规范");
			return false;
		}
        var lastNum=bankno.substr(bankno.length-1,1);//取出最后一位（与luhm进行比较）
    
        var first15Num=bankno.substr(0,bankno.length-1);//前15或18位
        var newArr=new Array();
        for(var i=first15Num.length-1;i>-1;i--){    //前15或18位倒序存进数组
            newArr.push(first15Num.substr(i,1));
        }
        var arrJiShu=new Array();  //奇数位*2的积 <9
        var arrJiShu2=new Array(); //奇数位*2的积 >9
        
        var arrOuShu=new Array();  //偶数位数组
        for(var j=0;j<newArr.length;j++){
            if((j+1)%2==1){//奇数位
                if(parseInt(newArr[j])*2<9)
                arrJiShu.push(parseInt(newArr[j])*2);
                else
                arrJiShu2.push(parseInt(newArr[j])*2);
            }else{//偶数位
            arrOuShu.push(newArr[j]);}
        }
        
        var jishu_child1=new Array();//奇数位*2 >9 的分割之后的数组个位数
        var jishu_child2=new Array();//奇数位*2 >9 的分割之后的数组十位数
        for(var h=0;h<arrJiShu2.length;h++){
            jishu_child1.push(parseInt(arrJiShu2[h])%10);
            jishu_child2.push(parseInt(arrJiShu2[h])/10);
        }        
        
        var sumJiShu=0; //奇数位*2 < 9 的数组之和
        var sumOuShu=0; //偶数位数组之和
        var sumJiShuChild1=0; //奇数位*2 >9 的分割之后的数组个位数之和
        var sumJiShuChild2=0; //奇数位*2 >9 的分割之后的数组十位数之和
        var sumTotal=0;
        for(var m=0;m<arrJiShu.length;m++){
            sumJiShu=sumJiShu+parseInt(arrJiShu[m]);
        }
        
        for(var n=0;n<arrOuShu.length;n++){
            sumOuShu=sumOuShu+parseInt(arrOuShu[n]);
        }
        
        for(var p=0;p<jishu_child1.length;p++){
            sumJiShuChild1=sumJiShuChild1+parseInt(jishu_child1[p]);
            sumJiShuChild2=sumJiShuChild2+parseInt(jishu_child2[p]);
        }      
        //计算总和
        sumTotal=parseInt(sumJiShu)+parseInt(sumOuShu)+parseInt(sumJiShuChild1)+parseInt(sumJiShuChild2);
        
        //计算Luhm值
        var k= parseInt(sumTotal)%10==0?10:parseInt(sumTotal)%10;        
        var luhm= 10-k;
        
        if(lastNum==luhm){
        $("#banknoInfo").html("Luhm验证通过");
        return true;
        }
        else{
        $("#banknoInfo").html("银行卡号必须符合Luhm校验");
        return false;
        };       
    };
  	</script>
  	

</head>
<body>
		<body>
		<div class="boxed_wrapper">



<header class="top-bar">
    <div class="container">
        <div class="clearfix">
            
        </div>
            

    </div>
</header>

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
	<div class="container container-small ">
	
<form action="<%=basePath%>insure/balance" id="fm">
	<h1 class="well" align="center">我的钱包</h1>
	<!-- 展示姓名 -->
  	<div class="form-group">
  		<!-- 隐藏域id -->
  		<input class="form-control" type="hidden" name="ins_id" value="${insure.id}" >
  		<input class="form-control" type="hidden" name="mark"id="mark">
  		<label>姓名：</label>
		<input class="form-control" type="text" name="ins_name" value="${insure.ins_name}" readonly="readonly">
	</div>
  	<div class="form-group">
  		<!-- 展示金额 -->
  		<label>余额：</label>
  		<div class="input-group">
  		<div class="input-group-addon">¥</div>
  		<input class="form-control"  type="text" name="balance" value="${account.balance}" readonly="readonly"> 
  		</div>
  	</div>
  	<div class="form-group" align="center">
   		<input class="btn btn-info" type="button" value="充值" id="bt1" >
   		<input class="btn btn-warning"  type="button" value="提现" id="bt2" >
  	</div>
  	
  	<div id="div" style="display:none">
  		<label>银行卡号:</label>
  		<input class="form-control" id="bankno" type="text" ><font id="banknoInfo"></font>
  		<div class="form-group">
  		<label>充值金额:</label>
  		<div class="input-group">
  		<div class="input-group-addon">¥</div>
    	<input class="form-control"  type="text"  name="count" value="">
    	</div>
    	</div>
    	<div class="form-group" align="center">
    		<input  id="bt3"  class="btn btn-primary"  type="button" value="提交" >
    	</div>
  	</div>
		
		</form>
			
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
	<script id="map-script" src="js/default-map.js"></script>
	<script src="js/Client/custom.js"></script>

</div>
</body>
</html>
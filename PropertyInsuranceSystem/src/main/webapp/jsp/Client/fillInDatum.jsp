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
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>填写购买资料</title>
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/Client/jquery.js"></script> 
	
	<style>
	       .abc{
            cursor:pointer;
        }   
	</style>  
	<script type="text/javascript" src="js/Client/fillInDatum.js"></script>
</head>
<body>
	<header class="top-bar">
	    <div class="container">
	        <div class="clearfix">
	            <ul class="top-bar-text float_left">
	                <li><i class="icon-technology-1"></i>Phone +123-456-7890</li>
	                <li><i class="icon-note"></i>Mail@Fortuneteam.com</li>
	                <li style="font-size:14px"><i class="icon-world"></i>广东省深圳市淘金地大厦</li>
	            </ul>
	        </div>
	    </div>
	</header>

	<div style=" margin: 20px 150px; font-size: 14px">
	    <a href="<%=basePath%>jsp/Client/index.jsp">首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;
	    <a href="<%=basePath%>product/listpro?type=2">产品展示</a>&nbsp;&nbsp;>&nbsp;&nbsp;
	    <a>填写资料</a>
	</div>

	<div style=" margin: 20px 150px; width: 800px; height: 2000px; border: 2px solid #ADADAD;">
	    <div style=" height: 45px; background-color: #D3D3D3; padding: 12px 20px; margin-bottom: 30px;">
	        保险名称
	    </div>
	   <form action="<%=basePath%>insure/addDatum" method="post" id="sum">
		    <div style=" width: 200px; height: 220px; padding: 90px 60px; border: 1px solid #EFEFEF;float: left; margin:0 0 10px 50px; background-color: #C4E3F3;">
		                        报价明细
		    </div>
		    
		    <div style=" width: 500px; height: 220px; padding: 30px 30px; border: 1px solid #EFEFEF; float: left; margin-bottom: 10px;">
				        保险名称：${pro.pro_name }<br /><br />
				       <input type="hidden" value="${pro.pro_name }" name="pro_name"/> 
				        保障范围：${pro.pro_scope }<br /><br />
				        <input type="hidden" value="${pro.pro_scope }" name="pro_scope"/>
				        
				        <input type="hidden" value="${pro.id }" name="pro_id"/>
				        选择报价：<select name="coverage" id="coverage">
				                 <option>--购买金额--</option>
				                 <c:forEach items="${pro.pro_quote }" var="p">
				                     <option value="${p.coverage }">${p.coverage }</option>
				                 </c:forEach>
				           </select>
				     <br />      
				     <br />
	                 <div class="form-inline">
	                    <div >
	                                                             赔付金额:
	                        <input type="text" id="insured_amount" name="insured_amount" class="form-control" readonly="readonly">
	                    </div>
	                 </div>
		    </div>
		    
		    <div style=" width: 200px; height: 430px; padding: 200px 50px; border: 1px solid #EFEFEF;float: left; margin:0 0 10px 50px; background-color: #C4E3F3;">
		                          投保人信息
		    </div>
		    
		    <div style=" width: 500px; height:430px; padding: 30px 30px; border: 1px solid #EFEFEF; float: left; margin-bottom: 10px;">
				        姓名：<input type="text" name="ins_name" id="ins_name" value="${insure.ins_name }" onblur="insname()">
				        <font id="f1"></font><br />
				        
				        身份证号码：<input type="text" name="ins_id_card" id="ins_id_card" value="${insure.ins_id_card }" onblur="card()">
				        <font id="f2"></font><br />
				        
				        手机号码：<input type="text" name="ins_tel" id="ins_tel" value="${insure.ins_tel }" onblur="tel()">
				        <font id="f3"></font><br />
				        
				        邮箱：<input type="text" name="ins_email" id="ins_email" value="${insure.ins_email }" onblur="email()">
				        <font id="f4"></font><br />
				        
				        地址：<select style=" font-size: 14px" id="provinceOne" onchange="CityOne()">
				             <option>--选择省份--</option>
				             <c:forEach items="${province }" var="p">
				                 <option value="${p.pcode }">${p.pname}</option>
				             </c:forEach>
				        </select>
				        &nbsp;&nbsp;&nbsp;
				        <select style=" font-size: 14px" id="cityOne" name="ins_city_name">
				             <option>--选择城市--</option>
				        </select>
		    </div>
		    
		    <div style=" width: 200px; height: 480px; padding: 200px 50px; border: 1px solid #EFEFEF;float: left; margin:0 0 10px 50px; background-color: #C4E3F3;">
		                       受保人信息
		    </div>
		    
		    <div style=" width: 500px; height: 480px; padding: 30px 30px; border: 1px solid #EFEFEF; float: left; margin-bottom: 10px;">
			        <div style="margin-left: 20px; font-size: 14px;">
			            <label class="checkbox">
			                <input type="checkbox" id="check" onclick="abc()"/>同投保人
			            </label>
			        </div>
				        姓名：<input type="text" name="ass_name" id="ass_name" onblur="nameOne()">
				        <font id="f5"></font><br />
				        
				        身份证号码：<input type="text" name="ass_id_card" id="ass_id_card" onblur="cardOne()">
				        <font id="f6"></font><br />
				        
				        手机号码：<input type="text" name="ass_tel" id="ass_tel" onblur="telOne()">
				        <font id="f7"></font><br />
				        
				        邮箱：<input type="text" name="ass_email" id="ass_email" onblur="emailOne()">
				        <font id="f8"></font><br />
				        
				       地址：<select style=" font-size: 14px" id="provinceTwo" onchange="CityTwo()">
	                         <option>--选择省份--</option>
	                         <c:forEach items="${province }" var="p">
	                             <option value="${p.pcode }">${p.pname}</option>
	                         </c:forEach>
	                    </select>
	                    &nbsp;&nbsp;&nbsp;
	                    <select style=" font-size: 14px" id="cityTwo" name="ass_city">
	                         <option>--选择城市--</option>
	                    </select>
		    </div>
		    
		    <div style=" width: 200px; height: 650px; padding: 200px 50px; border: 1px solid #EFEFEF;float: left; margin:0 0 0px 50px; background-color: #C4E3F3;">
		                        投保人声明
		    </div>
		    
		    <div style=" width: 500px; height: 650px; font-size: 14px; padding: 30px 30px; border: 1px solid #EFEFEF; float: left;">
		        1、本投保人兹申明以上述各项内容填写属实，已征得被保险人同意，并认可保险金额。<br />
		        2、本投保人已认真阅读并正确理解《家庭财产保险条款》和投保须知的各项内容，尤其是有关责任免除、投保单、被保险人义务的规定。<br />
		        3、本《投保单》是保险公司为您提供理赔及售后服务的重要依据，请您如实填写并仔细核对。如果有故意隐瞒事实、不履行如实告知义务的，本公司有权解除保险合同或不承担保险责任；对已支付的赔偿，本公司有权要求退还。<br />
		        4、根据《中华人民共和国合同法》第十一条规定，数据电文是合法的合同表现形式。本人接受以中国知领财产保险股份有限公司提供的电子保单作为本投保书成立的合法有效凭证，具有完全证据效力。<br />
		        5、本人授权知领公司，除法律另有规定之外，将本人提供给知领公司的信息、享受知领公司服务产生的信息（包括本单证签署之前提供和产生的信息）以及知领公司根据本条约定查询、收集的信息，用于知领公司及其因服务必要委托的合作伙伴为本人提供服务、推荐产品、开展市场调查与信息数据分析。本人授权知领公司，除法律另有规定之外，基于为本人提供更优质服务和产品的目的，向知领公司因服务必要开展合作的伙伴提供、查询、收集本人的信息。为确保本人信息的安全，知领公司及其合作伙伴对上述信息负有保密义务，并采取各种措施保证信息安全。本条款自本单证签署时生效，具有独立法律效力，不受合同成立与否及效力状态变化的影响。本条所称“知领公司”是指中国知领保险（集团）股份有限公司及其直接或间接控股的公司，以及中国知领保险（集团）股份有限公司直接或间接作为其单一最大股东的公司。如您不同意上述授权条款的部分或全部，可致电客服热线（95511）取消或变更授权。<br />
		                           本投保人确认我公司偿付能力信息：截止2017年二季度，我公司综合偿付能力充足率为245.43%，满足监管要求；我公司最近一期的风险综合评级结果为B类。
		        <div style="margin-left: 20px; font-size: 14px;">
		            <label class="checkbox">
		                <input type="checkbox" id="ok"/>我已阅读并同意以上条款
		            </label>
		        </div>
		    </div>
		    
		    <div style=" width: 700px;padding-left:320px;">
		        <ul class="menuzord-menu" > 
		            <li ><a href="<%=basePath%>product/listpro?type=2" style="color:coral">返回上一步</a></li>
		            <li >
		                <a style="color:crimson;" class="abc" onclick="sub()">立即支付</a>
		            </li>
		        </ul>       
		    </div>
	    </form> 
</div>
    
    <script type="text/javascript">
    var a=false;
    var b=false;
    var c=false;
    var d=false;
    var e=false;
    var f=false;
    var g=false;
    var h=false;
    var i=false;
       $(function(){
           $("#coverage").change(function(){
               var coverage = $("#coverage").val();
               if(coverage=='${pro.pro_quote[0].coverage}'){
                   $("#insured_amount").val('${pro.pro_quote[0].insured_amount}');
               }
               if(coverage=='${pro.pro_quote[1].coverage }'){
                   $("#insured_amount").val('${pro.pro_quote[1].insured_amount }');
               }
           });
       });
       
       function CityOne(){
           var pcode = $("#provinceOne").val();
           $("#cityOne option:not(:first)").remove();
           $.ajax({
               url:"<%=basePath%>insure/Province",
               type:"post",
               data:{"province_code":pcode},
               dataType:"json",
               success:function(data){
                   $.each(data,function(i,n){
                           $("#cityOne").append("<option value="+n.city_code+">"+n.city_name+"</option>");
                   });
               },
               error:function(data){
                   alert("请求失败");  
               }
           });
       }
       
       function CityTwo(){
           var pcode = $("#provinceTwo").val();
           $("#cityTwo option:not(:first)").remove();
           $.ajax({
               url:"<%=basePath%>insure/Province",
               type:"post",
               data:{"province_code":pcode},
               dataType:"json",
               success:function(data){
                   $.each(data,function(i,n){
                           $("#cityTwo").append("<option value="+n.city_code+">"+n.city_name+"</option>");
                   });
               },
               error:function(data){
                   alert("请求失败");
               }
           });
       }
       
       function abc(){
           var ins_name = $("#ins_name").val();
           var ins_id_card = $("#ins_id_card").val();
           var ins_tel = $("#ins_tel").val();
           var ins_email = $("#ins_email").val();
           var ins_city = $("#ins_city").val();
           var check = $("#check").prop("checked");
           if(check==true){
               $("#ass_name").val(ins_name);
               $("#ass_id_card").val(ins_id_card);
               $("#ass_tel").val(ins_tel);
               $("#ass_email").val(ins_email);
               $("#ass_city").val(ins_city);
               $("#f5").html("");
               $("#f6").html("");
               $("#f7").html("");
               $("#f8").html("");
               if(a && b && c && d){
                   e=true;
                   f=true;
                   g=true;
                   h=true;
               }
           }else{
               $("#ass_name").val("");
               $("#ass_id_card").val("");
               $("#ass_tel").val("");
               $("#ass_email").val("");
               $("#ass_city").val("");
           }
       }
       
       
     //正则表达式验证
      
           //用户名验证
          function insname(){
              a=false;
              var ins_name = $("#ins_name").val();
              var name=/^([\u4e00-\u9fa5]){2,7}$/;
              if(ins_name==null || ins_name==""){
                  $("#f1").html("名字不能为空").css({"color":"red","font-size":"5px"});
                  return;
              }
              if(!name.test(ins_name)){
                  $("#f1").html("名字只能为2-7位的中文").css({"color":"red","font-size":"5px"});
              }else{
                  $("#f1").html("输入正确").css({"color":"green","font-size":"5px"});
                  a=true;
              }
          }
           //身份证实名认证
           function card(){
               b=false;
               var card = $("#ins_id_card").val();
               var name = $("#ins_name").val();
               $.ajax({
                   url:"<%=basePath%>insure/insertIDCard",
                   type:"get",
                   data:{"realName":name,"cardNo":card},
                   dataType:"json",
                   success:function(data){
                      var falg=data.result.data.compareStatusDesc;
                      if("一致"==falg){
                          $("#f2").html("输入正确").css({"color":"green","font-size":"5px"});
                          b=true;
                      }else{
                          $("#f2").html("身份证号码和名字不匹配").css({"color":"green","font-size":"5px"});
                      }
                   },
                   error:function(data){
                       alert("请求失败");
                   }
               });
            };
           //电话号码验证
           function tel(){
               c=false;
               var ins_tel = $("#ins_tel").val();
               var tel=/^13[0-9]|14[5|7]|15([0-3]|[5-9])|18([0-3]|[5-9])\d{8}$/;
               if(ins_tel==null || ins_tel==""){
                   $("#f3").html("手机号码不能为空").css({"color":"red","font-size":"5px"});
                   return;
               }
               if(!tel.test(ins_tel)){
                   $("#f3").html("输入有误,只能输入十一位可用的手机号码").css({"color":"red","font-size":"5px"});
               }else{
                   $("#f3").html("输入正确").css({"color":"green","font-size":"5px"});
                   c=true;
               }
            };
           //邮箱验证
           function email(){
               d=false;
               var ins_email = $("#ins_email").val();
               var email=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
               if(ins_email==null || ins_email==""){
                   $("#f4").html("邮箱不能为空").css({"color":"red","font-size":"5px"});
                   return;
               }
               if(!email.test(ins_email)){
                   $("#f4").html("邮箱输入错误").css({"color":"red","font-size":"5px"});
               }else{
                   $("#f4").html("输入正确").css({"color":"green","font-size":"5px"});
                   d=true;
               }
            };
           
           //受保人正则表达式验证&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
           
               function nameOne(){
                   e=false;
                   var ins_name = $("#ass_name").val();
                   var name=/^([\u4e00-\u9fa5]){2,7}$/;
                   if(ins_name==null || ins_name==""){
                       $("#f5").html("名字不能为空").css({"color":"red","font-size":"5px"});
                       return;
                   }
                   if(!name.test(ins_name)){
                       $("#f5").html("名字只能为2-7位的中文").css({"color":"red","font-size":"5px"});
                   }else{
                       $("#f5").html("输入正确").css({"color":"green","font-size":"5px"});
                       e=true;
                   }
                };
            
         //身份证实名认证
          function cardOne(){
              f=false;
                   var card = $("#ass_id_card").val();
                   var name = $("#ass_name").val();
                   $.ajax({
                       url:"<%=basePath%>insure/insertIDCard",
                       type:"get",
                       data:{"realName":name,"cardNo":card},
                       dataType:"json",
                       success:function(data){
                    	   var falg=data.result.data.compareStatusDesc;
                           if("一致"==falg){
                              $("#f6").html("输入正确").css({"color":"green","font-size":"5px"});
                              f=true;
                          }else{
                              $("#f6").html("身份证号码和名字不匹配").css({"color":"red","font-size":"5px"});
                          }
                       },
                       error:function(data){
                           alert("请求失败");
                       }
                   });
                };
          //电话号码验证
          function telOne(){
              g=false;
              var ins_tel = $("#ass_tel").val();
              var tel=/^13[0-9]|14[5|7]|15([0-3]|[5-9])|18([0-3]|[5-9])\d{8}$/;
              if(ins_tel==null || ins_tel==""){
                  $("#f7").html("手机号码不能为空").css({"color":"red","font-size":"5px"});
                  return;
              }
              if(!tel.test(ins_tel)){
                  $("#f7").html("输入有误,只能输入十一位可用的手机号码").css({"color":"red","font-size":"5px"});
              }else{
                  $("#f7").html("输入正确").css({"color":"green","font-size":"5px"});
                  g=true;
              }
           };
        //邮箱验证
          function emailOne(){
              h=false;
              var ins_email = $("#ass_email").val();
              var email=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
              if(ins_email==null || ins_email==""){
                  $("#f8").html("邮箱不能为空").css({"color":"red","font-size":"5px"});
                  return;
              }
              if(!email.test(ins_email)){
                  $("#f8").html("邮箱输入错误").css({"color":"red","font-size":"5px"});
              }else{
                  $("#f8").html("输入正确").css({"color":"green","font-size":"5px"});
                  h=true;
              }
           };
        
              $("#ok").click(function(){
                  i=false;
                  var check = $("#ok").prop("checked");
                  if(check==true){
                      i=true;
                  }
              });
              
               function sub(){
                   insname();
                   card();
                   tel();
                   email();
                   nameOne();
                   cardOne();
                   telOne();
                   emailOne();
                   if(a &&  c && d && e &&  g && h && i){
                       $("#sum").submit();
                   }  
               };
        
    
    </script>                                
    
</body>
</html>














var vcode=1;
var a=false;
var b=false;
var tela=false;

$(function(){
	//ajax 登录
	var url=document.referrer;
	$("#login").click(function(){
		test1();
		test2();
		if(a&&b){
			$.ajax({
			url:"insure/insureLogin/"+$("#tel").val()+"/"+$("#pwd").val()+"/"+ $("#isno").prop("checked"),
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.msg){
					if($.trim(url)==''){
						location.href="/insure/index";
					}else{
						if(url.indexOf('localhost')==-1){
							location.href="/insure/index";
						}else if($.trim(url)=='http://localhost/jsp/Client/register.jsp')
						{
							location.href="/insure/index";
						}else{
							location.href=url;
						}
					}
				}else{
					//登录失败信息提示（用户名密码错误）
					$("#loginFont").html("用户名或密码错误!").css({"font-size":"5px","color":"red"});
				}
			},
			error:function(data){
				//$("#loginFont").text("请输入用户名和密码!");
			}
		});
		}
		
	});

	//获取短信验证码
	$("#message").click(function(){
		test3();
		if(tela){
			$.ajax({
				url:"insure/isexist/"+$("#tela").val(),
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.meg){
						$("#f1a").html("手机号码未注册").css({"font-size":"5px","color":"red"});
					}else{
						$.ajax({
							url:"insure/makemes/"+$("#tela").val(),
							type:"post",
							dataType:"json",
							success:function(data){
								alert(data);
								vcode=data.vcode;
								
							},
							error:function(data){
							}
						});
					}
				},
				error:function(data){
					
				}
			});
		}
		
		
	});
	//短信登录跳转页面
	
	$("#login1").click(function(){
		var c=$("#pwda").val();
		if(c==vcode){
			alert('短信登录成功');
		}else{
			$("#loginFonta").html("用户名或验证码错误!").css({"font-size":"5px","color":"red"});
		
		}
		
	});

});

function test1(){
	a=false;
	var tel=$("#tel").val();
	var tels=/^13[0-9]|14[5|7]|15([0-3]|[5-9])|18([0-3]|[5-9])\d{8}$/;
	if(tel==null || tel==""){
		//手机号码错误信息提示
		$("#f1").html("手机号码不能为空").css({"font-size":"5px","color":"red"});
		return;
	}
	if(!tels.test(tel)){
		$("#f1").html("输入有误,只能输入十一位可用的手机号码").css({"font-size":"5px","color":"red"});
		return;
	}else{
		$("#f1").html("");
		a=true;
	
	}
}
function test2(){
	b=false;
	var pwd=$("#pwd").val();
	var pad=/^[A-Za-z\d]{1,6}$/;
	if(pwd==null || pwd==""){
		//密码错误信息提示
		$("#f3").html("密码不能为空").css({"font-size":"5px","color":"red"});
		return;
	}
	if(!pad.test(pwd)){
		$("#f3").html("输入有误,密码只能输入六位数的数字和英文组合").css({"font-size":"5px","color":"red"});
	}else{
		$("#f3").html("");
		b=true;

	}
}
function test3(){
	tela=false;
	var tel=$("#tela").val();
	var tels=/^13[0-9]|14[5|7]|15([0-3]|[5-9])|18([0-3]|[5-9])\d{8}$/;
	if(tel==null || tel==""){
		$("#f1a").html("手机号码不能为空").css({"font-size":"5px","color":"red"});
		return;
	}
	if(!tels.test(tel)){
		$("#f1a").html("输入有误,只能输入十一位可用的手机号码").css({"font-size":"5px","color":"red"});
	}else{
		$("#f1a").html("");
		tela=true;
		
	}
}

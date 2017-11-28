var a=false;
var b=false;
var c=false;
$(function(){
	
	//ajax注册
	$("#bt").click(function(){
		
		if(a&&b&&c){
			$.ajax({
				url:"insure/register/",
				type:"post",
				
				data:{"ins_tel":$('#tel').val(),"ins_pwd":$('#pwd').val(),
					"rand":$('#rd').val()},
				dataType:"json",
				success:function(data){
					if(data.meg){
						location.href="http://localhost/insure/login";
					}else{
						$("#f5").html("输入信息不正确").css({"font-size":"5px","color":"red"});
					}
				},
				error:function(data){
					
				}
			});
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
		$.ajax({
			url:"insure/isexist/"+$("#tel").val(),
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.meg){
					$("#f1").html("");
					a=true;
				}else{
					$("#f1").html("该账户已存在").css({"font-size":"5px","color":"red"});
				}
			},
			error:function(data){
				
			}
		});
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
	c=false;
	var apwd=$("#apwd").val();
	var pwd=$("#pwd").val();
	if(pwd==apwd){
		//密码错误信息提示\
		$("#f4").html("");
		c=true;
		return;
	}else{
		$("#f4").html("前后密码不一致").css({"font-size":"5px","color":"red"});
		

	}
}
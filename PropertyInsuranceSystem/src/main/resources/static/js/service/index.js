$(function(){
	
	//ajax 登录
	$("#login").click(function(){
		$.ajax({
			url:"emp/login/" + $("#userName").val() + "/" + $("#pwd").val(),
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.mess){
					//1 业务员
					if("1" == data.position){
						location.href="jsp/cl/main.jsp";
					}else if("2" == data.position){
						//2 经理
						location.href="jsp/ws/w_main.jsp"
					} else if("3" == data.position){
						//人事
						location.href="jsp/service/personnel/index.jsp";
					} else if("4" == data.position){
						//超级管理员
						location.href="jsp/sjh/main.jsp";
					}
				}else{
					$("#loginError").text("用户名或密码错误!");
				}
			},
			error:function(data){
				$("#loginError").text("请输入用户名和密码!");
			}
		});
		return false;
	});
	
});
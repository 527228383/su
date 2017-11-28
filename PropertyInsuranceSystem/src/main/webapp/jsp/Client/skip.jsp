<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付成功跳转页面</title>
    <script type="text/javascript"> 
    function countDown(secs,surl)
    { 
        var jumpTo = document.getElementById('jumpTo');
    	jumpTo.innerHTML=secs; 
    	if(--secs>0)
    	{ 
    		setTimeout("countDown("+secs+",'"+surl+"')",1000); 
    	}
    	else
    	{  
    		location.href=surl; 
    	} 
    } 
</script>
</head>
<body>
    <div align="center">
	    <h1 style=" color: red">支付成功</h1>
	    <span id="jumpTo">5</span>秒后跳转页面...........
    </div>

	<script type="text/javascript">
        countDown(5,'http://localhost/product/listpro?type=2');
	</script> 
</body>
</html>
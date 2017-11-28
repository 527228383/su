<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title></title>
<script type="text/javascript"></script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
		$(function(){
			/* 全选一 */
			/* $("#chekall").click(function(){
				$("input[name='chekone']").attr("checked",$("#chekall").prop("checked"));
			}); */
			/* 全选二 */
			$("#chekall").click(function(){
				$("input[name='ids']").prop('checked',this.checked);
			});
			/* 删除选中产品 */
			var flag;
			$("#del_pro").click(function(){
				/* 批量删除时,判断是否有选中的复选框,如果没有则不能删除 */
				$("input[name='ids']:checkbox").each(function(){
					if($(this).attr("checked")){
						falg=true;
					}
				});
				if(falg){
					$("#table").submit();
				}
				
			}); 
		})
		
		/* 分页跳转 */
		$(function(){
			var currentPage=parseInt($("#currentPage").val());//当前页码
			var totalPage=parseInt($("#totalPage").val());//总页码数
			if(currentPage<=1){
				$("#firstPage").prop("disabled","disabled");
				$("#prevPage").prop("disabled","disabled");
			};
			if(currentPage>=totalPage){
				$("#nextPage").prop("disabled","disabled");
				$("#lastPage").prop("disabled","disabled");
			};
			$("#firstPage").click(function(){//首页
				$("#currentPage").val(1);
				$("#page").submit();
			});
			$("#prevPage").click(function(){//上一页
				$("#currentPage").val(currentPage-1);
				$("#page").submit();
			});
			$("#nextPage").click(function(){//下一页
				$("#currentPage").val(currentPage+1);
				$("#page").submit();
			});
			$("#lastPage").click(function(){//尾页
				$("#currentPage").val(totalPage);
				$("#page").submit();
			});
			$("#goto").click(function(){//跳转页码
				var gotoPage=parseInt($("#gotoPage").val());
				if(gotoPage>totalPage || gotoPage<=0){
					alert("请输入正确的页码!");
					return;
				}
				$("#currentPage").val($("#gotoPage").val());
				$("#page").submit();
			});
		});
	
	
</script>
</head>
	<body>
		<h1>产品列表</h1>
		<h2>欢迎${sessionScope.employee.emp_name }登录</h2>
		<form action="product/listpro?type=1" method="post" id="page">
			<input type="hidden" name="currentPage" id="currentPage" value="${pageUtil.currentPage}"/>
			<input type="hidden" name="totalPage" id="totalPage" value="${pageUtil.totalPage}"/>
		</form>
		<div>
		
		<form action="product/deleteProducts" method="get" id="table">
			<table align="center" bordercolor="#000" border="2" bgcolor="#abb" >
				<tr>
					<td><input type="checkbox" id="chekall" >产品编号</td>
					<td>产品名称</td>
					<td>保障项目</td>
					<td>保障范围</td>
					<td>保障期限</td>
					<td>购买金额</td>
					<td>赔付金额</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${products}" var="p">
					<tr>
						<td >
							<input type="checkbox" name="ids" value="${p.id}">${p.id}
						</td>
						<td>${p.pro_name }</td>
						<td>${p.pro_program }</td>
						<td>${p.pro_scope }</td>
						<td>${p.pro_time }</td>
						
						<c:forEach items="${p.pro_quote }" var="quote">
							<td>${quote.coverage }</td>
							<td>${quote.insured_amount }</td>
						</c:forEach>
						<td>
							<a href="/product/selectById?id=${p.id}"><button type="button" id="update">修改</button></a>
							<a href="/product/deleteProducts?ids=${p.id}"><button type="button"  onClick="return confirm('确认要删除？')">删除</button></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		</div>
		<br>	
		<div align="center">
		 	<a href="<%=basePath%>jsp/service/addPro.jsp"><button type="button">添加</button></a>
		 	<button type="button" id="del_pro"  onClick="return confirm('确认要删除？')">删除</button>
			<input type="button" id="firstPage" value="首页"/>&nbsp;&nbsp;
			<input type="button" id="prevPage" value="上一页"/>&nbsp;&nbsp;
			<input type="button" id="nextPage" value="下一页"/>&nbsp;&nbsp;
			<input type="button" id="lastPage" value="尾页"/>&nbsp;&nbsp;
			当前<font color="red">${pageUtil.currentPage}</font>/<font color="red">${pageUtil.totalPage}</font>页&nbsp;&nbsp;
			共<font color="red">${pageUtil.rowSize}</font>条数据
			<input type="text" id="gotoPage" size="3">
			<input type="button" id="goto" value="跳转"><p>
		</div>
	</body>
</html>















<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<script src="js/jquery-1.8.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>流程管理页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/service/sjh/H-ui.min.css" rel="stylesheet" />
<style type="text/css">
	#deploy{
		margin-left: 20px;
	}
	body{
		font-size: 18px;
	}
	.breadcrumb{
		margin-left: 5px;
	}
	#deployTbl{
		margin-top: 5px;
		width: 500px;
	}
	.file {
	    position: relative;
	    display: inline-block;
	    background: #D0EEFF;
	    border: 1px solid #99D3F5;
	    border-radius: 4px;
	    padding: 4px 12px;
	    overflow: hidden;
	    color: #1E88C7;
	    text-decoration: none;
	    text-indent: 0;
	    line-height: 20px;
	}
	.file input {
	    position: absolute;
	    font-size: 100px;
	    right: 0;
	    top: 0;
	    opacity: 0;
	}
	.file:hover {
	    background: #AADFFD;
	    border-color: #78C3F3;
	    color: #004974;
	    text-decoration: none;
	}
	#dBtn{
		background: #a1a1a1;
		border: none;
		padding: 10px 25px 10px 25px;
		color: #FFF;
		box-shadow: 1px 1px 5px #B6B6B6;
		border-radius: 7px;
		text-shadow: 1px 1px 1px #9E3F3F;
		cursor: pointer;
		border:1px solid #c8cccf;
	}
	#btnGo{
		background: rgb(212,231,240);
		border: none;
		padding: 3px 7px;
		color: black;
		box-shadow: 1px 1px 5px #B6B6B6;
		border-radius: 10px;
		text-shadow: 1px 1px 1px #9E3F3F;
		cursor: pointer;
		border:1px solid #c8cccf;
	}
</style>
</head>
<body>
<div class="Hui-article-box">
	<div class="breadcrumb"> 首页 <span class="c-gray en">&gt;</span> 流程管理 <span class="c-gray en">&gt;</span> 流程管理 </div>
	<div class="Hui-article">
		<div id="deploy">
			<form id="deploy_form" action="act/deployProcess" method="post" enctype="multipart/form-data">
				<table id="deployTbl" class="table table-border table-bordered table-hover table-bg">
					<tr style="background-color: rgb(245,250,254)">
						<th colspan="3">流程部署</th>
					</tr>
					<tr>
						<td>流程名称</td>
						<td>
							<font id="nameMess" color="red" size="2"></font><br/>
							<input class="input-text" type="text" id="processName" name="processName" />
						</td>
					</tr>
					<tr>
						<td>文件(zip 文件类型)</td>
						<td>
							<font id="zipMess" color="red" size="2"></font><br/>
							<a href="javascript:;" class="file">选择文件
							    <input type="file" name="zipFile" id="zipFile">
							</a>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="部署" id="dBtn"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="cl pd-20">
			<div class="cl pd-5 bg-1 bk-gray"> <span class="l"> <a id="delAllDeploy" href="javascript:;" onclick="datadel()" class="btn btn-danger radius"> 批量删除</a></span></div>
			<div class="mt-10">
			<form action="act/deleteProcess" method="post" id="deployForm">
				<table id="processTbl" class="table table-border table-bordered table-hover table-bg">
					<thead>
						<tr>
							<th scope="col" colspan="7">流程定义管理</th>
						</tr>
						<tr class="text-c">
							<th width="25"><input type="checkbox" id="allDeploy"></th>
							<th width="50">流程 ID</th>
							<th>流程名称</th>
							<th width="160">key</th>
							<th width="90">部署时间</th>
							<th width="50">版本</th>
							<th width="110">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.deployProcess }" var="deploy">
							<tr>
								<td><input type="checkbox" value="${deploy.id }" name="deployId" class="depCheckBox"></td>
								<td>${deploy.id }</td>
								<td>${deploy.name }</td>
								<td>${deploy.key }</td>
								<td>
									<fmt:formatDate value="${deploy.time }" pattern="yyyy-MM-dd"/>
								</td>
								<td>${deploy.version }</td>
								<td>
									<a href="act/viewProcessDefinition/${deploy.id }">查看流程图</a>
									<a href="act/deleteProcess?deployId=${deploy.id }" name="deleDeploy" class="delOne">删除</a>
								</td>
							</tr>
						</c:forEach>
						<c:if test="${requestScope.deployProcess == null }">
							<tr>
								<td>
									<font color="red" size="3">暂时没有流程定义列表</font>
								</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</form>
			</div>
		</div>
		<hr/>
		<div align="center" id="pageDiv">
			<a href="act/listProcessDefinitionDto/1">首页</a>
			<c:if test="${pageUtil.currentPage > 1}">
				<a href="act/listProcessDefinitionDto/${pageUtil.currentPage - 1 }">上一页</a>
			</c:if>
			<c:if test="${pageUtil.totalPage > 0 }">
				<c:forEach begin="1" end="${pageUtil.totalPage }" var="num">
					<c:if test="${pageUtil.currentPage == num }">
						<font color="red">${num }</font>
					</c:if>
					<c:if test="${pageUtil.currentPage != num }">
						<a href="act/listProcessDefinitionDto/${num }">${num }</a>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${pageUtil.currentPage < pageUtil.totalPage}">
				<a href="act/listProcessDefinitionDto/${pageUtil.currentPage + 1 }">下一页</a>
			</c:if>
			<a id="lastPage" name="${pageUtil.totalPage }" href="act/listProcessDefinitionDto/${pageUtil.totalPage }">尾页</a> <font color="#666666">当前${pageUtil.totalPage == 0 ? 0 : pageUtil.currentPage}/${pageUtil.totalPage }页</font>
			<input type="text" id="goPage" size="1" style="height: 20px; width: 24px;"/>
			<input type="button" value="Go" id="btnGo"/>
		</div>
	</div>
</div>
</body>
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			//单删
			$(".delOne").click(function(){
				if(!confirm("确定要删除该流程定义吗?")){
					return false;
				}
			});
			
			// 全删
			$("#delAllDeploy").click(function(){
				var count = 0;
				$("input[name='deployId']").each(function(){
					if($(this).prop("checked")){
						count += 1;
					}
				});
				if(count > 0){
					if(confirm("确认要删除选中的流程定义吗?")){
						$("#deployForm").submit();
					}
				}else{
					alert("请选择要删除的流程定义!");
				};
			});
			
			$(".depCheckBox").click(function(){
				var flag = true;
				$(".depCheckBox").each(function(){
					if(!$(this).prop("checked")){
						flag = false;
					}
				});
				$("#allDeploy").prop("checked", flag);
			});
			
			//全选
			$("#allDeploy").click(function(){
				$(".depCheckBox").prop("checked", $("#allDeploy").prop("checked"));
			});
			
			// 部署
			$("#dBtn").click(function(){
				var $processName = $.trim($("#processName").val());
				var $zipFile = $.trim($("#zipFile").val());
				var $pro = false;
				var $zip = false;
				if($processName == ""){
					$("#nameMess").text("请输入流程名称");
					$pro = false;
				}else{
					$pro = true;
				}
				if($zipFile == ""){
					$("#zipMess").text("请选择上传文件");
					var $zip = false;
				}else{
					if($zipFile.substring($zipFile.lastIndexOf(".") + 1) == "zip"){
						var $zip = true;
					}else{
						alert("上传文件类型不匹配!");
					}
				}
				if($pro && $zip){
					$("#deploy_form").submit();
				}
			});
			
			// go
			$("#btnGo").click(function(){
				var $page = $.trim($("#goPage").val());
				if($page != ""){
					if($page <= $("#lastPage").attr("name")){
						location.href = "act/listProcessDefinitionDto/" + $page;
					}else{
						alert("输入页码不合理,请重新输入!");
					}
				}else{
					alert("请输入页码!");
				}
			});
			
			// 上下页
			/* $("#pageDiv a").click(function(){
				var $page = $.trim($(this).attr("name"));
				if($page != ""){
					$.ajax({
						url: "act/listProcessDefinitionDto/" + $page,
						type: "json",
						dataType: "json",
						success: function(data){
							$("#processTbl tr:gt(1)").remove();
							var $tr = "";
							$.each(data.list,function(i,n){
								var date=new Date(n.time);
								var setDate=date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0"+date.getDate()).slice(-2);
								$tr += "<tr>" +
											"<td><input type='checkbox' name='ids' value='" + n.id + "' /></td>" +
									  		"<td>" + n.id + "</td>" +
									  		"<td>" + n.name + "</td>" +
									  		"<td>" + n.key + "</td>" +
									  		"<td>" + setDate + "</td>" +
									  		"<td>" + n.version + "</td>" +
									  		"<td><a name='deleDeploy' id='" + n.id + "'>删除</a></td>" +
									  "</tr>"
							})
							$("#processTbl").append($tr);
							alert(data.page);
							$("#pageDiv").empty().append(data.page);
						}
					})
				}
			}); */
		})
	</script>
</html>
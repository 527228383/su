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
<title>产品详细信息页面</title>
<link rel="stylesheet" href="css/style.css">

    <style>
        .container-small{
            max-width: 900px;
        } 
        #tab td{
            font-size: x-small;
            max-width: 300px;
            font-weight: 200;
        }
        #tab th{
            font-size: small;
        }
        #tab2 td{
            font-size: x-small;
            max-width: 300px;
        }
        #tab2 th{
            font-size: small;
        }   
        #lab span{
            font-size: small;
        }
        #wen span{
            font-size: x-small;
        }
        #wen label{
            font-size: small;
        }
    </style>
</head>
<body>
<div class="boxed_wrapper">
    <header class="top-bar">
        <div class="container">
            <div class="clearfix">
                <ul class="top-bar-text float_left">
                    <li><i class="icon-technology-1"></i>Phone +123-456-7890</li>
                    <li><i class="icon-note"></i>Mail@Fortuneteam.com</li>
                    <li><i class="icon-world"></i>Apple St, New York, NY 10012, USA</li>
                </ul>
                <ul class="social float_right">
                    <li><a href="#"></a></li>
                </ul>
            </div>
        </div>
    </header>
    <div style=" margin: 20px 150px; font-size: 14px">
        <a href="<%=basePath%>jsp/Client/index.jsp">首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;
        <a href="<%=basePath%>product/listpro?type=2">产品展示</a>&nbsp;&nbsp;>&nbsp;&nbsp;
        <a>详细信息</a>
    </div>
    <br /><br /><br />
    <div class="container container-small">
        <div  >
            <div class="col-xs-6">
                <img style="max-width: 437px;max-height: 307px;" src="images/shop/baox.png" />
            </div>
            <div class="col-xs-6">
                <br /><br />
                <label>会员价:<span style="color: red;font-size:x-large;">¥${product.pro_quote[0].coverage }</span>起</label>
                <br /><br /><br />
                <label style="color: orangered;">产品特色</label>
                <p style="font-size: small;">
                    1、保障您居住的房屋及室内财产，无论是台风、暴雨、雷击等
                    自然风险，还是火灾、爆炸、盗抢等风险都可保障。<br />
                    2、保障内容及金额可以自由选择，在线预约简单快捷。
                </p>
                <br />
                <div>
                    <a href="<%=basePath%>insure/selectQuote?id=${product.id}"><input class="btn btn-danger" type="button"  value="立即报价"/></a>
                </div>
            </div>
        </div>
    </div>
        
        <br /><br /><br />
    <div class="container container-small">
        <p style="color: orangered;font-size: medium;">产品详情</p>
    </div>
        <br />
        <!--产品详情 -->
       <div class="container container-small">
            <div>
                <table id="tab" class="table">
                    <thead>
                        <tr>
                            <th>保障项目</th>
                            <th>保险金额</th>
                            <th>保障范围</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${product.pro_program }</td>
                            <td>
                                 <c:forEach items="${product.pro_quote }" var="pro" varStatus="i">
                                       ${pro.coverage}&nbsp;
                                       <c:if test="${i.count<2}">—</c:if>
                                  </c:forEach>
                                                                                  元
                            </td>
                            <td >${product.pro_scope }</td>
                        </tr>
                    </tbody>
                </table>
                
            </div>
       </div>
        
        <br /><br /><br />
        <div class="container container-small">
            <p style="color: orangered;font-size: medium;">常见问题</p>
        </div>
        <br />
        
            <!-- 常见问题-->
                <div class="container container-small">
                    <div id="wen">
                    <div >
                        <label>问:</label>&nbsp;<span>1、房产证写的是我父母的名字，房子是自己和家人在住，是否可以买此保险？所有家人可以作为受益人么？</span><br />
                        <label>答:</label>&nbsp;<span>可以投保，在此情况下，建议被保险人写父母的名字。</span>
                    </div>
                    <div>
                        <label>问:</label>&nbsp;<span>2、房产证写的是我父母的名字，房子是自己和家人在住，是否可以买此保险？所有家人可以作为受益人么？</span><br />
                        <label>答:</label>&nbsp;<span>可以投保，在此情况下，建议被保险人写父母的名字。</span>
                    </div>
                    <div>
                        <label>问:</label>&nbsp;<span>3、房产证写的是我父母的名字，房子是自己和家人在住，是否可以买此保险？所有家人可以作为受益人么？</span><br />
                        <label>答:</label>&nbsp;<span>可以投保，在此情况下，建议被保险人写父母的名字。</span>
                    </div>
                    </div>
                </div>
            
            <br /><br /><br />
        <div class="container container-small">
            <p style="color: orangered;font-size: medium;">客户评价</p>
        </div>
        <br />
        
            <!-- 客户评价-->
            <div class="container container-small">
                <div id="lab">
                    <label class="radio-inline">
                        <span>全部</span>
                    </label>
                    <label class="radio-inline">
                        <span>好评(${mag.one })</span>
                    </label>
                    <label class="radio-inline">
                        <span>中评(${mag.two })</span>
                    </label>
                    <label class="radio-inline">
                        <span>差评(${mag.three })</span>
                    </label>
                </div>
                <br />
                <div>
                    <table id="tab2" class="table">
                        <thead>
                            <tr>
                                <th>评论人</th>
                                <th>内容</th>
                                <th>评论时间</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listComment }" var="comment" varStatus="i">
	                            <tr>
	                                <td>${i.index+1 }楼</td>
	                                <td>${comment.content }</td>
	                                <td><fmt:formatDate value="${comment.com_date }" pattern="yyyy-MM-dd"/></td>
	                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        
        
        
        <br /><br />
        <div class="container container-small">
            <label style="color: orangered;">特别提醒</label>
            <p style="font-size: small;">
                1、本保险不承保由地震、海啸造成的房屋损失。<br />
                2、本保险不承保村房、农民房等小产权房或用于生产经营的房屋。<br />
                3、本保险每一被保险房屋限投一份，多投无效。
            </p>
        </div>
        <br /><br />
        <div class="container container-small">
            <label style="color: orangered;">隐私保护声明</label>
            <p style="font-size: small;">
                您提供的个人信息、数据和隐私我们不会提供给任何未获授权的第三方。
            </p>
        </div>
        
        <div style="height: 80px;"></div>
</div>
</body>
</html>
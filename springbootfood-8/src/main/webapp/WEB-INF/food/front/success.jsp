<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>

<base href="<%=basePath%>">
<meta charset="UTF-8"/>
<title>Insert title here</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="resources/bower_components/jqueryui/themes/sunny/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.min.js">
	</script>
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.min.js">
	</script>
	<script type="text/javascript" src="resources/bower_components/jqueryui/jquery-ui.min.js">
	</script>
<style type="text/css">

}
</style>

</head>
<body onload="countDown()">
<div class="container-fluid">
		<!-- 主页导航栏 -->
		<div class="row">
			<div class="col-md-12">
				<!-- 静态包含，侧边栏qq模块 -->
						<nav class="navbar navbar-expand-lg navbar-light static-top">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#bs-example-navbar-collapse-1">
		<span class="navbar-toggler-icon"></span>
	</button>
	<a class="navbar-brand" href="#">Brand</a>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link"
				href="front/toMain" style="color: white;">首页</a></li>
			<li class="nav-item"><a class="nav-link"
				href="front/productInfoList" style="color: white;">美食等你来</a></li>
			<li class="nav-item"><a class="nav-link"
				href="front/shopingCart" style="color: white;">我的购物车</a></li>
			<li class="nav-item"><a class="nav-link" href="front/order" style="color: white;">我的订单</a></li>
			<li class="nav-item"><a class="nav-link" href="front/orderpay" style="color: white;">订单结算</a></li>
		
		</ul>

		
		<ul class="navbar-nav ml-md-auto">
			<li class="nav-item active">
			<c:choose>
			<c:when test="${empty buyer.buyerName }">
			   <a href="front/toLogin" style="text-decoration: none"><span style="color: white">亲爱的用户，请登录</span></a>
			</c:when>
			<c:otherwise>
			<span style="color: white;">欢迎&ensp;
					[${buyer.buyerName }]&ensp;登录 </span> <a href="front/exit"
				style="text-decoration: none; color: white"><span>&nbsp;&nbsp;退出</span></a>
			</c:otherwise>
			</c:choose>
			</li>
			<li class="nav-item dropdown"></li>
		</ul>
	</div>
</nav>
			</div>
		 </div>
		 <div class="row mx-auto" style="width:40% ;margin-top: 15%">
			 <div class="">
                       <h4> 恭喜您支付成功!
                         <span id="time" style="color: red;">5</span>秒后跳转到订单界面
                       </h4>
                       <p>
                        <img style="margin-left: 20%" src="resources/image/duihao/duihao.png"/>
             </div>
          </div>
          
	 
</div>
<script type="text/javascript" >
 /* *********start****** */
 //订单成功后通知商家
	var websocket = null;
		window.onload=function() {
			
			if ('WebSocket' in window) {
				websocket = new WebSocket("ws://localhost:8080/food/chatDemo/"
						+ 1+"${sessionScope.seller.username}");
			} else {
				alert('Not support websocket');
			}
			//连接发生错误的回调方法
			websocket.onerror = function() {
				
			};

			//连接成功建立的回调方法
			websocket.onopen = function(event) {
				
			}

			//接收到消息的回调方法
			websocket.onmessage = function(event) {
				
			}

			//连接关闭的回调方法
			websocket.onclose = function() {
				
			}

			//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
			window.onbeforeunload = function() {
				websocket.close();
			}
			
		}
		
/* *********end****** */
 /******页面跳转定时器start*********/
  var t = 5; 
 function countDown(){ 
   if (t<=0) { 
   location.href="front/order"; 
   clearInterval(inter); 
   }; 
   document.getElementById("time").innerHTML=t; 
   t--; 
} 
var inter = setInterval("countDown()",1000);  
/******页面跳转定时器end*********/
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<%@include file="common/nav.jsp"%>
			</div>
		 </div>
		 <div class="row mx-auto" style="width:40% ;margin-top: 15%">
			 <div class="">
                       <h4> 对不起!支付失败!
                         <span id="time" style="color: red;">5</span>秒后跳转到订单界面
                       </h4>
                       <p>
                        <img style="margin-left: 20%" src="resources/image/cuohao/cuohao.jpg"/>
             </div>
          </div>
</div>
<script type="text/javascript">
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
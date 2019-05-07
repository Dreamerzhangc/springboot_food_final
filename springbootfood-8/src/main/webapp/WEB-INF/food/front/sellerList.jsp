<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>

<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>商家列表</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bower_components/jeasyui/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css" />
<!-- 鼠标悬停显示 -->
<style type="text/css">
html, body {
	position: relative;
	background-color: #F5F5F5
}

.redhert {
	font-size: 25px;
	color: #ccc;
	cursor: pointer;
}

.cs {
	color: #f00;
}

.menu  div {
	list-style-type: none;
	display: none;
	position: relative;
	width: 320px;
	height: 150px;
	background-color: rgba(239, 239, 239, 0.8)
}

.menu:hover  div {
	display: block;
	z-index: 1000
}

.navbar {
	background-color: #FF0000;
}

.restauart:hover div {
	background-color: #FF0000;
	border: 1px solid yellow;
}
</style>

</head>
<body>
	<!-- 锚点 -->
	<a id="1"></a>

	<div class="container-fluid mx-auto">

		<!-- 主页导航栏 -->
		<div class="row">
			<div class="col-md-12">
				<!-- 静态包含，侧边栏qq模块 -->
				<%@include file="common/nav.jsp"%>
			</div>
		</div>
		<!-- 主页导航栏 end -->
		<!-- 中间部分 -->
		<div class="row mx-auto " style="width: 80%">
			<!-- 顶部导航栏设计 -->
			<div class="row mx-auto text-center"
				style="border: 1px solid red; width: 90%; height: 100px; background-color: #f0f8ff; margin-bottom: 20px">

				<div
					style="padding-left: 40px; padding-right: 15px; padding-top: 15px; border: px solid white;">
					<h5 class="text-left" style="color: block;">商家分类：</h5>
					<span style="padding-left: 80px"> 西餐厅 </span><span
						style="padding-left: 20px"> 日韩料理 </span><span
						style="padding-left: 20px"> 东南亚菜 </span> <span
						style="padding-left: 20px">东北菜</span> <span
						style="padding-left: 20px">川菜</span><span>火锅</span><span
						style="padding-left: 20px">地方小吃</span><span
						style="padding-left: 20px">烧烤</span>
				</div>
				<div style="margin-top: 18px;margin-left: 80px">
				<form class="form-inline">
					<input class="form-control mr-sm-2" type="text" placeholder="搜索美食，商家"/>
					<button class="btn btn-primary my-2 my-sm-0" type="submit" >
						搜索</button>
				</form>
				</div>
				
			</div>
			<!-- 顶部导航栏设计结束 -->

			<!-- 中间模块 -->
			<!-- 展示商家信息 -->
			<div class="row mx-auto text-center "
				style="border: 1px solid red; width: 90%; background-color: rgb(0, 137, 220);">

				<c:forEach var="i" begin="1" end="12" step="1">
					<div class="card col-md-3 restauart"
						style="padding: 8px; background-color: #f0f8ff">

						<!-- 添加转到购物车的url -->
						<a href="front/productInfoList"> <img class="card-img-top"
							src="resources/image/front/food_001.jpg" alt="Card image cap"
							title="进店转转" style="height: 140px; width: 200px">
						</a>
						<!-- <div class="card-body">
						<h6 class="card-title">
						<span style="color: red">西餐厅</span>
						酸辣土豆</h6>
					</div> -->
					</div>
				</c:forEach>

			</div>



		</div>
		<!-- 右边模块结束 -->

		<!-- 底部版权 -->
		<div class="row mx-auto card"
			style="height: 100px; background-color: #e5e5e5; line-height: 100px">
			<!-- 静态包含，底部版权模块 -->
			<%@include file="common/copyright.jsp"%>
		</div>




		<!-- js文件放在最后面，提高网页响应速度 -->
		<script type="text/javascript"
			src="resources/bower_components/jquery/dist/jquery.js"></script>
		<script type="text/javascript"
			src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
		<script type="text/javascript"
			src="resources/bower_components/jeasyui/jquery.easyui.min.js"></script>
		<script type="text/javascript">
			/* 点击取消指定的class行为 */
			$(function() {
				/* 点击取消红心指定的class行为 */
				$(".redhert").click(function() {
					$(".redhert").toggleClass("cs");
				})

			});
		</script>
		<script type="text/javascript">
			$(function() {

				//对模态对话框配置
				$("#msgDialog").modal({
					backdrop : 'static',//否则你点击对话框外的部分就消失
					show : false
				//默认是显示的
				});

			});
			//客户提议
			function customermsg(event) {
				$("#msgDialog").modal('show');//显示
				$("#msgDialog button.btn_submit").one("click", function() {
					$("#msgDialog").modal('hide');//隐藏

				});

			}
		</script>
</body>
</html>
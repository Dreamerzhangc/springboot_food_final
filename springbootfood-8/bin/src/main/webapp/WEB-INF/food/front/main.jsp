<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>主页</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bower_components/jeasyui/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css" />
<!-- 鼠标悬停显示 -->
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	text-align: center;
	
}

.menu ul {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
	display: none;
}

.menu:hover ul {
	display: block;
}
.navbar{

background-color:#FF0000;
}

</style>

</head>
<body style="background-color:;">
	<!-- 锚点 -->
	<a id="1"></a>

	<div class="container-fluid mx-auto" style="padding: 0px;">

		<!-- 主页导航栏 -->
		<div class="row">
			<div class="col-md-12">
				<!-- 静态包含，侧边栏qq模块 -->
				<%@include file="common/nav.jsp"%>
			</div>
		</div>
		<!-- 主页导航栏 end -->
		<div class="row mx-auto " style="width: 90%;margin-top: 5px;">
			<!-- 左边模块 -->
			<div class="col-md-2"  style="background-color: #f5f5f5 ;">
				<div class="row" style="background-color: rgb(0, 137, 220);">
						
						
					  <div class="col-12" style="padding: 0px;">
					  	<div style="height: 60px;color: white;line-height: 60px;">菜系类型</div>
					    <div class="list-group" >
						  <c:forEach items="${productTypes }" var="type">
						  <a href="front/productInfoList?productType=${type.id }" class="list-group-item list-group-item-action" style="background-color:rgb(0, 137, 220);color: white; ">${type.typeName}</a>
						  </c:forEach>
						 
						</div>
					  </div>
					
					<hr/>
				</div>
				
			</div>
			<!-- 右边模块中间模块 -->

			<div class="col-md-9" style="padding: 0px;">
				<div class="card-group">

					<div class="container-fluid">
						<div class="row" >
							<div class="col-md-12" style="padding: 0px;">
								<div class="carousel slide" id="carousel-656103">
									<ol class="carousel-indicators">
										<li data-slide-to="0" data-target="#carousel-656103"
											class="active"></li>
										<li data-slide-to="1" data-target="#carousel-656103"></li>
										<li data-slide-to="2" data-target="#carousel-656103"></li>
									</ol>
									<div class="carousel-inner">
										
										<div class="carousel-item active">
											<img class="d-block w-100" alt="Carousel Bootstrap Second" src="resources/image/front/ms1.jpg" style="height: 400px;"/>
											<div class="carousel-caption">
												<h4>西式甜点</h4>
												<p></p>
											</div>
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" alt="Carousel Bootstrap Third" src="resources/image/front/ms2.jpg" style="height: 400px;"/>
												
											<div class="carousel-caption">
												<h4>谷物</h4>
												<p></p>
											</div>
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" alt="Carousel Bootstrap Third" src="resources/image/front/ms3.jpg" style="height: 400px;"/>
												
											<div class="carousel-caption">
												<h4>饮品</h4>
												<p></p>
											</div>
										</div>
									</div>
									<a class="carousel-control-prev" href="#carousel-656103" data-slide="prev">
										<span class="carousel-control-prev-icon"></span>
										<span class="sr-only">Previous</span>
									</a> 
									<a class="carousel-control-next" href="#carousel-656103" data-slide="next">
										<span class="carousel-control-next-icon"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
							</div>
						</div>
					</div>
					<hr/>
					
					<!-- 推荐开始 -->
					<div class="container-fluid">
						<div class="row" >
							<div class="col-md-12" style="padding: 0px;">
								<div style="margin-top: 5px;">
									<div class="alert alert-info" role="alert" style="margin: 0px;background-color: rgb(0, 137, 220);color: white;"><h4>推荐菜品</h4></div>
									<!-- 查询店家所推出的菜品的内容 -->
									<div class="card-group" >
									  <div class="card" style="padding: 8px;background-color: #f0f8ff;">
									  
							<!-- 添加转到购物车的url -->
									  	<a href="front/productInfoList">
									    	<img class="card-img-top" src="resources/image/front/food_001.jpg" alt="Card image cap" title="进店转转" style="height: 200px;">
									     </a>
									    <div class="card-body">
									      <h5 class="card-title">酸辣土豆丝</h5>
									    </div>
									   
									  </div>
									  
									   <div class="card" style="padding: 8px;background-color: #f0f8ff;">
									   <a href="front/productInfoList">
									    <img class="card-img-top" src="resources/image/front/food_002.jpg" alt="Card image cap" title="进店转转" style="height: 200px;">
									   </a> 
									    <div class="card-body">
									      <h5 class="card-title">黄焖莲菜</h5>
									    </div>
									    
									  </div>
									
									  <div class="card" style="padding: 8px;background-color: #f0f8ff;">
									  	 <a href="front/productInfoList">
											<img class="card-img-top" src="resources/image/front/food_003.jpg" alt="Card image cap" title="进店转转" style="height: 200px;">
									    </a>
									    <div class="card-body">
									      <h5 class="card-title">大盘鸡</h5>
									    </div>
									   
									  </div>
									  
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end -->
					
				</div>
			</div>
			<!-- -中间模块最右边right -->
			<div class="col-md-1">

				<!-- 静态包含，侧边栏qq模块 -->
				<%@include file="common/rightqq.jsp"%>
			</div>
		</div>
		<!-- 右边模块结束 -->
	</div>
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>近三个月订单</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bower_components/jeasyui/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css" />

<style type="text/css">
body{

    background-color:  #F5F5F5
}

</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<!-- 中间模块 -->
				<div class="row mx-auto" style="width: 100%">

					<!-- 顶部导航栏设计 -->
					<div class="row mx-auto text-center col-md-12"
						style="border: 1px solid yellow; width: 90%; height: 18%; background-color:  #F5F5F5; margin-bottom: 0px">


						<div class="col-md-6"
							style="padding-left: 30px; padding-bottom: 15px; padding-top: 10px; border: px solid white;">
							<h4 class="text-left">最近一个月订单</h4>
							<span style="font-size: h6"><a style="color: blue;">更多美食等你来</a></span>
						</div>




						<div class="col-md-6"
							style="padding-left: 30px; padding-right: 6px; padding-top: 8px; border: px solid white;">
							<img class=" img-thumbnail "
								src="resources/image/ifarmeorder.png"
								style="max-width: 45%; height:">
						</div>

					</div>
					<!-- 顶部导航栏结束 -->
					<!-- 分割线 -->
				<hr style="color: #987cb9; size: 2px; width: 100%">
				<div class="row mx-auto text-center"
					style="border: 1px solid red; width: 92%;">
					<!-- 分割线 -->
					<div
						style="padding-left: 30px; padding-right: 15px; padding-top: 10px; border: px solid white;">
						<h4 class="text-left">最近订单</h4>

					</div>
					<div
						style="padding-left: 700px; padding-right: 15px; padding-top: 20px; border: px solid white;">
						<h6 class="text-left">
							<a href="front/recentmsg">更多订单</a>
						</h6>

					</div>
					<hr
						style="color: #987cb9; size: 5px; width: 100%; margin-top: 0px; margin-bottom: 5px;">
					<table class="table table-hover mx-auto" style="width: 92%;">
						<!-- 优化列表界面，自己设置列宽 -->
						<thead class="col-md-12">
							<tr class="row" style="background: #FFFFCC; height: 50px">
								<!-- 设置每一列宽 -->
								<th class=" col-md-3 col-1 text-center">下单时间</th>
								<th class=" col-md-4 col-1 text-center">订单内容</th>
								<th class=" col-md-2 col-1 text-center">支付金额</th>
								<th class=" col-md-1 col-1 text-center">状态</th>
								<th class=" col-md-2 col-1 text-center">操作</th>
							</tr>
						</thead>
						<tbody class="col-md-12">


							<c:choose>
								<c:when test="${empty orders }">
									<tr class="text-center">
										<td colspan="5"><img class="card-img-top img-thumbnail "
											src="resources/image/notfound.jpg" style="max-width: 80%"></td>
									</tr>
								</c:when>
								<c:otherwise>
                                  <c:forEach items="${orders }" var="order">
                                  <tr class="row" style="height: 75px">
								<td class="col-md-3 col-1 text-center">${order.createTime }</td>
								<td class="col-md-4 col-1 text-center">
								<img class="card-img-top img-thumbnail "
											src="resources/image/notfound.jpg" style="max-width: 35%">
											${order.orderId }
								</td>
								<td class="col-md-2 col-1 text-center">${order.orderAmount }</td>


								<td class="col-md-1 col-1 text-center">${order.orderStatus }</td>
								<td class="col-md-2 col-1 text-center"><a style="text-decoration: none;" href="front/orderitems?orderid=${order.orderId }">订单详情</a>
								<p><a style="text-decoration: none;" href="front/delorderitems?orderid=${order.orderId }">删除订单</a>
								</td>
							</tr>
                                  
                                  </c:forEach>
								</c:otherwise>
							</c:choose>
							

							
						</tbody>
					</table>
				</div>


				</div>
			</div>

		</div>
	</div>
</body>
</html>
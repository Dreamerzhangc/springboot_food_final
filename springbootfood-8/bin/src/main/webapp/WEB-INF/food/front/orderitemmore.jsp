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
<title>订单详情</title>
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
						style="border: px solid white; width: 96%; height: 15%; background-color:  #F5F5F5; margin-bottom: 0px">


						<div class="col-md-6"
							style="padding-left: 30px; padding-top: 10px; border: px solid white;">
							<h4 class="text-left">订单详情</h4>
							

						</div>
						<!-- 分割线上面的图片 -->
						<!-- <div class="col-md-6"
							style="padding-left: 30px; padding-right: 6px; padding-top: 8px; border: 2px solid white;">
							<img class=" img-thumbnail " src="resources/image/glod.jpg"
								style="max-width: 20%; height:">
						</div> -->
						<!-- 中间分割线 -->
						<hr style="color: #987cb9; size: 2px; width: 96%">
					</div>
					<div class="mx-auto"
						style="width: 94%; padding-left: 30px; padding-bottom: 15px; padding-top: 20px; border: 1px solid red; background-color: #CCCCCC">
						<img class="card-img-top img-thumbnail "
							src="resources/image/notfound.jpg"
							style="max-width: 15%; float: left;"> <span
							style="padding-left: 20px">叫了只鸡</span>
						<p>
						<p>
						<p>
							<span style="padding-left: 20px;">订单编号:&nbsp;${orderid}</span>
					</div>
					<!-- 顶部导航栏结束 -->
					<div class="col-md-12">

						<!-- 分割线 -->
						<hr style="color: #987cb9; size: 2px; width: 96%">
						<div class="row mx-auto text-center"
							style="border: 1px solid yellow; width: 96%;">
							<!-- 分割线 -->
							<div
								style="padding-left: 30px; padding-right: 15px; padding-top: 10px; border: px solid white;">
								<h4 class="text-left">商品信息</h4>

							</div>
							<div
								style="padding-left: 700px; padding-right: 15px; padding-top: 20px; border: px solid white;">
								<h6 class="text-left">
									<a href="front/defaultifarme">订单界面</a>
								</h6>

							</div>
							<hr
								style="color: #987cb9; size: 5px; width: 90%; margin-top: 0px; margin-bottom: 5px;">
							<table class="table table-hover mx-auto " style="width: 94%;">
								<!-- 优化列表界面，自己设置列宽 -->
								<thead class="col-md-12">
									<tr class="row" style="background: #FFFFCC; height: 50px">
										<!-- 设置每一列宽 -->
										<th class=" col-md-2 col-1 text-center">编号</th>
										<th class=" col-md-2 col-1 text-center">名称</th>
										<th class=" col-md-5 col-1 text-center">图片</th>
										<th class=" col-md-1 col-1 text-center">数量</th>
										<th class=" col-md-2 col-1 text-center">价格</th>
									</tr>
								</thead>
								<tbody class="col-md-12">


									<c:forEach items="${productInfos}" var="productInfo">
										<tr class="row" style="height: 75px">
											<td class="col-md-2 col-1 text-center">${productInfo.productId}</td>
											<td class="col-md-2 col-1 text-center">${productInfo.productName}</td>
											<td class="col-md-5 col-1 text-center"><img
												class="card-img-top img-thumbnail "
												src="upload/${productInfo.productPhoto }" style="max-width: 28%;"></td>
	                                       
	                                        <td class="col-md-1 col-1 text-center">
                                                <c:forEach items="${orderItems }" var="orderItem">
										
											      <c:if test="${orderItem.productId ==productInfo.productId}">
											        ${orderItem.productQuantity}
											      </c:if>
											
											    </c:forEach>
											    </td>
											<td class="col-md-2 col-1 text-center">${productInfo.productPrice }</td>
										</tr>
									</c:forEach>



								</tbody>
							</table>
						</div>
					</div>


				</div>
			</div>

		</div>
	</div>
</body>
</html>
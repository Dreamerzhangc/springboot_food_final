<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
<title>我的金币</title>
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
						style="border: px solid white; width: 90%; height: 15%; background-color:  #F5F5F5; margin-bottom: 0px">


						<div class="col-md-6"
							style="padding-left: 30px; padding-top: 10px; border: px solid white;">
							<h4 class="text-left">我的余额</h4>
							<span style="font-size: h6"><a style="color: blue;">去充值</a></span>

						</div>
						<!-- 分割线上面的图片 -->
						<div class="col-md-6"
							style="padding-left: 30px; padding-right: 6px; padding-top: 8px; border: px solid white;">
							<img class=" img-thumbnail " src="resources/image/mypacket.jpg"
								style="max-width: 20%; height:">
						</div>
						<!-- 中间分割线 -->
						<hr style="color: #987cb9; size: 2px; width: 100%">
					</div>
					<div class=""
						style="width: 100%; padding-left: 50px; padding-bottom: 15px; padding-top: 20px; border: px solid white; background-color:#FFF8DC">
						<span style="font-size: h6">当前余额</span> <span
							style="padding-left: 50px"><a style="color: blue;">&nbsp;&nbsp;&nbsp;66666
								元</a></span>
					</div>
					<!-- 顶部导航栏结束 -->
					<div class="col-md-12">

						<!-- 分割线 -->
						<hr style="color: #987cb9; size: 2px; width: 100%">
						<div class="row mx-auto text-center"
							style="border: 1px solid red; width: 100%;">
							<!-- 分割线 -->
							<div
								style="padding-left: 30px; padding-right: 15px; padding-top: 10px; border: px solid white;">
								<h6 class="text-left">最近一个月充值记录</h6>

							</div>
							<div
								style="padding-left:700px ; padding-right: 15px; padding-top: 20px; border: px solid white;">
								<h6 class="text-left">
									<a style="color: blue;">更多记录</a>
								</h6>

							</div>
							<hr
								style="color: #987cb9; size: 5px; width: 100%; margin-top: 0px; margin-bottom: 5px;">
							<table class="table table-hover mx-auto" style="width: 90%;">
								<!-- 优化列表界面，自己设置列宽 -->
								<thead class="col-md-12">
									<tr class="row" style="background:#FFF8DC; height: 50px">
										<!-- 设置每一列宽 -->
										<th class=" col-md-2 col-1 text-center">充值时间</th>
										<th class=" col-md-4 col-1 text-center">交易类型</th>
										<th class=" col-md-2 col-1 text-center">金额</th>
										<th class=" col-md-2 col-1 text-center">订单编号</th>
										<th class=" col-md-2 col-1 text-center">操作</th>
									</tr>
								</thead>
								<tbody class="col-md-12">



									<tr class="row" style="height: 50px">
										<td class="col-md-2 col-1 text-center">2018-8-8</td>
										<td class="col-md-4 col-1 text-center">支付宝
										</td>
										<td class="col-md-2 col-1 text-center">6666</td>


										<td class="col-md-2 col-1 text-center">34435435434</td>
										<td class="col-md-2 col-1 text-center"><a style="color: blue;">删除</a></td>
									</tr>

								

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
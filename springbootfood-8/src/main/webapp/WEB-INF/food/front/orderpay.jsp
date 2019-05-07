<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>订单结算</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bower_components/jeasyui/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bootstrap-datetimepicker-master/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link
	href="resources/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
<style type="text/css">
/* 选项操作点击颜色改变 */
.myoption {
	color: black;
}

.clickhref {
	color: blue;
}

.nonestyle {
	border: 0;
	background-color: red
}

.changes {
	border: 3px solid blue;
}

body {
	background-color: #F5F5F5
}

.navbar {
	background-color: #FF0000;
}
</style>

</head>
<body>
	<div class="container-fluid">
		<!-- 主页导航栏 -->
		<div class="row">
			<div class="col-md-12">
				<!-- 静态包含，侧边栏qq模块 -->
				<%@include file="common/nav.jsp"%>
			</div>
		</div>


		<!-- 顶部导航栏设计 -->
		<div class="row mx-auto text-center"
			style="border: 1px solid yellow; width: 90%; height: 20%; background-color: rgb(0, 137, 220); margin-bottom: 0px">
			<div
				style="padding-left: 80px; padding-right: 15px; padding-top: 8px; border: px solid white;">
				<img class=" img-thumbnail " src="resources/image/elm.jpg"
					style="max-width: 250px; height: 70px">
			</div>

			<div
				style="padding-left: 50px; padding-top: 30px; border: px solid white;">
				<h3 class="text-left" style="color: white;">订单结算</h3>

			</div>
			<span style="color: white; padding-top: 45px; padding-left: 50px">&nbsp;&nbsp;&nbsp;美食马上来</span>
			<div
				style="padding-left: 380px; padding-right: 15px; border: px solid white;">
				<img class="  " src="resources/image/jindutiao.png"
					style="max-width: 400px; height: 90px">
			</div>



		</div>
		<!-- 顶部导航栏结束 -->
		<!-- -中间部分 -->
		<div class="row mx-auto" style="width: 80%;">

			<div class="col-md-12">
				<div class="row">
					<!-- 中间左边部分 -->
					<div class="col-md-5"
						style="border: 2px solid red; width: 90%; height: 100%">
						<div class="col-md-12">
							<table class="table table-hover">
								<!-- 优化列表界面，自己设置列宽 -->
								<thead class="col-md-12">

									<tr class="row" style="background: #FFFFCC">
										<!-- 设置每一列宽 -->
										<th class=" col-md-6 col-1 text-center">菜品</th>
										<th class=" col-md-6 col-1 text-center">数量</th>

									</tr>
								</thead>
								<tbody class="col-md-12">
									<!-- 判断订单 -->
									<c:choose>

										<c:when test="${empty productInfos }">
											<td colspan="2"><img class="img-thumbnail mx-auto"
												src="resources/image/notfound.jpg" style="max-width: 80%;"></td>
										</c:when>
										<c:otherwise>


											<c:forEach items="${productInfos}" var="productInfo">
												<tr class="row">
													<td class="col-md-6 col-1 text-center">${productInfo.productName}</td>
													<!-- 判断session商品数量 -->
													<c:forEach items="${sessionScope.carts}" var="cart">
														<c:if test="${cart.productId==productInfo.productId }">
															<!-- 	 显示商品数量 -->
															<td class="col-md-6 col-1 text-center"><span>${cart.productQuantity}</span></td>
														</c:if>
													</c:forEach>

												</tr>

											</c:forEach>
										</c:otherwise>

									</c:choose>
								</tbody>
							</table>

						</div>

						<div
							style="border: 1px solid red;; margin-left: 50%; background-color: #CCCCCC"
							class=" col-md-6">
							<ul style="list-style-type: none; padding-top: 10px;">


								<li><h1>
										<!-- 总价 -->
										<c:choose>
											<c:when test="${empty productInfos }">
												<span style="color: red">&yen;&nbsp;0</span>
											</c:when>
											<c:otherwise>

												<span style="color: red" id="totalprice">&yen;${totalprice }</span>
											</c:otherwise>
										</c:choose>
									</h1></li>
							</ul>
						</div>
					</div>
					<!-- 中间左边部分end -->
					<!-- 中间右边部分 -->
					<div class="col-md-7 " style="border: 2px solid red; width: 90%;">

						<div class="container-fluid">
							<div class="row">
								<div class="col-md-12">
									<!-- 中间模块 -->
									<div class="row mx-auto" style="width: 100%">

										<h5 class="" style="padding-left: 10px；; padding-top: 20px">&nbsp;餐桌预定</h5>


										<hr style="color: #987cb9; size: 2px; width: 100%;">
										<!-- 餐桌预定选择-->

										<div class="form-group col-md-3">
											
											<label class="radio-inline" style="margin-left: 5px;margin-right: 5px"> <input type="radio"
												value="option1" name="sex" onclick="tobooktable(event)">
											</label>
											<button type="button" class="btn btn-outline-danger" 
											>1号<span id="kongxian">已预订</span></button>
                                           
											
                                           
                                            
										</div>
										<div class="form-group col-md-3">
											
											<label class="radio-inline" style="margin-left: 5px;margin-right: 5px"> <input type="radio"
												value="option1" name="sex">
											</label>
											<button type="button" class="btn btn-outline-danger"
												onclick="toooutrderpay(event)">2号已预订</button>
                                           
											
                                           
                                            
										</div>
										<div class="form-group col-md-3">
											
											<label class="radio-inline" style="margin-left: 5px;margin-right: 5px"> <input type="radio"
												value="option1" name="sex">
											</label>
											<button type="button" class="btn btn-outline-danger"
												onclick="toooutrderpay(event)">3号空闲</button>
                                           
											
                                           
                                            
										</div><div class="form-group col-md-3">
											
											<label class="radio-inline" style="margin-left: 5px;margin-right: 5px"> <input type="radio"
												value="option1" name="sex">
											</label>
											<button type="button" class="btn btn-outline-danger"
												onclick="toooutrderpay(event)">4号已预订</button>
                                           
											
                                           
                                            
										</div><div class="form-group col-md-3">
											
											<label class="radio-inline" style="margin-left: 5px;margin-right: 5px"> <input type="radio"
												value="option1" name="sex">
											</label>
											<button type="button" class="btn btn-outline-danger"
												onclick="toooutrderpay(event)">5号空闲</button>
                                           
											
                                           
                                            
										</div>
										<!-- 分割线 -->
										<hr style="color: #987cb9; size: 2px; width: 100%">
										<h5 class="" style="padding-left: 10px">&nbsp;付款方式</h5>
										<hr style="color: #987cb9; size: 2px; width: 100%">
										<div class="mx-auto"
											style="width: 90%; border: 1px solid blue; #F5F5F5">
											<h6 class="text-left" style="padding-left: 10%">&nbsp;在线支付</h6>
											<span style="padding-left: 10%; color: blue">
												&nbsp;支持微信、支付宝、QQ钱包及大部分银行卡</span>

										</div>
										<!-- 优惠方式 -->
										<hr style="color: #987cb9; size: 2px; width: 100%">
										<h5 class="" style="padding-left: 10px">&nbsp;优惠方式</h5>
										<hr style="color: #987cb9; size: 2px; width: 100%">
										<div class="mx-auto"
											style="width: 90%; border: 1px solid red;">
											<ul
												style="list-style-type: none; padding-top: 15px; margin-bottom: 10px">

												<li><label> &nbsp;&nbsp;使用红包
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><span style="color: #CCCCCC">暂时没有红包</span>
													<span style="padding-left: 35%; color: blue"></span> <!-- 中间分割线 -->
													<hr
														style="color: #987cb9; size: 2px; width: 90%; margin-bottom: 10px; margin-top: 10px">
												<li><label> &nbsp;&nbsp;使用积分
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><span style="color: #CCCCCC">2&nbsp;</span>
													<span style="padding-left: 48%; color: blue"></span></li>
											</ul>
										</div>

										<hr style="color: #987cb9; size: 2px; width: 100%">
										<h5 class="" style="padding-left: 10px">&nbsp;其他信息</h5>
										<hr style="color: #987cb9; size: 2px; width: 100%">
										<!-- 其他信息 -->
										<div class="mx-auto"
											style="width: 90%; border: 1px solid yellow; background-color: #F5F5F5">

											<ul
												style="list-style-type: none; padding-top: 15px; margin-bottom: 10px">
												<li><label> &nbsp;订单备注 &nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text"
													id="remarks" name="customermsg"></li>
												<hr
													style="color: #987cb9; size: 2px; width: 90%; margin-bottom: 10px; margin-top: 10px">
												<li><label> &nbsp;就餐时间 &nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>

													<div class="form-group" style="margin-left: 90px;height: 50px">
                                                        
														<div class="input-group date form_datetime col-md-7"
															data-date="2019-04-01T05:25:07Z"
															data-date-format="yyyy MM dd - HH:mm:ss"
															data-link-field="dtp_input1">
															<input class="form-control" size="17" type="text"
																value="" > <span
																class="input-group-addon"><span
																class="glyphicon glyphicon-remove"></span></span> <span
																class="input-group-addon"><span
																class="glyphicon glyphicon-th"></span></span>
														</div>
														<input type="hidden" id="dtp_input1" value="" /><br />
													</div></li>

											</ul>
										</div>
										<hr
											style="color: #987cb9; size: 2px; width: 100%; margin-bottom: 10px; margin-top: 10px">


									</div>
									<!--  确认下单-->

									<h5 class="" style="padding-left: 10px">
										&nbsp;
										<button type="button" class="btn btn-danger"
											onclick="placeorder(event)">确认下单</button>
									</h5>
									<hr style="color: #987cb9; size: 2px; width: 100%">


								</div>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<!-- 中间右边部分end -->
	</div>

	
	<div class="row mx-auto card"
		style="height: 100px; background-color: #e5e5e5; line-height: 100px">
		<!-- 静态包含，底部版权模块 -->
		<%@include file="common/copyright.jsp"%>
	</div>


	<!-- js文件放在最后面，提高网页响应速度 -->
	<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="resources/bower_components/jeasyui/jquery.easyui.min.js"></script>

	<script type="text/javascript" src="resources/bootstrap-datetimepicker-master/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="resources/bootstrap-datetimepicker-master/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="resources/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<%@include file="common/getaddress.jsp"%>
	<script type="text/javascript">
		$('.form_datetime').datetimepicker({
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1
		});
	</script>
	<script type="text/javascript">
		$(function() {

			$(".myoption").click(function() {
				$(".myoption")[0].addClass("clickhref");

			})

		});
		
		/* 点击到堂食订单结算界面 */
		function tobooktable(event) {
			/* 点击到订单结算界面 */
			var status= document.getElementById("kongxian").innerHTML;
			
			//如果没有商品先购买商品
			if(status == "已预订")
				{
                     alert('\u2764 该桌已预订，请选择空闲桌号 ！');

				}
		  }

		/*  到下单界面 */
		function placeorder(event) {
			//根据id不是0就是用户选择的地址的id
			if (window.isOnclick != 1) {
				alert("请您选择送餐地址!");
				return;
			}
			var id = 0;
			$(".addressoption").each(function() {
				if ($(this).val() > 0) {
					id = $(this).val();
				}

			});
			//用户选择地址id和留言给controller
			var remarks = $("#remarks").val();
			var url = "front/placeorder";
			var totalprice = $("#totalprice").text();
			if (totalprice == 0) {
				alert('\u2764 请先选择商品，再下单！');

			} else {

				$.post(url, {
					"aid" : id,
					"remarks" : remarks
				}, function() {
					//到支付界面
					window.location.href = "front/toPay";
				});
			}

		}
	</script>
	<script type="text/javascript">
		$(function() {

			//对添加模态对话框配置
			$("#msgDialog").modal({
				backdrop : 'static',//否则你点击对话框外的部分就消失
				show : false
			//默认是显示的
			});
			//对删除对话框配置
			$("#delDialog").modal({
				backdrop : 'static',//否则你点击对话框外的部分就消失
				show : false
			//默认是显示的
			});

		});
		
	</script>
</body>
</html>
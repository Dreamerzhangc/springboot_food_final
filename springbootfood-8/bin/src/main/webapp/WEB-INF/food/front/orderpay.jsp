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
body{
background-color:  #F5F5F5

}
.navbar{

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
				<img class=" img-thumbnail "
					src="resources/image/elm.jpg"
					style="max-width: 250px; height: 70px">
			</div>

			<div
				style="padding-left: 50px;  padding-top: 30px; border: px solid white;">
				<h3 class="text-left" style="color: white;">订单结算</h3>
				
			</div>
<span style="color: white;padding-top: 45px;padding-left: 50px">&nbsp;&nbsp;&nbsp;美食马上来</span>
			<div
				style="padding-left: 380px; padding-right: 15px;  border: px solid white;">
				<img class="  "
					src="resources/image/jindutiao.png"
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

										<h5 class="" style="padding-left: 10px；; padding-top: 20px">&nbsp;收货地址</h5>
										<!-- 添加新地址 -->
										<a href=""
											style="color: black; padding-left: 70%; padding-top: 30px; text-decoration: none"
											data-toggle="modal" data-target="#msgDialog"
											onclick="addplace(event)"><span>&oplus;&nbsp;添加新地址</span></a>

										<hr style="color: #987cb9; size: 2px; width: 100%;">
										<!-- 地址选择 -->

										<c:forEach items="${alladdress }" var="address">
											<input type="hidden" id="${address.id }"
												value="${address.id }">
											<div class="mx-auto changestyle " id="div${address.id }"
												onclick="changestyle(${address.id })"
												style="width: 90%; background-color: #CCCCCC; margin-bottom: 10px">
											
												<input type="hidden" id="address${address.id }" value=""
													class="addressoption">
												<ul
													style="list-style-type: none; padding-top: 15px; margin-bottom: 10px">

													<li><label> &nbsp;&nbsp;<span
															class="name${address.id}">${address.name }</span>&nbsp;&nbsp;&nbsp;&nbsp;<span
															class="sex${address.id}">${address.sex }</span> &nbsp; :&nbsp;
													</label><span class="phone${address.id}">${address.phone }</span><a
														href="${address.id}" data-toggle="modal"
														data-target="#msgDialog" onclick="editaddress(event)"
														style="padding-left: 35%; text-decoration: none">修改</a>
														&nbsp;&nbsp; <!-- 删除地址管理 --> <a
														href="front/deladdress?id=${address.id}"
														style="text-decoration: none" onclick="delAddress(event)">删除</a></li>

													<!-- 中间分割线 -->
													<hr
														style="color: #987cb9; size: 2px; width: 90%; margin-bottom: 10px; margin-top: 10px">

													<li><label> &nbsp;&nbsp;</label><span
														class="address${address.id}">${address.address}</span><span style="padding-left: 50%" class="option" id="option${address.id }"></span></li>
												</ul>
											</div>
										</c:forEach>


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
													<span style="padding-left: 35%; color: blue">查看</span> <!-- 中间分割线 -->
													<hr
														style="color: #987cb9; size: 2px; width: 90%; margin-bottom: 10px; margin-top: 10px">
												<li><label> &nbsp;&nbsp;使用金币
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><span style="color: #CCCCCC">0&nbsp;个</span>
													<span style="padding-left: 48%; color: blue">查看</span></li>
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
												<li><label> &nbsp;配送方式 &nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>本订单由<a>饿了么</a>配送</li>

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

	<!-- 模态对话框 -->

	<!-- Modal -->
	<div class="modal fade" id="msgDialog" tabindex="-1" role="dialog" 
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">添加地址</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form:form id="addressform" method="post" action="front/addaddress"
					modelAttribute="BuyerAddress">
					<!-- 隐藏的地址id -->
					<input id="id" type="hidden" value="0" name="id">
					<!-- 隐藏的用户的id -->
					<input type="hidden" value="${sessionScope.buyer.id }" name="bid">
					<div class="modal-body">
						<div class="form-group row">
							<label for="inputEmail3" class="col-sm-2 col-form-label">姓名:</label>
							<div class="col-sm-10">
								<input id="name" class="form-control  " name="name" 
									placeholder="姓名">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword3" class="col-sm-2 col-form-label">手机号:</label>
							<div class="col-sm-10">
								<input id="phone" class="form-control " name="phone"
									placeholder="手机号" maxlength="11">
							</div>
						</div>
						<div class="form-check form-check-inline"
							style="padding-left: 17%; padding-bottom: 10px">
							<input class="form-check-input sex " type="radio" name="sex"
								id="inlineRadio1" value="先生"> <label
								class="form-check-label" for="inlineRadio1">先生</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input sex " type="radio" name="sex"
								id="inlineRadio2" value="女士"> <label
								class="form-check-label" for="inlineRadio2">女士</label>
						</div>
						<p>

							详细地址:&nbsp;&nbsp;&nbsp;
							<textarea style="width: 81%" name="address" id="getaddress" ></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary btn_submit" onclick="submitaddress(event)">提交</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- 删除的   Modal -->
	<div class="modal fade" id="delDialog" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">确认删除</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<p>请确认要删除？</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary btn_ok">确定</button>
				</div>
			</div>
		</div>
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
	<%@include file="common/getaddress.jsp"%>
	<script type="text/javascript">
		$(function() {

			$(".myoption").click(function() {
				$(".myoption")[0].addClass("clickhref");

			})
		   

		});
		/* //判断地址信息不能为空
		function submitaddress(event){
		var name=$("#name").val();
        var phone= $("#phone").val();
        var address=$("#getaddress").val();
        if(name.length<1)
                 alert("请完善信息！");
                return false;
    	
		} */
		
		//点击选择地址改变样式
		function changestyle(pid){
			//*****09.28 20:06分 如果用户没有点击地址则让其点击
			window.isOnclick=1;
			var id=pid;
		     //选择其他的元素之前清除原来的class
			$(".changestyle").removeClass("changes");
			$(".addressoption").val(0);
			$(".option").text("");
			$("#div"+id).toggleClass("changes");
			//点击选择地址以后添加一个对号符合
			$("#option"+id).text("\u2714");
			$("#address"+id).val(id);
			}

		
		
		/*  到下单界面 */
		function placeorder(event) {
			//根据id不是0就是用户选择的地址的id
			if(window.isOnclick!=1){
                alert("请您选择送餐地址!");
                return ;
		    }
			var id=0;
			 $(".addressoption").each(function(){
				 if($(this).val()>0)
					 {
					 id=$(this).val();
					 }
				 
				});
			   //用户选择地址id和留言给controller
			    var remarks=$("#remarks").val();
			    var url="front/placeorder";
			    var totalprice=$("#totalprice").text();
			    if(totalprice==0)
				    {
                        alert('\u2764 请先选择商品，再下单！');

				    }else{

			    $.post(	url,{"aid":id,"remarks":remarks},function(){
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
		//买家地址添加   
		function addplace(event) {
			//取消超级链接的默认行为
			event.preventDefault();
			//自动获取位置并且填充
			$("#getaddress").val(window.address);

			//模态框属性
			$("#msgDialog").modal('show');//显示
			$("#msgDialog button.btn_submit").one("click", function() {

				$("#msgDialog").modal('hide');//隐藏

			});

		}
         //删除地址
		function delAddress(event) {

			//取消超级链接的默认行为
			event.preventDefault();
			//显示模态对话框：点击的是图标，因而我们要找他的父亲a
			var url = $(event.target).attr("href");
			$('#delDialog').modal('show');
			//给确认框绑定一次性事件
			$("#delDialog button.btn_ok").one("click", function() {
				window.location.href = url;
			});

		}
		function editaddress(event){
			//取消超级链接的默认行为
			event.preventDefault();
            var num=$(event.target).attr("href");
			$("#name").val($(".name"+num).text());
            $("#phone").val($(".phone"+num).text());
            $("#getaddress").val($(".address"+num).text());
            $("#id").val($("#"+num).val());
			}
	</script>
</body>
</html>
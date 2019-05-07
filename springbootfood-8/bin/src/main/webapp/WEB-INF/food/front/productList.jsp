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
<title>商品列表</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bower_components/jeasyui/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css" />
<!-- 鼠标悬停显示 -->
<style type="text/css">
html, body {
	position: relative;
	background-color:  #F5F5F5
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
list-style-type:none;
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
.navbar{

background-color: #FF0000;
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
				style="border: 1px solid red; width: 90%; height: 100px;background-color: rgb(0, 137, 220); margin-bottom: 20px">
				<div
					style="padding-left: 30px; padding-right:; padding-top: 15px; border: px solid white;">
					<img class="rounded-circle img-thumbnail "
						src="resources/image/sellerphoto.jpg" style="max-width: 46%;">

				</div>

				<div
					style="padding-left: 10px; padding-bottom: 15px; padding-top: 13px; border: px solid white; position: relative;">
					<h3 class="text-left" style="color: white;">叫了只鸡</h3>
					<div class="menu  " style="background-color:   rgb(0, 137, 220)">
						<span  style="color: white;">大盘鸡</span>
						<div>
						   <ul style="padding-left: 0px">
							<li><span  >娜娜大盘鸡一生只做一盘好鸡</span></li><p>
							<li><span  >商家地址： 南阳市嵩山路向南200米路东</span></li><p>
							<li><span  >营业时间： 10:30-14:30 / 17:00-21:30</span></li>
							
						</ul>
						</div>
						
					</div>
				</div>

				<div
					style="padding-left: 300px; padding-right: 15px; padding-top: 15px; border: px solid white;">
					<h6 class="text-left"  style="color: white;">平均送餐时间</h6>
					<span  style="color: white;">30分钟</span>
				</div>

				<div
					style="padding-left: 40px; padding-right: 15px; padding-top: 15px; border: px solid white;">
					<h6 class="text-left"  style="color: white;">起送费</h6>
					<span  style="color: white;">30元</span>
				</div>
				<div
					style="padding-left: 40px; padding-right: 15px; padding-top: 15px; border: px solid white;">
					<h6 class="text-left"  style="color: white;">收藏本店</h6>
					<span> <!-- 红心 -->
						<p class="redhert">&#9829;</p>
					</span>
				</div>

			</div>
			<!-- 顶部导航栏设计结束 -->

			<!-- 中间模块 -->
			<!-- 中间模块这边 -->
			<div class="col-md-8">

				<div class="card-group card-body" style="padding-top: 0px;padding-left: 30px; ">

					<!-- 获取商品信息 -->

					<!-- 商品为空 -->
					<c:choose>
						<c:when test="${empty pageInfo.content }">
							<div class="col-md-4" style="margin-bottom: 10px">
								<div class="card-group">
									<div class="card">
										<img class="card-img-top img-thumbnail "
											src="resources/image/notfound.jpg" alt="Card image cap">
										<div class="card-body " style="padding: 0px">
											<h6 class="card-title text-center"
												style="margin-top: 7px; margin-bottom: 7px">商品为空</h6>
										</div>
										<div class="card-footer " style="padding: 0px">
											<h6 style="margin-top: 7px; margin-bottom: 7px">
												<span style="color: red">&yen;&nbsp;0</span> <a
													style="color: blue;text-decoration:none; padding-left: 20%">加入购物车</a>
											</h6>

									
										</div>
									</div>
								</div>
							</div>
						</c:when>
					
						<c:otherwise>
							<c:forEach items="${pageInfo.content}" var="productInfo">

								<div class="col-md-4" style="margin-bottom: 10px;border: 1px solid red;">
									<div class="card-group">
										<div class="card">
											<img class="card-img-top img-thumbnail "
												src="resources/image/food.jpg"
												alt="Card image cap">
											<div class="card-body " style="padding: 0px">
												<h6 class="card-title text-center"
													style="margin-top: 7px; margin-bottom: 7px">${productInfo.productName }</h6>
											</div>
											<div class="card-footer " style="padding: 0px">
												<h6 style="margin-top: 7px; margin-bottom: 7px">
													<span style="color: red">&yen;&nbsp;${productInfo.productPrice }</span>
													<a
														href="front/shopingCart?productId=${productInfo.productId}"
														style="color: blue;text-decoration:none; padding-left: 20%">加入购物车</a>
												</h6>


											</div>
										</div>
									</div>
								</div>

							</c:forEach>
						</c:otherwise>
					</c:choose>


				</div>
			</div>
			<!-- -中间模块center -->
			<div class="col-md-4">
				<div class="list-group" style="padding-right: 40px">
					<a href="#" class="list-group-item list-group-item-action active"
						style="color: while">商家公告</a>
					<div class="list-group-item"></div>
					<div class="list-group-item">
						<h4 class="list-group-item-heading">商品介绍</h4>
						<p class="list-group-item-text">本店大盘鸡都是新鲜现做的，点餐后一般半个小时可以做出来，所以还请耐心等待稍等片刻，凉菜可以拼盘，需要请在备注栏注明</p>
					</div>
					<div class="list-group-item justify-content-between">
						配送说明 <span class="badge badge-secondary badge-pill">配送费2元</span>
					</div>

					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#msgDialog" onclick="customermsg(event)">商家提议</button>
				</div>


			</div>



			<!-- 静态包含，侧边栏qq模块 -->
			<%@include file="common/rightqq.jsp"%>





		</div>
		<!-- 右边模块结束 -->
	</div>
	<!-- 底部版权 -->
	<div class="row mx-auto card"
		style="height: 100px; background-color: #e5e5e5; line-height: 100px">
		<!-- 静态包含，底部版权模块 -->
		<%@include file="common/copyright.jsp"%>
	</div>


	<!-- 模态对话框 -->

	<!-- Modal -->
	<div class="modal fade" id="msgDialog" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">商家提议</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			  <form action="front/getmsg" method="post">
				<div class="modal-body">

						<div class="form-group">
							<label for="message-text" class="col-form-label"><h5>请输入你的提议</h5></label>
							<textarea class="form-control" id="customermsg" name="customermsg"></textarea>
						</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-primary btn_submit" >提交</button>
				</div>
				</form>
			</div>
		</div>
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

   $(function(){

	//对模态对话框配置
	$("#msgDialog").modal({
		backdrop : 'static',//否则你点击对话框外的部分就消失
		show : false
	//默认是显示的
	});

	
   });
   //客户提议
   function customermsg(event){
          $("#msgDialog").modal('show');//显示
          $("#msgDialog button.btn_submit").one("click",function(){
             $("#msgDialog").modal('hide');//隐藏
         

              });
         
	   }
     </script>

</body>
</html>
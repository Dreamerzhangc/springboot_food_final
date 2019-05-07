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
<title>地址管理</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bower_components/jeasyui/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css" />

<style type="text/css">
.adress {
	border: 1px solid blue;
	width: 30%;
	height: 100px;
	background-color: #CCFFFF;
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 10px;
	margin-bottom: 10px
}
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
				<div class="row mx-auto" style="width: 90%">
				<h5 class="" style="padding-left: 10px；; padding-top: 20px">&nbsp;收货地址</h5>
				<!-- 添加新地址 -->
				<a href=""
					style="color: black; padding-left: 550px; padding-top: 30px; text-decoration: none"
					data-toggle="modal" data-target="#msgDialog"
					onclick="addplace(event)"><span>&oplus;&nbsp;添加新地址</span></a>

				<hr style="color: #987cb9; size: 2px; width: 100%;">
				<!-- 地址选择 -->

				<c:forEach items="${alladdress }" var="address">
					<input type="hidden" id="${address.id }" value="${address.id }">
					<div class="mx-auto changestyle " id="div${address.id }"
						onclick="changestyle(${address.id })"
						style="width: 90%; background-color: #CCCCCC; margin-bottom: 10px">
						<input type="hidden" id="address${address.id }" value=""
							class="addressoption">
						<ul
							style="list-style-type: none; padding-top: 15px; margin-bottom: 10px">

							<li><label> &nbsp;&nbsp;<span
									class="name${address.id}">${address.name }</span>&nbsp;&nbsp;&nbsp;&nbsp;<span
									class="sex${address.id}">${address.sex }</span> &nbsp; :
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</label><span class="phone${address.id}">${address.phone }</span> <a
								href="${address.id}" data-toggle="modal"
								data-target="#msgDialog" onclick="editaddress(event)"
								style="padding-left: 35%; text-decoration: none">修改</a>
								&nbsp;&nbsp; <!-- 删除地址管理 --> <a
								href="front/mydeladdress?id=${address.id}"
								style="text-decoration: none" onclick="delAddress(event)">删除</a></li>

							<!-- 中间分割线 -->
							<hr style="color: #987cb9; size: 2px; width: 90%; margin-bottom: 10px; margin-top: 10px">

							<li><label> &nbsp;&nbsp;</label><span
								class="address${address.id}">${address.address}</span></li>
						</ul>
					</div>
				</c:forEach>

</div>
			</div>
		</div>
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
				<form:form id="addressform" method="post" action="front/myaddaddress"
					modelAttribute="BuyerAddress">
					<!-- 隐藏的地址id -->
					<input id="id" type="hidden" value="0" name="id">
					<!-- 隐藏的用户的id -->
					<input type="hidden" value="${sessionScope.buyer.id }" name="bid">
					<div class="modal-body">
						<div class="form-group row">
							<label for="inputEmail3" class="col-sm-2 col-form-label">姓名:</label>
							<div class="col-sm-10">
								<input id="name" class="form-control" name="name" placeholder="姓名">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPassword3" class="col-sm-2 col-form-label">手机号:</label>
							<div class="col-sm-10">
								<input id="phone" class="form-control" name="phone" placeholder="手机号" maxlength="11">
							</div>
						</div>
						<div class="form-check form-check-inline"
							style="padding-left: 17%; padding-bottom: 10px">
							<input class="form-check-input sex" type="radio" name="sex"
								id="inlineRadio1" value="先生"> <label
								class="form-check-label" for="inlineRadio1">先生</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input sex" type="radio" name="sex"
								id="inlineRadio2" value="女士"> <label
								class="form-check-label" for="inlineRadio2">女士</label>
						</div>
						<p>

							详细地址:&nbsp;&nbsp;&nbsp;
							<textarea style="width: 81%" name="address" id="getaddress"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary btn_submit">提交</button>
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
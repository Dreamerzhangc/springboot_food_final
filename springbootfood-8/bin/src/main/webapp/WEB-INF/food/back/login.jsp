<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<html>

<head>
<meta charset="UTF-8">
<!-- 响应式设计 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>登录</title>

<base href="<%=basePath%>">
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
.container-fluid {
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -307px;
	margin-top: -150px;
}
body {
	overflow: hidden;
	position: fixed;
	width: 100%;
	height: 100%;
	
	background-size: cover;
}
</style>
</head>
<body style="background-image:url('resources/image/4.jpg'); ">

	<div class="container-fluid" style="width: 40%; padding: 50px; border: solid, black, 1px;  background-size: 100%;background-color: #f0f8ff;" >
		<div class="row">
			<div class="col-md-12">
				<c:if test="${msg!=null }">
					<div class="alert alert-primary" role="alert">${msg}</div>
				</c:if>
				<form role="form" action="back/login" method="post">
					<div class="form-group row">
						<label for="inputName" class="col-sm-3 col-form-label">用户名：</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="inputName"
								placeholder="用户名" name="username" value="${requestScope.name}">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputPassword" class="col-sm-3 col-form-label">密码：</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="inputPassword"
								placeholder="密码" name="password">
						</div>
					</div>
					<div class="form-group row">
						<label for="vcode" class="col-sm-3 col-form-label">验证码</label> 
						<div class="col-sm-6">
						<input type="text" class="form-control " id="vcode" maxlength="4" name="vcode" style="display: inline;">
						</div> 
						<div class="col-sm-3">
						<img alt="" src="vcode.png" class="validateVcode" title="点击换图" style="">
						</div>
					</div>

					<button type="submit" class="btn btn-success">登录</button>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".validateVcode").click(
					function() {
						$(".validateVcode").attr("src",
								"vcode.png?t=" + Math.random());
					});
			});
	</script>


</body>
</html>
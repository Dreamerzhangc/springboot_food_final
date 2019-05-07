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
<title>个人中心</title>
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
				<!-- 顶部导航栏设计 -->
				<div class="row mx-auto text-center"
					style="border: 1px solid yellow; width: 100%; height: 150px; background-color:  #F5F5F5; margin-bottom: 20px">
					<div
						style="padding-left: 30px; padding-right: 15px; padding-top: 15px; border: px solid white;">
						<img class="rounded-circle img-thumbnail "
							src="resources/image/defaultuser.png"
							style="max-width: 120px; height: 120px">
					</div>

					<div
						style="padding-left: 30px; padding-bottom: 15px; padding-top: 38px; border: px solid white;">
						<h4 class="text-left">亲爱的用户</h4>
						<span style="padding-left: 30px;">做饭不如定外卖，不洗碗筷！</span>
					</div>

					<div
						style="padding-left: 40px; padding-right: 15px; padding-top: 38px; border: px solid white;">
						<h4 class="text-left">我的余额</h4>
						<span><a style="color: blue;">没有钱，去充值</a></span>
					</div>

					<div
						style="padding-left: 40px; padding-right: 15px; padding-top: 38px; border: px solid white;">
						<h4 class="text-left">我的金币</h4>
						<span><a style="color: blue;">没有金币，去充值</a></span>
					</div>
					<div
						style="padding-left: 40px; padding-right: 15px; padding-top: 38px; border: px solid white;">
						<h4 class="text-left">我的红包</h4>
						<span><a  style="color: blue;">没有红包，去充值</a></span>
					</div>

				</div>
				<!-- 顶部导航栏设计结束 -->
				<hr style="color: #987cb9; size: 2px; width: 100%">
					<h5 class="" style="padding-left: 10px">&nbsp;我的信息</h5>
					<hr style="color: #987cb9; size: 2px; width: 100%">
					<!-- 其他信息 -->
					<div class="mx-auto" style="width: 90%; border: 1px solid yellow; background-color:#F5F5F5;padding: 4px;" >
						<c:if test="${requestScope.msg!=null }">
							<div class="alert alert-warning" role="alert">
							  ${requestScope.msg }
							</div>
						</c:if>
						<form action="front/buyerInfoEdit" method="post" >
							<div style="margin-bottom: 5px;">
								<label for="pwd">旧密码</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="password" id="pwd" name="pwd"><br>
							</div>
							<div style="margin-bottom: 5px;">
								<label for="xpwd">新密码</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="password" id="xpwd" name="xpwd"><br>
							</div>
							<div style="margin-bottom: 5px;">
								<label for="xpwdx">密码确认</label>&nbsp;&nbsp;
								<input type="password" id="xpwdx" name="xpwdx"><br>
							</div>
							<button type="submit">确认修改</button>
						</form>
					</div>
			</div>

		</div>
	</div>
</body>
</html>
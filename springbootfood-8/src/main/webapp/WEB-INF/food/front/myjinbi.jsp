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


</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div style="padding-bottom: 25px; padding-top: 10px">
					<h3 class="text-left">我的金币</h3>
				</div>
				<img class="img-thumbnail " align="right"	src="resources/image/food.jpg" style="max-width: 25%">
                <!-- 分割线 -->
				<hr style="color: #987cb9; size: 2px; width: 100%">
                   
			</div>

		</div>




	</div>
</body>
</html>
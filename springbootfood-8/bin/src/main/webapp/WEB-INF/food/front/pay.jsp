<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>

<base href="<%=basePath%>">
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bower_components/jeasyui/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css" />
<meta charset="UTF-8" />
<title>支付</title>
</head>
<body style="background:url('resources/image/bank_img/bank_background.jpg') no-repeat;background-size: cover;">
	<div class="container-fluid">
		<!-- 主页导航栏 -->
		<div class="row">
			<div class="col-md-12">
				<!-- 静态包含，侧边栏qq模块 -->
				<nav class="navbar navbar-expand-lg navbar-light static-top">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#bs-example-navbar-collapse-1">
		<span class="navbar-toggler-icon"></span>
	</button>
	<a class="navbar-brand" href="#">Brand</a>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link"
				href="front/toMain" style="color: white;">首页</a></li>
			<li class="nav-item"><a class="nav-link"
				href="front/productInfoList" style="color: white;">美食等你来</a></li>
			<li class="nav-item"><a class="nav-link"
				href="front/shopingCart" style="color: white;">我的购物车</a></li>
			<li class="nav-item"><a class="nav-link" href="front/order" style="color: white;">我的订单</a></li>
			<li class="nav-item"><a class="nav-link" href="front/orderpay" style="color: white;">订单结算</a></li>
		
		</ul>

		
		<ul class="navbar-nav ml-md-auto">
			<li class="nav-item active">
			<c:choose>
			<c:when test="${empty buyer.buyerName }">
			   <a href="front/toLogin" style="text-decoration: none"><span style="color: white">亲爱的用户，请登录</span></a>
			</c:when>
			<c:otherwise>
			<span style="color: white;">欢迎&ensp;
					[${buyer.buyerName }]&ensp;登录 </span> <a href="front/exit"
				style="text-decoration: none; color: white"><span>&nbsp;&nbsp;退出</span></a>
			</c:otherwise>
			</c:choose>
			</li>
			<li class="nav-item dropdown"></li>
		</ul>
	</div>
</nav>
			</div>
		</div>
		<!-- 中间模块 -->
		<div class="row mx-auto" >

			<!-- 顶部导航栏设计 -->
			<div class="row mx-auto ">
			  <div class="col-md-12">
				<form action="<%=basePath%>front/pay" method="post">
					<table >
					
						<tr>
							<td  bgcolor="#228B22" colspan="4">
	                          
							<div class="form-group">
								<img src="resources/icomoon/fonts/HL_Logo.gif"/>
								<label for="orderbianhao" style="color: white"> 订单号：</label>
								<INPUT TYPE="text" id="orderbianhao" NAME="ordernum"  value="${sessionScope.orderId}" style="color:black"> 
								<label for="orderjine" style="color: white">支付金额：</label>
								<INPUT TYPE="text" id="orderjine" NAME="money" size="6" value="0.01" style="color: black"><span style="color: white">元</span>
							</div>
							</td>
						</tr>
						<tr>
							<td><br /></td>
						</tr>
						<tr>
							<td><h4 style="color:green">请您选择在线支付的银行</h4></td>
						</tr>
					
							<tr>
								<td><INPUT TYPE="radio" NAME="pd_FrpId" value="CMBCHINA-NET"> 
								  <img name="CMBCHINA-NET" align="middle" src="resources/image/bank_img/cmb.bmp " /> 
								</td>
								<td><INPUT TYPE="radio" NAME="pd_FrpId" value="ICBC-NET">
								  <img name="ICBC-NET" align="middle" src="resources/image/bank_img/icbc.bmp " />
								</td>
								<td><INPUT TYPE="radio" NAME="pd_FrpId" value="ABC-NET">
								  <img name="ABC-NET" align="middle" src="resources/image/bank_img/abc.bmp " />
								</td>
								<td><INPUT TYPE="radio" NAME="pd_FrpId" value="CCB-NET" checked="checked">
								  <img name="CCB-NET" align="middle" src="resources/image/bank_img/ccb.bmp " />
								</td>
							</tr>
					   <tr>
					      <td><br></td>
					   </tr>
						<tr>
							<td><INPUT TYPE="radio" NAME="pd_FrpId" value="CMBC-NET">
							  <img name="CMBC-NET" align="middle" src="resources/image/bank_img/cmbc.bmp " />
							</td>
							<td><INPUT TYPE="radio" NAME="pd_FrpId" value="CEB-NET">
							  <img name="CEB-NET" align="middle" src="resources/image/bank_img/guangda.bmp " />
							</td>
							<td><INPUT TYPE="radio" NAME="pd_FrpId" value="BOCO-NET">
                              <img name="BOCO-NET" align="middle" src="resources/image/bank_img/bcc.bmp " />
                            </td>
							<td><INPUT TYPE="radio" NAME="pd_FrpId" value="SDB-NET">
							  <img name="SDB-NET" align="middle" src="resources/image/bank_img/nanjing.bmp " />
							</td>
						</tr>
						 <tr>
					      <td><br></td>
					   </tr>
						<tr>
							<td><INPUT TYPE="radio" NAME="pd_FrpId" value="BCCB-NET">
							  <img name="SDB-NET" align="middle" src="resources/image/bank_img/bj.bmp " />
							</td>
							<td><INPUT TYPE="radio" NAME="pd_FrpId" value="CIB-NET">
							  <img name="SDB-NET" align="middle" src="resources/image/bank_img/cib.bmp " />
							</td>
							<td><INPUT TYPE="radio" NAME="pd_FrpId" value="SPDB-NET">
							  <img name="SDB-NET" align="middle" src="resources/image/bank_img/shpd.bmp " />
							</td>
							<td><INPUT TYPE="radio" NAME="pd_FrpId" value="ECITIC-NET">
							  <img name="SDB-NET" align="middle" src="resources/image/bank_img/zx.bmp " />
							</td>
						</tr>
						<tr>
							<td><br /></td>
						</tr>
						<tr>
							<td><INPUT TYPE="submit" class="btn btn-success" value="确定支付"></td>
						</tr>
					</table>
				</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
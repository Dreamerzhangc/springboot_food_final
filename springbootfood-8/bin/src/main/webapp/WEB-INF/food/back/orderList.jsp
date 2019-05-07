<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>订单管理</title>
<!-- 响应式设计 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>店铺管理</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="resources/icomoon/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.js"></script>
</head>
<body>
	<%@include file="common/nav.jsp" %>
	<div id="orderItemMan">
	<div class="container">
		<!-- 订单管理界面 -->
		<div>
			<h4 class="border-bottom" style="line-height: 60px;">订单管理</h4>
		</div>
		<div class="col-md">
			<div class="row">
				<div class="col-md-8">
					<form action="back/toOrderList" id="OrderListForm" >
						<div class="form-row align-items-center">
							<input name="pageNo" type="hidden" value="1"> 
							<div class="col-sm-2 ">
								<input type="text" class="form-control" id="inlineFormInputName" name="buyerName" value="${buyerName }" placeholder="用户名">
							</div>
							<div class="col-auto ">
								<select class="custom-select mr-sm-3" name="orderStatus" id="statusSel">
									<option value="-1">--订单状态--</option>
									<option value="0">未处理</option>
									<option value="1">已处理</option>
								</select>
							</div>
							<div class="col-auto my-1">
								<button type="submit" class="btn btn-primary">
									搜索
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<table class="table" style="text-align: center;">
			<thead>
				<tr class="table-info">
					<th>订单编号</th>
					<th >买家用户名</th>
					<th >买家电话</th>
					<th >买家地址</th>
					<th >订单状态</th>
					<th >支付状态</th>
					<th >创建时间</th>
					<th >更新时间</th>
					<th >总金额</th>
					<th >订单内容</th>
				</tr>
			</thead>
			<tbody >
				<c:choose>
					<c:when test="${empty pageInfo.content }">
						<tr>
							<td colspan="10" align="center">无订单数据信息</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${pageInfo.content}" var="order">
						
							<tr>
								<td >${order.orderId}</td>
								<td >${order.buyerName}</td>
								<td >${order.buyerPhone}</td>
								<td >
									<c:out value="${order.buyerAddress}" escapeXml="true"></c:out>
								</td>
								<td >
									
									<!-- 通过onchange进行点击对于订单状态的修改，并且将订单状态保存到数据库中，这样客户在查看自己的订单时，就可以看到自己的订单是否处理 -->
									<select id="orderStatus${order.orderId}" onchange="window.location=this.value;">
										<option value="back/toSaveOrderStatus?orderId=${order.orderId}&orderStatus=0">未处理</option>
										<option value="back/toSaveOrderStatus?orderId=${order.orderId}&orderStatus=1">已处理</option>
									</select>
						
									<script type="text/javascript">
										$("#orderStatus${order.orderId}").val("back/toSaveOrderStatus?orderId=${order.orderId}&orderStatus=${order.orderStatus}");
									</script>
								
								</td>
								<td >
									<!-- 判断支付状态，而且我们的支付状态不受店家管理，所以就不能对其操作 -->
									<c:choose>
										<c:when test="${order.payStatus==0}">
											未支付
										</c:when>
										<c:otherwise>
											已支付
										</c:otherwise>
									</c:choose>
								</td>
								<td >${order.createTime}</td>
								<td >${order.updateTime}</td>
								<td >${order.orderAmount}</td>
								<td >
								<!-- 使用表单提交将数据提交到后台controller中 -->
									<form name="formItem" action="back/toOrderItemList" id="orderItemListForm${order.orderId}"   method="post">
										<input name="orderId" value="${order.orderId}" type="hidden" id="${order.orderId}">
										<button type="button" onclick="check(${order.orderId})">查看</button>
									</form>
								</td>
								
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			
			
			<tfoot>
				<tr>
					<td colspan="10" >
						<div >
						<nav aria-label="...">
							<c:if test="${not empty pageInfo.content }">
								<ul class="pagination">
									<c:choose>
										<c:when test="${pageInfo.first }">
											<li class="page-item">
												<!-- javascript:void(0)用来取消超级链接的默认行为方式，即可选中点击超级链接 --> 
												<a href="javascript:void(0)" class="page-link">&laquo;</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item">
												<a href="back/orderList?pageNo=${pageInfo.number+1-1 }" class="page-link">&laquo;</a>
											</li>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pageInfo.totalPages<=5 }">
											<c:forEach begin="1" end="${pageInfo.totalPages }" var="i">
												<li class="page-item">
													<a href="back/orderList?pageNo=${i }" class="page-link">${i }</a>
												</li>
											</c:forEach>
										</c:when>
										<c:when test="${pageInfo.number+1<=3 }">
											<li class="page-item"><a href="back/orderList?pageNo=1" class="page-link">1</a></li>
											<li class="page-item"><a href="back/orderList?pageNo=2" class="page-link">2</a></li>
											<li class="page-item"><a href="back/orderList?pageNo=3" class="page-link">3</a></li>
											<li class="page-item"><a href="back/orderList?pageNo=4" class="page-link">4</a></li>
											<li class="page-item"><a href="back/orderList?pageNo=${pageInfo.totalPages }" class="page-link">..${pageInfo.totalPages }</a></li>
										</c:when>
										<c:when test="${pageInfo.number+1>=pageInfo.totalPages-2 }">
											<li class="page-item"><a href="back/orderList?pageNo=1" class="page-link">1..</a></li>
											<li class="page-item"><a href="back/orderList?pageNo=${pageInfo.totalPages-3 }" class="page-link">${pageInfo.totalPages-3 }</a></li>
											<li class="page-item"><a href="back/orderList?pageNo=${pageInfo.totalPages-2 }" class="page-link">${pageInfo.totalPages-2 }</a></li>
											<li class="page-item"><a href="back/orderList?pageNo=${pageInfo.totalPages-1 }" class="page-link">${pageInfo.totalPages-1 }</a></li>
											<li class="page-item"><a href="back/orderList?pageNo=${pageInfo.totalPages }" class="page-link">${pageInfo.totalPages }</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a href="back/orderList?pageNo=1" class="page-link">1..</a></li>
											<li class="page-item"><a href="back/orderList?pageNo=${pageInfo.number+1-1 }" class="page-link">${pageInfo.number+1-1 }</a></li>
											<li class="page-item"><a href="back/orderList?pageNo=${pageInfo.number+1 }" class="page-link">${pageInfo.number+1 }</a></li>
											<li class="page-item"><a href="back/orderList?pageNo=${pageInfo.number+1+1 }" class="page-link">${pageInfo.number+1+1 }</a></li>
											<li class="page-item"><a href="back/orderList?pageNo=${pageInfo.totalPages }" class="page-link">..${pageInfo.totalPages }</a></li>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pageInfo.last }">
											<li class="page-item"><a href="javascript:void(0)" class="page-link">&raquo;</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a
												href="back/orderList?pageNo=${pageInfo.number+1+1 }" class="page-link">&raquo;</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</c:if>
						</nav>
						</div>
					</td>
				</tr>
				<!-- 为上一行有下边框 -->
				<tr></tr>
			</tfoot>
			
		</table>
		</div>
		
			<!-- 订单项列表 -->
			<div class="modal fade" id="orderItemDlg" tabindex="-1" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">订单项列表</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<table class="table" >
								<thead>
									<tr>
										<th>商品名称</th>
										<th>商品份额</th>
									</tr>
								</thead>
								<tbody id="showDataTable">
									
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="common/copy.jsp" %>
		
		<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
		<script type="text/javascript" src="resources/bower_components/vue/dist/vue.js"></script>
		<script type="text/javascript" src="resources/bower_components/axios/dist/axios.js"></script>
		<script type="text/javascript">

			$("#statusSel").val(${empty param.orderStatus?-1:param.orderStatus});
		
			$(function() {
				$("#orderItemDlg").modal({
					show : false
				});	

				
			});
			
			function check(evt){
				formId="#orderItemListForm"+evt;
				$.post("back/toOrderItemList",$(formId).serialize(),function(data){
					$("#showDataTable").empty();
					if(data){
						showData(data.orderItems);
					}
					$('#orderItemDlg').modal('show');
				});
			}
			
			
			function showData(data,products){
				if(data.length==0){
					var str="<tr><td>商品订单已处理，商品已删除，商品项信息已过期</td></tr>";
					$("#showDataTable").append(str);
				}
				for(i=0;i<data.length;i++){
					var str="<tr><td>"+data[i].productName+"</td><td>"+data[i].productQuantity+"</td></tr>";
					$("#showDataTable").append(str);
				}
			
			}
		</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
<!-- 响应式设计 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>商家管理</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="resources/icomoon/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<%@include file="common/nav.jsp" %>
	<div class="container">
		<!-- 商家管理界面 -->
		<div>
			<h4 class="border-bottom" style="line-height: 60px;">商家管理</h4>
		</div>
		<div class="col-md">
			<div class="row">
				<div class="col-md-8">
					<form action="back/toSellerinfo" id="ListSearchFrm" >
						<div class="form-row align-items-center">
							<input name="pageNo" type="hidden" value="1"> 
							<div class="col-sm-2 ">
								<input type="text" class="form-control" id="inlineFormInputName" name="resName" value="${param.resName }" placeholder="名称">
							</div>
							<div class="col-auto ">
								<select class="custom-select mr-sm-3" name="res_type" id="typeTidSel">
									<option value="-1">--请选择--</option>
									<c:forEach items="${types }" var="type">
										<option value="${type.id }">${type.resType }</option>
									</c:forEach>
								</select>
							</div>
							<input type="hidden" name="sortName" value="${sortName }"/>
							
							<div class="col-auto my-1">
								<button type="submit" class="btn btn-primary">
									搜索
								</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-4" align="right">
					<button type="button" class="btn btn-light" id="addBtn" >添加</button>
					<button type="button" class="btn btn-light" id="delBtn" >删除</button>
				</div>
			</div>
		</div>
		<table class="table" style="text-align: center;">
			<thead>
				<tr class="table-info">
					<th onclick="sort('resId')" style="cursor:default;" >餐厅ID</th>
					<th onclick="sort('resName')" style="cursor:default;" >餐厅名称</th>
					<th onclick="sort('resSellNum')" style="cursor:default;" >餐厅销量</th>
					<th >餐厅信息</th>
					<th >餐厅地址</th>
					<th >餐厅Logo</th>
					<th >餐厅类型</th>
					<th> 餐厅联系方式</th>
					<th >操作</th>
					<th >选择</th>
				</tr>
			</thead>
			<tbody  style="text-align: center;">
				<c:choose>
					<c:when test="${empty pageInfo.content }">
						<tr>
							<td colspan="9" align="center">此店并未上传商品信息，请点击<a href="javascript:void(0);" onclick="addInfo()">添加</a></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${pageInfo.content}" var="restaurant">
							<tr>
							    <td >${restaurant.resId}</td>
							    <!-- 使用c:out解决页面上的服务式攻击问题 -->
								<td ><c:out value="${restaurant.resName}" escapeXml="true"></c:out></td>
								<td >${restaurant.resSellNum}</td>
							    <td >
									<c:out value="${restaurant.resMessage}" escapeXml="true"></c:out>
								</td >
								<td >${restaurant.resAddress }</td>
								<td style="height: 160px" >
									<img alt="" src="upload/${restaurant.resLogo }" style="height: 140px" >
								</td>
								<td >
								<c:forEach items="${types }" var="type">
									<c:if test="${type.id==restaurant.resType }">
										${type.resType }
									</c:if>
								</c:forEach>
								</td>
								<td >${restaurant.resPhone}</td>
								<td >
									<a href="back/InfoDel?id=${restaurant.resId}" title="删除" style="text-decoration: none;" onclick="delConfirm(event)">
										<span class="icon-cross"></span>
									</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="edit(${restaurant.resId})" title="编辑" style="text-decoration: none;">
										<span class="icon-pencil"></span>
									</a>
								</td>
								<td><input type="checkbox" name="selDel" title="选中" value="${restaurant.resId}"></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="9">
						<nav aria-label="...">
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
											<a href="back/toSellerinfo?pageNo=${pageInfo.number+1-1 }" class="page-link">&laquo;</a>
										</li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${pageInfo.totalPages<=5 }">
										<c:forEach begin="1" end="${pageInfo.totalPages }" var="i">
											<li class="page-item">
												<a href="back/toSellerinfo?pageNo=${i }" class="page-link">${i }</a>
											</li>
										</c:forEach>
									</c:when>
									<c:when test="${pageInfo.number+1<=3 }">
										<li class="page-item"><a href="back/toSellerinfo?pageNo=1" class="page-link">1</a></li>
										<li class="page-item"><a href="back/toSellerinfo?pageNo=2" class="page-link">2</a></li>
										<li class="page-item"><a href="back/toSellerinfo?pageNo=3" class="page-link">3</a></li>
										<li class="page-item"><a href="back/toSellerinfo?pageNo=4" class="page-link">4</a></li>
										<li class="page-item"><a href="back/toSellerinfo?pageNo=${pageInfo.totalPages }" class="page-link">..${pageInfo.totalPages }</a></li>
									</c:when>
									<c:when test="${pageInfo.number+1>=pageInfo.totalPages-2 }">
										<li class="page-item"><a href="back/toSellerinfo?pageNo=1" class="page-link">1..</a></li>
										<li class="page-item"><a href="back/toSellerinfo?pageNo=${pageInfo.totalPages-3 }" class="page-link">${pageInfo.totalPages-3 }</a></li>
										<li class="page-item"><a href="back/toSellerinfo?pageNo=${pageInfo.totalPages-2 }" class="page-link">${pageInfo.totalPages-2 }</a></li>
										<li class="page-item"><a href="back/ptoSellerinfo?pageNo=${pageInfo.totalPages-1 }" class="page-link">${pageInfo.totalPages-1 }</a></li>
										<li class="page-item"><a href="back/toSellerinfo?pageNo=${pageInfo.totalPages }" class="page-link">${pageInfo.totalPages }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a href="back/toSellerinfo?pageNo=1" class="page-link">1..</a></li>
										<li class="page-item"><a href="back/toSellerinfo?pageNo=${pageInfo.number+1-1 }" class="page-link">${pageInfo.number+1-1 }</a></li>
										<li class="page-item"><a href="back/toSellerinfo?pageNo=${pageInfo.number+1 }" class="page-link">${pageInfo.number+1 }</a></li>
										<li class="page-item"><a href="back/toSellerinfo?pageNo=${pageInfo.number+1+1 }" class="page-link">${pageInfo.number+1+1 }</a></li>
										<li class="page-item"><a href="back/toSellerinfo?pageNo=${pageInfo.totalPages }" class="page-link">..${pageInfo.totalPages }</a></li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${pageInfo.last }">
										<li class="page-item"><a href="javascript:void(0)" class="page-link">&raquo;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a
											href="back/toSellerinfo?pageNo=${pageInfo.number+1+1 }" class="page-link">&raquo;</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</td>
				</tr>
				<!-- 为上一行有下边框 -->
				<tr></tr>
			</tfoot>
		</table>
		
		
		
		<!-- 商品添加模态对话框 -->
				<div class="modal" tabindex="-1" role="dialog" id="changeInfo">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">商品添加</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<!-- 注意Controller中传递过来的是product的对象 -->
							<form:form role="form" action="back/sellerInfoAdd" method="post" modelAttribute="restaurant" enctype="multipart/form-data">
								<div class="modal-body">
									<!-- 由于我们上传时，是根据id进行修改，我们要将id也进行上传，但是我们看不到id，不能进行id修改 -->
									<input name="sellerId" type="hidden" id="addSellerId">
									<input name="resId" type="hidden" >
									<!-- 名称 -->
									<div class="form-group row">
										<form:label path="resName" cssClass="col-sm-3 col-form-label">餐厅名称</form:label>
										<div class="col-sm-9">
											<form:input path="resName" cssClass="form-control" />
											<form:errors path="resName" element="div" cssClass="invalid-feedback"></form:errors>
										</div>
									</div>
									<!-- 价格 -->
									<div class="form-group row">
										<form:label path="resAddress" cssClass="col-sm-3 col-form-label">餐厅地址</form:label>
										<div class="col-sm-9">
											<form:input path="resAddress" cssClass="form-control" />
											<form:errors path="resAddress" element="div" cssClass="invalid-feedback"></form:errors>
										</div>
									</div>
									<!-- 描述 -->
									<div class="form-group row">
										<form:label path="resMessage" cssClass="col-sm-3 col-form-label">餐厅描述</form:label>
										<div class="col-sm-9">
											<form:input path="resMessage" cssClass="form-control" />
											<form:errors path="resMessage" element="div" cssClass="invalid-feedback"></form:errors>
										</div>
									</div>
									<!-- 类别 -->
									<div class="form-group row">
										<form:label path="resType" cssClass="col-sm-3 col-form-label">餐厅类型</form:label>
										<div class="col-sm-9">
											<!--  -->
											<form:select path="resType" items="${types}" itemLabel="resType" itemValue="id" cssClass="form-control" />
											<form:errors path="resType"  element="div" cssClass="invalid-feedback"></form:errors>
										</div>
									</div>
									<!-- 库存 -->
									<div class="form-group row">
										<form:label path="resPhone" cssClass="col-sm-3 col-form-label">手机号</form:label>
										<div class="col-sm-9">
											<form:input path="resPhone" cssClass="form-control" />
											<form:errors path="resPhone" element="div" cssClass="invalid-feedback"></form:errors>
										</div>
									</div>
									<!-- 图片 -->
									<div class="form-group row">
										<label for="photox" class="col-sm-3 col-form-label" >餐厅Logo</label>
										<div class="col-sm-9">
											<form:hidden path="resLogo"/>
											<div class=" custom-file">
												<input type="file" class="custom-file-input" id="resLogo" name="resLogo" >
												<label class="custom-file-label" for="customFile"></label>
											</div>
										</div>
									</div>
									<div class="form-group row">
										<form:label path="resCreatetime" cssClass="col-sm-3 col-form-label">开业时间</form:label>
										<div class="col-sm-9">
											<form:input path="resCreatetime" cssClass="form-control" />
											<form:errors path="resCreatetime" element="div" cssClass="invalid-feedback"></form:errors>
										</div>
									</div>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
									<button type="submit" class="btn btn-dark">保存</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<!-- 模态对话框结束 -->
	
				<!-- 删除确认框 -->
				<div class="modal fade" id="delDlg" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">删除确认</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">你确认要删除?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-primary btn_ok">确定</button>
							</div>
						</div>
					</div>
				</div>
	</div>
	<%@include file="common/copy.jsp" %>
	<!-- 商品修改模态对话框 -->
				<div class="modal" tabindex="-1" role="dialog" id="editProductInfo">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">商品修改</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form role="form" action="back/productInfoEdit" method="post" enctype="multipart/form-data">
								<div class="modal-body">
									<input name="sellerId" type="hidden" id="sellerIdEdit" >
									<!-- 由于我们上传时，是根据id进行修改，我们要将id也进行上传，但是我们看不到id，不能进行id修改 -->
									<input name="resId" type="hidden" id="productIdEdit">
									<!-- 名称 -->
									<div class="form-group row">
										<label for="productNameEdit" class="col-sm-3 col-form-label">名称</label>
										<div class="col-sm-9">
											<input id="productNameEdit" name="resName"  class="form-control" />
										</div>
									</div>
									<!-- 价格 -->
									<div class="form-group row">
										<label for="resAddress" class="col-sm-3 col-form-label">价格</label>
										<div class="col-sm-9">
											<input id="productPriceEdit" name="resAddress" class="form-control" />
										</div>
									</div>
									<!-- 描述 -->
									<div class="form-group row">
										<label for="productDescriptionEdit" class="col-sm-3 col-form-label">描述</label>
										<div class="col-sm-9">
											<input id="productDescriptionEdit" name="resMessage" class="form-control" />
										</div>
									</div>
									<!-- 类别 -->
									<div class="form-group row">
										<label for="productTidEdit" class="col-sm-3 col-form-label">类别</label>
										<div class="col-sm-9">
											<!--  -->
											<select id="productTidEdit" name="resType" class="form-control" >
											</select>
										</div>
									</div>
									<!-- 图片 -->
									<div class="form-group row">
										<label for="productPhotoxEdit" class="col-sm-3 col-form-label" >菜品样图</label>
										<div class="col-sm-6">
											<input type="hidden"  name="resLogo" id="productPhotoxEdit"/>
											<div class=" custom-file">
												<input type="file" class="custom-file-input" id="productPhotoxEdit" name="productPhotox" >
												<label class="custom-file-label" for="customFile"></label>
											</div>
										</div>
										<div class="col-sm-3" >
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-6">
											<img alt="" src=""  style="height: 140px" id="photo" >
										</div>
										<div class="col-sm-6" >
											<label class="col-form-label">今日数量</label>
											<input name="resSellNum" id="productStockEdit" style="width: 80px;" class="form-control">
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">取消</button>
									<button type="submit" class="btn btn-dark">保存</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- 模态对话框结束 -->
	<!-- 页面结束 -->
	
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="resources/bower_components/uri-util/dist/uri-util.js"></script>
	<script type="text/javascript">

		$("#addSellerId").val(${sessionScope.manager.id});
	
		var productTid=${empty param.resType?-1:param.resType};
		$("#typeTidSel").val(productTid);
	
		$("a[href^='back/productInfoList?pageNo=${pageInfo.number+1}']").parent("li").addClass("active");

		$(function() {
			
			var prePage = ${pageInfo.number+1-1};
			var nextPage = ${pageInfo.number+1+1};
			$('a[class="page-link"][href^="back/toSellerinfo?pageNo="]').click(function(evt) {
				evt.preventDefault();
				//修改表单中pageNo的值
				if ($(this).text() == "»") {
					$('#ListSearchFrm input[name="pageNo"]').val(nextPage);
				} else if ($(this).text() == "«") {
					$('#ListSearchFrm input[name="pageNo"]').val(prePage);
				} else {
					$('#ListSearchFrm input[name="pageNo"]').val($(this).text().replace(/\./g,""));
				}
				$("#ListSearchFrm").submit();
			});
	  		//修改模态对话框的默认值，设置为不显示
	  		$("#changeInfo").modal({
	  			backdrop : 'static',
	  			show : false
	  		});
	  		$("#delDlg").modal({
				backdrop : 'static',
				show : false
			});
	  		$("#editProductInfo").modal({
				backdrop : 'static',
				show : false
			});
			
	  	});

	  	$("#addBtn").click(function() {
	  		$('#changeInfo').modal('show');
	  	});

	  	function addInfo(){
	  		$('#changeInfo').modal('show');
		};
	  	
	  //点击删除，为删除添加响应事件
		function delConfirm(evt) {
			evt.preventDefault();
			var url = $(evt.target).parent("a").attr("href");
			$('#delDlg').modal('show');
			$("#delDlg button.btn_ok").one("click", function() {
				window.location.href = url;
			});
		};

		var arr;
		$("#delBtn").click(function(){
			$('#delDlg').modal('show');
			arr=new Array();
			$("input[name='selDel']:checked").each(function(){
				arr.push($(this).attr('value'));
			});
			var url="back/deleteChecked?delSel="+arr;
			$("#delDlg button.btn_ok").one("click", function() {
				window.location.href = url;
			});
					
		});

		function edit(evt){
			var url="back/toProductInfoEdit?productId="+evt;
			$.post(url,function(data){
				
				if(data){
					showData(data.productInfo,data.types);
				}
				$('#editProductInfo').modal('show');
			});
		}

		function showData(productInfo,types){
			$("#sellerIdEdit").val(productInfo.sellerId);
			$("#productIdEdit").val(productInfo.productId);
			$("#productNameEdit").val(productInfo.productName);
			$("#productPriceEdit").val(productInfo.productPrice);
			$("#productDescriptionEdit").val(productInfo.productDescription);
			$("#productStockEdit").val(productInfo.productStock);
		
			$("#productPhotoxEdit").val(productInfo.productPhoto);
			for(i=0;i<types.length;i++){
				if(productInfo.productTid==types[i].id){
					$("#productTidEdit").append("<option selected='selected' value="+types[i].id + ">"+types[i].typeName+"</option>");
				}else{
				 	$("#productTidEdit").append("<option value="+types[i].id + ">"+types[i].typeName+"</option>");
				}
			}
			$("#photo").attr("src","upload/"+productInfo.productPhoto);
		}

		function sort(sortName){
			$('#ListSearchFrm input[name="sortName"]').val(sortName);
		
			$("#ListSearchFrm").submit();
		}
	</script>
	
</body>
</html>
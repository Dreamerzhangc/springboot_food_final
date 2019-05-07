<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 响应式设计 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>顶栏</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="resources/icomoon/style.css" rel="stylesheet" type="text/css" />
<link href="resources/bower_components/jqueryui/themes/hot-sneaks/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- start -->
	<div class="container-fluid" style="padding: 0px;">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">

					<h4 style="width: 200px;">我们的商城</h4>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav">
							<li class="nav-item dropdown" style="cursor:default;">
								<a class="nav-link dropdown-toggle" data-toggle="dropdown">店铺管理主页</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="back/toOrderList">订单管理</a> 
									<a class="dropdown-item" href="back/productInfoList">商品管理</a>
								</div>
							</li>
						</ul>
						<ul class="navbar-nav ml-md-auto">
							<li ><span>欢迎<b style="color: blue;">${sessionScope.seller.username }</b>登录&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
							<li><span><a href="javascript:void(0);" onclick="exit()">退出</a></span></li>
						</ul> 
					</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- Button trigger modal -->
					<button type="button" id="button" class="btn btn-lg" data-toggle="modal" data-target="#myModal">消息</button>
				</nav>
			</div>
		</div>
	</div>
	<!-- end -->
	<!-- 消息模态对话框开始 -->
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div id="modalDialog" class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
					<!--  start----------------------------------->
					<input type="text" name="sendUser" hidden="hidden" id="sendUser" value="${sessionScope.seller.username}"/> <!-- <input
						type="button" id="login" value="登录" onclick="login()" /> -->顾客在线人数:<font color="red" style="黑体"
						id="count"></font> &nbsp;&nbsp;&nbsp;您的连接状态:<font id="status"></font> <br />
						<div class="row">
						    <label for="toUser" class="">&nbsp;&nbsp;&nbsp;&nbsp;顾客姓名：</label>
						    <input type="text" name="toUser" id="toUser"  value="${sessionScope.buyer.buyerName}" /><br /> 
                        </div>
					<form role="form">
						<div class="form-group">
							<label for="name">消息框</label>
							<textarea class="form-control" rows="3" cols="5" id="showMsg"
								name="showMsg" disabled="disabled"></textarea>
							<br />
						</div>
						   <div style="float:right">
                             <button type="button" class="btn btn-primary" onclick="clearMessage()">清空消息</button>
                             <button type="button" class="btn btn-primary" onclick="closeWebSocket()">结束聊天</button>
						   </div>
						<div class="form-group">
							<label for="name">文本框</label>
							<textarea class="form-control" rows="3" id="message"
								name="sendMsg"></textarea>
							<br />
						</div>
					</form>
					
					<!--  end--------------------------------------->
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="send()">发送消息</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						id="button2">关闭窗口</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 结束 -->
	
	<script type="text/javascript"
		src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/jqueryui/jquery-ui.js"></script>
	<script type="text/javascript">
		var websocket = null;
		window.onload=function() {
			
			if ('WebSocket' in window) {
				var sendUser = document.getElementById("sendUser").value;
				document.getElementById("sendUser").disabled = true;
				websocket = new WebSocket("ws://localhost:8080/food/chatDemo/"
						+ sendUser);
			} else {
				alert('Not support websocket');
			}
			//连接发生错误的回调方法
			websocket.onerror = function() {
				document.getElementById('status').innerHTML = "error";
			};

			//连接成功建立的回调方法
			websocket.onopen = function(event) {
				document.getElementById('status').innerHTML = "连接成功";
			}

			//接收到消息的回调方法
			websocket.onmessage = function(event) {
				
				//判断分割是统计人数还是显示消息
				if (event.data.indexOf("count") > -1) {
					var msg = event.data;
					var data = msg.split(":");
					document.getElementById('count').innerHTML = data[1]-1;
				} else {
					
					if(event.data.search("1537519760834506400A")!=-1){
					//音频播放
					   alert(event.data+"-----");
					   audio=new Audio("resources/audio/pay.mp3");//路径
					   audio.play();
					   alert("您有新的订单！");
					}else{
					  setMessageInnerHTML(event.data);
					}
				}
			}

			//连接关闭的回调方法
			websocket.onclose = function() {
				document.getElementById('status').innerHTML = "连接被成功关闭";
			}

			//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
			window.onbeforeunload = function() {
				
				websocket.close();
			}
		}
		//将消息显示在网页上
		function setMessageInnerHTML(innerHTML) {
			var j=parseInt(window.j);
			if (j%2!=1&&window.i == 1 && window.old == 1) {
				alert("您有顾客新消息!");
			}
			document.getElementById('showMsg').value += innerHTML;
			document.getElementById('showMsg').style.color="black";
		}

		//关闭连接
		function closeWebSocket() {
			document.getElementById('showMsg').value="";
			websocket.close();
		}

		//发送消息
		function send() {
			var sendUser = document.getElementById("sendUser").value;
			var toUser = document.getElementById("toUser").value;
			var message = document.getElementById("message").value;
			var jsonMsg = {
				"sendUser" : sendUser,
				"toUser" : toUser,
				"message" : message
			}
			
			websocket.send(JSON.stringify(jsonMsg));

			document.getElementById('showMsg').value+= message+"\n";
			//清空消息
	         document.getElementById('message').value="";
		}
	</script>
	<script>
		$(document).ready(function() {

			$("#modalDialog").draggable();//为模态对话框添加拖拽
			$("#myModal").css("overflow", "hidden");//禁止模态对话框的半透明背景滚动

		});
		/*判断button按钮是否被点击过  */
		window.old = 0;
		//判断是否点击关闭button 
		window.i = 0;
		window.j=0;
		document.getElementById("button").onclick = function() {
			j++;
			i = 1;
		}
		document.getElementById("button2").onclick = function() {
			j++;
			window.old = 1;
		}
		//清空消息框
		function clearMessage(){
			document.getElementById('showMsg').value="";
		}
		
		function exit(){
			window.location.href="back/exit";
		}
	</script>
	
</body>
</html>
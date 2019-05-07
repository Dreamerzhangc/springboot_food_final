<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">

*{
	margin: 0;
}
#flow .hide{
	display: block;
}
#flow{
	width: 158px;
	height: 230px;
	
	position: fixed;
	top:200px;
	right: 10px;
	overflow: hidden;
	
}
#flow .show{
	width: 158px;
	height: 230px;
	position: absolute;
	
	
}
#flow .show .con{
	width: 158px;
	height: 172px;
	/* 背景颜色 */
    background-color: #FF6666;
	
}
#flow .show .con .pic{
	width: 106px;
 
	padding-left: 26px;
	padding-top: 10px;
 
}
#flow .show .con p{
	
	width: 120px;
	height: 35px;
	line-height: 35px;
	border-bottom: 1px solid #df5685;
	margin: 10px auto 0;
    font-family:  "微软雅黑";
    font-size: 14px;
    color: white;
}
 a{
	text-decoration: none;
	color: white;
}
.hide{
	position: absolute;
	top: 0;
	right: -40px;
	
}


</style>
<!--最外侧的div盒子 -->
		<div id="flow">
			<!--存放展开状态（大图）的div盒子 -->
		     <div class="show">
		     	<!--顶部图片 -->
		    <!--  	<img src="resources/image/" style="max-width: 15%" class="top"/> -->
		     	<!--中间部分 包括二维码和客服链接 -->
		        <div class='con'>
		        	<img src="resources/image/ewm.png" style="width: 130px;height: 120px"  class="pic"/>
		        	<!--a标签负责生成客服链接 -->
		        	<p>
		        		<a  href="http://wpa.qq.com/msgrd?v=3&uin=2446053738&site=qq&menu=yes" target="_blank">
		        		    <img src="resources/image/qq.jpg" style="width:30px;height: 30px"  align="absmiddle"/> 在线客服咨询
		        		</a>
		        	</p>
		        </div>
		        <!--底部图片 -->
		        <img src="resources/image/off.jpg" style="width: 20px;height: 20px"  class="bot"/>
		     </div>
		     <!--存放隐藏状态（小图）的div盒子 -->
		     <div class="hide" style="width:40px;height: 172px;background-color: #FF6666">
		     <!-- 	<img src="resources/image/smallbj.png" style="width:40px;height: 150px" /> -->
		     	<a href="">在线客服</a><p><p>
		 <!-- 美食栏 -->
		     <%  if(request.getServletPath().contains("shpingcard")) {%>
		     	<a href="front/shpingcard#1">到顶部</a>
		     	<%} %>
		     	<!-- 主页 -->
		       <%  if(request.getServletPath().contains("main")) {%>
		     		<a href="front/toMain#1">到顶部</a>
		     	<%} %>
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
$(document).ready(function(){
	/*
	 * 定义展开状态时底部图片的点击事件
	 * 当点击底部图片时，大图移到屏幕外侧隐藏，小图从屏幕外侧移入
	 */
	$('.bot').click(function(){
		$('#flow .show').animate({
		     
		     	'right':-158
		    
		},500)
		
		$('#flow .hide').animate({
			    'right':0
		},1000)
		
	})
	/*
	 * 定义小图（也就是隐藏状态）的点击事件
	 * 点击后小图移除屏幕，回到原来位置
	 * 大图重新移进屏幕显示
	 */
	$('.hide').click(function(){
		$('#flow .hide').animate({'right':-40},500)
		$('#flow .show').animate({'right':0},1000)
	})
})


</script>
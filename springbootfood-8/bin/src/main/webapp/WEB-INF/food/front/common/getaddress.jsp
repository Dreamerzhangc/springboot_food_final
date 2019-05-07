<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 自动定位获取地址 -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=71709218d45a706b9c7e3abc2f037b23"></script>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    var geoc = new BMap.Geocoder(); 
    var geolocation = new BMap.Geolocation();
    geolocation.getCurrentPosition(function(r){
        if(this.getStatus() == BMAP_STATUS_SUCCESS){
            var mk = new BMap.Marker(r.point);
            map.addOverlay(mk);
            console.log(r.point)
            var pt = r.point;
            geoc.getLocation(pt, function(rs){
                var addComp = rs.addressComponents;
             /*    定义全局变量，=接收地址 */
                window.address=addComp.province + ", " + addComp.city + ", " + addComp.district ;
                
            });    
        }
        else {
            alert('failed'+this.getStatus());
        }        
    },{enableHighAccuracy: true})
</script>

package cn.edu.nyist.food.front.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nyist.food.front.service.OrderService;
import cn.edu.nyist.food.model.Order;
import cn.edu.nyist.food.utils.PayUtil;

@Controller
@RequestMapping("/front")
public class ResponsePayController {
	@Autowired
	private OrderService orderService;
   @RequestMapping("/responsePay")
   public String responsePay(HttpServletRequest request, HttpServletResponse response) throws IOException {
	   response.setContentType("text/html;charset=UTF-8");
		String p1_MerId = request.getParameter("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");//支付结果。1代表成功
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur= request.getParameter("r4_Cur");
		String r5_Pid= request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");//订单编号
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType");//1浏览器访问的。2点对点
		String hmac = request.getParameter("hmac");
	
		//数据校验
		boolean ok = PayUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl");
		if(!ok){
			//支付失败
			return "/front/error";
			
		}else{
			if("1".equals(r1_Code)){
				//支付成功：根据订单号更改订单状态。  点卡或充值时注意表单的重复提交问题。
				/*if("2".equals(r9_BType)){
					
				}*/
				//支付成功修改订单状态
				Order order = orderService.findByOrderId(r6_Order);
				order.setPayStatus(1);
				orderService.update(order);
			    return "/front/success";
			
			}
		}
		 return "/front/success";
		
   }
}

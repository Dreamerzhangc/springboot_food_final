package cn.edu.nyist.food.back.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import cn.edu.nyist.food.back.service.OrderService;
import cn.edu.nyist.food.model.Order;
import cn.edu.nyist.food.model.ManagerInfo;

@Controller("backOrderController")
@RequestMapping("/back")
public class OrderController {
	//转去订单列表界面，查看所有的订单
	/*
	 * 买家要查看自己家所接到的所有订单内容
	 */
	@Autowired
	private OrderService  orderService;
	
	@RequestMapping("/toOrderList")
	public String toOrderList(Model model, @RequestParam(defaultValue = "1", required = false) int pageNo,
			@RequestParam(required=false,defaultValue="") String buyerName,
			@RequestParam(required=false,defaultValue="-1")int orderStatus,
			HttpSession session) {
		ManagerInfo sellerInfo=(ManagerInfo) session.getAttribute("seller");
		int sellerId=sellerInfo.getId();
		Page<Order> pageInfo=orderService.findAllOrders(pageNo,sellerId,buyerName,orderStatus);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("buyerName", buyerName);
		return "/back/orderList";
	}
	
	@RequestMapping("/toSaveOrderStatus")
	public String saveStatus(@RequestParam String orderId,@RequestParam int orderStatus) {
		//首先将原先的数据再次取过来，因为我们存的时候是对于对象的
		orderService.saveOrderStatus(orderId,orderStatus);
		return "redirect:/back/toOrderList";
	}
	
}

package cn.edu.nyist.food.front.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cn.edu.nyist.food.front.service.BuyerInfoService;
import cn.edu.nyist.food.front.service.OrderItemService;
import cn.edu.nyist.food.front.service.OrderService;
import cn.edu.nyist.food.front.service.ProductInfoService;
import cn.edu.nyist.food.model.BuyerAddress;
import cn.edu.nyist.food.model.BuyerInfo;
import cn.edu.nyist.food.model.Order;
import cn.edu.nyist.food.model.OrderItem;
import cn.edu.nyist.food.model.ProductInfo;

/*
 * 我的订单详情界面
 *   1.近期订单
 *   2.我的金币
 *   3.我的余额
 *   。。。。
 */
@Controller
@RequestMapping("/front")
public class MyOrderController {

	@Autowired
	private ProductInfoService productInfoService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private BuyerInfoService buyerInfoService;
	@Autowired
	private OrderItemService orderItemService;

	// 到我的订单界面
	@RequestMapping("/order")
	public String toorder() {

		return "/front/order";
	}

	// 我的订单默认界面
	@RequestMapping("/defaultifarme")
	public String todefaultifarme(HttpSession session, Model model) {
		// 登录的用户
		BuyerInfo buyerInfo = (BuyerInfo) session.getAttribute("buyer");

		// 查询改用户所有订单列表
		List<Order> orders = orderService.findList(buyerInfo.getBuyerName());

		System.out.println(orders);
		model.addAttribute("orders", orders);
		return "/front/defaultifarme";
	}

	// 订单详情
	@RequestMapping("/orderitems")
	public String orderitems(@RequestParam String orderid, Model model) {
		// 新建一个商品list存储
		List<ProductInfo> productInfos = new ArrayList<>();
		// 查询改订单的所有订单项
		System.out.println(orderid);
		List<OrderItem> orderItems = orderItemService.findAll(orderid);
		System.out.println(orderItems + "=--=-===-=-==-");
		for (OrderItem orderItem : orderItems) {
			System.out.println(orderItem.getProductId() + "++++++++++++++++===================");
			ProductInfo productInfo = productInfoService.findById(orderItem.getProductId());
			productInfos.add(productInfo);
		}
		// 商品信息给页面
		model.addAttribute("productInfos", productInfos);
		// 订单信息
		model.addAttribute("orderItems", orderItems);
		model.addAttribute("orderid", orderid);
		return "/front/orderitemmore";
	}

	// 删除订单
	@RequestMapping("/delorderitems")
	public String delorderitems(HttpSession session, Model model,@RequestParam String orderid) {
		/*
		 * 首先删除关联的订单项
		 * 然后删除订单
		 */
		//   1.查询改订单所有订单项
		orderItemService.delOrderItemByOrderid(orderid);
		
		orderService.delOrderById(orderid);
		System.out.println("订单删除了");
	
		// 登录的用户
		BuyerInfo buyerInfo = (BuyerInfo) session.getAttribute("buyer");

		// 查询改用户所有订单列表
		List<Order> orders = orderService.findList(buyerInfo.getBuyerName());

		System.out.println(orders);
		model.addAttribute("orders", orders);
		return "/front/defaultifarme";
	}

	// 近三个月订单
	@RequestMapping("/recentmsg")
	public String torecentmsg(HttpSession session, Model model) {
		// 登录的用户
		BuyerInfo buyerInfo = (BuyerInfo) session.getAttribute("buyer");
		// 查询改用户所有订单列表
		List<Order> orders = orderService.findList(buyerInfo.getBuyerName());

		System.out.println(orders);
		model.addAttribute("orders", orders);
		return "/front/recentmsg";
	}

	// 地址管理
	@RequestMapping("/address")
	public String toaddress(HttpSession session, Model model) {
		// 登录的用户
		BuyerInfo buyerInfo = (BuyerInfo) session.getAttribute("buyer");
		// 查找该用户所有地址
		System.out.println(buyerInfo.getId() + "========");
		List<BuyerAddress> ls = buyerInfoService.findByBid(buyerInfo.getId());
		System.out.println(ls);
		model.addAttribute("alladdress", ls);
		return "/front/address";
	}

	// 我的订单界面添加地址
	@RequestMapping("/myaddaddress")
	public String addadress(HttpSession session, HttpServletRequest request, @ModelAttribute BuyerAddress buyerAddress,
			Model model) {

		BuyerAddress buyeraddress = buyerInfoService.saveAddress(buyerAddress);
		model.addAttribute("buyerAddress", buyeraddress);

		// 登录的用户
		BuyerInfo buyerInfo = (BuyerInfo) session.getAttribute("buyer");
		// 查找该用户所有地址
		System.out.println(buyerInfo.getId() + "========");
		List<BuyerAddress> ls = buyerInfoService.findByBid(buyerInfo.getId());
		System.out.println(ls);
		model.addAttribute("alladdress", ls);
		return "/front/address";

	}

	@RequestMapping("/mydeladdress")
	public String delAddress(@RequestParam int id, Model model, HttpSession session) {
		try {

			buyerInfoService.deleAddress(id);

			// 登录的用户
			BuyerInfo buyerInfo = (BuyerInfo) session.getAttribute("buyer");
			// 查找该用户所有地址
			System.out.println(buyerInfo.getId() + "========");
			List<BuyerAddress> ls = buyerInfoService.findByBid(buyerInfo.getId());
			System.out.println(ls);
			model.addAttribute("alladdress", ls);

			return "/front/address";
		} catch (Exception e) {

			e.printStackTrace();
		}
		return "/front/address";

	}

	// 我的金币
	@RequestMapping("/myglod")
	public String toglod() {

		return "/front/myglod";
	}

	// 我的红包
	@RequestMapping("/mypacket")
	public String tomypacket() {

		return "/front/mypacket";
	}

	// 我的余额
	@RequestMapping("/mymoney")
	public String tomymoney() {

		return "/front/mymoney";
	}

	// 个人信息
	@RequestMapping("/personmsg")
	public String topersonmsg() {

		return "/front/personmsg";
	}

}

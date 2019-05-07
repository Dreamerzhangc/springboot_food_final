package cn.edu.nyist.food.front.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.food.dto.CartDTO;
import cn.edu.nyist.food.front.service.BuyerInfoService;
import cn.edu.nyist.food.front.service.OrderService;
import cn.edu.nyist.food.front.service.ProductInfoService;
import cn.edu.nyist.food.model.BuyerAddress;
import cn.edu.nyist.food.model.BuyerInfo;
import cn.edu.nyist.food.model.Order;
import cn.edu.nyist.food.model.ProductInfo;
import cn.edu.nyist.food.utils.KeyUtil;

@SuppressWarnings("unchecked")
@Controller
@RequestMapping("/front")
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private BuyerInfoService buyerInfoService;
	@Autowired
	private ProductInfoService productInfoService;

	/* 堂食订单结算*/
	@RequestMapping("/orderpay")
	public String toorderpay(HttpSession session, Model model, @RequestParam(required=false,defaultValue="0.0")Double totalprice) {
		     if(!StringUtils.isEmpty((String) session.getAttribute("totalprice"))) {
		    	totalprice= (Double) session.getAttribute("totalprice");
		     }
			// 获取商品总价
			session.setAttribute("totalprice", totalprice);
		
		// 获取购物车信息
		List<CartDTO> carts = (List<CartDTO>) session.getAttribute("carts");
		// 新建一个商品list存储
		List<ProductInfo> productInfos = new ArrayList<>();
		for (CartDTO cartDTO : carts) {
			int productID = cartDTO.getProductId();
			ProductInfo productInfo = productInfoService.findById(productID);
			productInfos.add(productInfo);
			

		}
		// 商品信息给页面
		model.addAttribute("productInfos", productInfos);
        
		/*
		 * 查询该用户所有地址
		 */
		// 登录的用户
		BuyerInfo buyerInfo = (BuyerInfo) session.getAttribute("buyer");
		// 查找该用户所有地址
		System.out.println(buyerInfo.getId() + "========");
		List<BuyerAddress> ls = buyerInfoService.findByBid(buyerInfo.getId());
		System.out.println(ls);
		model.addAttribute("alladdress", ls);
		return "/front/orderpay";
	}
	    // 外卖订单结算
		@RequestMapping("/outorderpay")
		public String toooutrderpay(HttpSession session, Model model, @RequestParam(required=false,defaultValue="0.0")Double totalprice) {
			
				// 获取商品总价
				session.setAttribute("totalprice", totalprice);
			
			// 获取购物车信息
			List<CartDTO> carts = (List<CartDTO>) session.getAttribute("carts");
			// 新建一个商品list存储
			List<ProductInfo> productInfos = new ArrayList<>();
			for (CartDTO cartDTO : carts) {
				int productID = cartDTO.getProductId();
				ProductInfo productInfo = productInfoService.findById(productID);
				productInfos.add(productInfo);

			}
			// 商品信息给页面
			model.addAttribute("productInfos", productInfos);

			/*
			 * 查询该用户所有地址
			 */
			// 登录的用户
			BuyerInfo buyerInfo = (BuyerInfo) session.getAttribute("buyer");
			// 查找该用户所有地址
			System.out.println(buyerInfo.getId() + "========");
			List<BuyerAddress> ls = buyerInfoService.findByBid(buyerInfo.getId());
			System.out.println(ls);
			model.addAttribute("alladdress", ls);
			return "/front/outorderpay";
		}

	@RequestMapping("/addaddress")
	public String addadress(HttpSession session, HttpServletRequest request, @ModelAttribute BuyerAddress buyerAddress,
			Model model) {
         
		BuyerAddress buyeraddress = buyerInfoService.saveAddress(buyerAddress);
		model.addAttribute("buyerAddress", buyeraddress);
		// 成功添加
		// 获取购物车信息
		List<CartDTO> carts = (List<CartDTO>) session.getAttribute("carts");
		// 新建一个商品list存储
		List<ProductInfo> productInfos = new ArrayList<>();
		for (CartDTO cartDTO : carts) {
			int productID = cartDTO.getProductId();
			ProductInfo productInfo = productInfoService.findById(productID);
			productInfos.add(productInfo);

		}
		// 商品信息给页面
		model.addAttribute("productInfos", productInfos);

		// 登录的用户
		BuyerInfo buyerInfo = (BuyerInfo) session.getAttribute("buyer");
		// 查找该用户所有地址
		System.out.println(buyerInfo.getId() + "========");
		List<BuyerAddress> ls = buyerInfoService.findByBid(buyerInfo.getId());
		System.out.println(ls);
		model.addAttribute("alladdress", ls);
		return "/front/orderpay";

	}

	@RequestMapping("/deladdress")
	public String delAddress(@RequestParam int id, Model model, HttpSession session) {
		try {
			System.out.println(id + "==+++++++++++++++++++++++");
			buyerInfoService.deleAddress(id);

			// 获取购物车信息
			List<CartDTO> carts = (List<CartDTO>) session.getAttribute("carts");
			// 新建一个商品list存储
			List<ProductInfo> productInfos = new ArrayList<>();
			for (CartDTO cartDTO : carts) {
				int productID = cartDTO.getProductId();
				ProductInfo productInfo = productInfoService.findById(productID);
				productInfos.add(productInfo);

			}
			// 商品信息给页面
			model.addAttribute("productInfos", productInfos);

			// 登录的用户
			BuyerInfo buyerInfo = (BuyerInfo) session.getAttribute("buyer");
			// 查找该用户所有地址
			System.out.println(buyerInfo.getId() + "========");
			List<BuyerAddress> ls = buyerInfoService.findByBid(buyerInfo.getId());
			System.out.println(ls);
			model.addAttribute("alladdress", ls);

			return "/front/orderpay";
		} catch (Exception e) {

			e.printStackTrace();
		}
		return "/front/orderpay";

	}

	@RequestMapping("/placeorder")
	public String order(HttpSession session, HttpServletRequest request, @RequestParam(required = false) int aid,
			@RequestParam(required = false) String remarks) {
		List<CartDTO> carts = (List<CartDTO>) session.getAttribute("carts");
       System.out.println(aid+"=-=-=-=-=-=-=-=--=-=-");
		BuyerAddress buyerAddress = buyerInfoService.findById(aid);
		System.out.println(buyerAddress);
		double ordermout = (double) session.getAttribute("totalprice");
	
		Order order = new Order();
		order.setBuyerAddress(buyerAddress.getAddress());
		//买家名字
		// 登录的用户
		BuyerInfo buyerInfo = (BuyerInfo) session.getAttribute("buyer");
		order.setBuyerName(buyerInfo.getBuyerName());
		order.setBuyerPhone(buyerAddress.getPhone());
		// 订单金额
		order.setOrderAmount(ordermout);
	
		order.setCreateTime(new Date());
		order.setSellerId(2);
		//生成订单主键
        String orderId=KeyUtil.genUniqueKey();
        session.setAttribute("orderId",orderId);
		order.setOrderId(orderId);
		//创建订单
		orderService.create(carts, order);

		return "redirect:/front/toPay";
	}
}

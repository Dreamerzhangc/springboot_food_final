package cn.edu.nyist.food.front.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.food.dto.CartDTO;
import cn.edu.nyist.food.front.service.ProductInfoService;
import cn.edu.nyist.food.front.service.ProductTypeService;
import cn.edu.nyist.food.model.ProductInfo;
import cn.edu.nyist.food.model.ProductType;

@SuppressWarnings("unchecked")
@Controller("frontProductInfoController")
@RequestMapping("/front")
public class ProductInfoController {

	@Autowired
	private ProductInfoService productInfoService;
	@Autowired
	private ProductTypeService productTypeService;

	// 商家店铺商品展示界面
	@RequestMapping("/productInfoList")
	public String productInfoList(Model model, HttpSession session,
			@RequestParam(defaultValue = "1", required = false) int pageNo,
			@RequestParam(defaultValue = "", required = false) String productName,
			@RequestParam(defaultValue = "-1", required = false) int productType,
			@RequestParam(defaultValue = "", required = false) String sortName,
			@RequestParam(defaultValue = "-1", required = false) int temp			
			) {
		/*
		 * 到商家店铺商品展示界面， 不限制条件，查询所有商品
		 */

		Page<ProductInfo> pageInfo = productInfoService.findAllProductInfos(pageNo, productName, productType, sortName,
				temp);
		List<ProductType> types = productTypeService.findProductTypes();
		model.addAttribute("types", types);
		model.addAttribute("pageInfo", pageInfo);
		// 每家店铺创建一个购物车list

		// 到商品列表界面
		return "/front/productList";
	}

	// 根据点击加入购物车商品的id，查询，然后到购物车界面
	
	@RequestMapping("/shopingCart")
	public String toshpingadd(@RequestParam(required = false, defaultValue = "0") int productId,
			@RequestParam(required = false, defaultValue = "1") int producnum, Model model, HttpSession session) {
		/*
		 * 根据添加购物车选择的id显示加入购物车商品信息 根据iD查询
		 */
		// 1.获取店铺创建的购物车list

		///////////////// 如果直接查看购物车，没有数据，为空
		if (productId == 0) {
			// 购物车列表
			// 新建一个商品list存储
			List<ProductInfo> productInfos = new ArrayList<>();
			List<CartDTO> carts = new ArrayList<>();
			carts = (List<CartDTO>) session.getAttribute("carts");

			for (CartDTO cartDTO : carts) {
				ProductInfo productInfo = productInfoService.findById(cartDTO.getProductId());
				productInfos.add(productInfo);
			}
			// 商品信息给页面
			model.addAttribute("productInfos", productInfos);
			return "/front/shopingCart";
		}

		////////////////////// 添加商品到购物车界面
		List<CartDTO> carts = new ArrayList<>();
		carts = (List<CartDTO>) session.getAttribute("carts");

		// 购物车列表
		// 新建一个商品list存储
		List<ProductInfo> productInfos = new ArrayList<>();
		if (carts.size() == 0) {

			CartDTO cart = new CartDTO();
			// 商品数量
			cart.setProductQuantity(producnum);

			cart.setProductId(productId);
			carts.add(cart);

			ProductInfo productInfo = productInfoService.findById(productId);
			productInfos.add(productInfo);
			// 商品信息给页面
			model.addAttribute("productInfos", productInfos);
			session.setAttribute("carts", carts);
		} else {
			List<CartDTO> cls = new ArrayList<>();// 拷贝原先集合
			int flag = 0;// 用于标记有没有此商品
			for (CartDTO cartDTO : carts) {

				int oldcartDTOid = cartDTO.getProductId();
				// 判断是否是同一个商品
				if (productId == oldcartDTOid) {
					int num = cartDTO.getProductQuantity();

					cartDTO.setProductQuantity(num + 1);
					System.out.println(cartDTO.getProductQuantity() + "++++++++++++++++++++++++++++++++++");
					flag = 1;
					// 这儿应该做一个标记，表明有没有，如果有，直接在此修改让其数量加1，如果没有应该在foreach循环外进行购物车的创建，而不应该在此

					// 循环完整个遍历，查看是否有
				}
				ProductInfo productInfo = productInfoService.findById(cartDTO.getProductId());
				productInfos.add(productInfo);

				cls.add(cartDTO);
			}
			if (flag == 0) {
				CartDTO cart = new CartDTO();
				cart.setProductQuantity(producnum);
				cart.setProductId(productId);
				cls.add(cart);
				for (CartDTO cartDTO : cls) {
					if (cartDTO.getProductId() == productId) {
						ProductInfo productInfo = productInfoService.findById(cartDTO.getProductId());
						productInfos.add(productInfo);
					}
				}

			}
			session.setAttribute("carts", cls);

			model.addAttribute("productInfos", productInfos);
		}

		return "/front/shopingCart";
	}

	// 获取用户输入的建议
	@RequestMapping("/getmsg")
	public String getcustomerMsg(String customermsg) {
		System.out.println(customermsg);
		return "redirect:/front/productInfoList";

	}

	// 点击继续购物时先发送ajax请求把每件商品的id与数量传给后端,后端进行对购物车中商品信息的修改
	@RequestMapping(value = "/shopCartsModify", method = RequestMethod.POST)
	public void shopCartsModify(@RequestBody CartDTO[] cartDTOs, HttpSession session) {
		List<CartDTO> ls = new ArrayList<>();
		for (CartDTO cartDTO : cartDTOs) {
			ls.add(cartDTO);
		}
		session.setAttribute("carts", ls);
	}

	// 点击清空购物车时把每件商品从购物车中移除
	@RequestMapping("/clearCarts")
	public String clearCarts(HttpSession session, Model model) {
		List<CartDTO> carts = (List<CartDTO>) session.getAttribute("carts");
		carts.clear();
		// 购物车列表
		List<ProductInfo> productInfos = new ArrayList<>();
		model.addAttribute("productInfos", productInfos);
		return "/front/shopingCart";
	}

	// 点击删除某一商品
	@RequestMapping("/delCart")
	public String delCart(String productInfoId, HttpSession session, Model model) {
		Integer id = Integer.parseInt(productInfoId);
		List<CartDTO> carts = (List<CartDTO>) session.getAttribute("carts");
		Iterator<CartDTO> it = carts.iterator();
		while (it.hasNext()) {
			CartDTO cartDTO = it.next();
			if (cartDTO.getProductId().equals(id)) {
				System.out.println("--------=====----" + id);
				it.remove();
			}
		}
		// 购物车列表
		List<ProductInfo> productInfos = new ArrayList<>();
		Iterator<CartDTO> it2 = carts.iterator();
		while (it2.hasNext()) {
			CartDTO cartDTO = it2.next();
			ProductInfo productInfo = productInfoService.findById(cartDTO.getProductId());
			productInfos.add(productInfo);
		}
		model.addAttribute("productInfos", productInfos);
		return "/front/shopingCart";
	}

}

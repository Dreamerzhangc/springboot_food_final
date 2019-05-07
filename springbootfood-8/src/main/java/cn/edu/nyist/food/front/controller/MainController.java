package cn.edu.nyist.food.front.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nyist.food.front.service.ProductTypeService;
import cn.edu.nyist.food.model.ProductType;

/*
 * 到前端主界面
 *   1.商家展示界面
 */
@Controller
@RequestMapping("/front")
public class MainController {

	@Autowired
	private ProductTypeService productTypeService; 
	
	// 前端商家主界面
	@RequestMapping("/toMain")
	public String toMain(Model model) {

		//查询所有的商品类型
		List<ProductType> productTypes=productTypeService.findProductTypes();
		for (ProductType productType : productTypes) {
			System.out.println(productType.getId());
		}
		model.addAttribute("productTypes", productTypes);
		return "/front/main";
	}
	// 前端商家展示界面
		@RequestMapping("/toSellerList")
		public String toSellerList(Model model) {

			//查询所有的商品类型
			List<ProductType> productTypes=productTypeService.findProductTypes();
			for (ProductType productType : productTypes) {
				System.out.println(productType.getId());
			}
			model.addAttribute("productTypes", productTypes);
			return "/front/sellerList";
		}
	
	
	
	
	
}

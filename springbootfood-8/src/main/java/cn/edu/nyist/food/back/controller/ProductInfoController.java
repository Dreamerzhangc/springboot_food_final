package cn.edu.nyist.food.back.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.nyist.food.back.service.ProductInfoService;
import cn.edu.nyist.food.back.service.ProductTypeService;
import cn.edu.nyist.food.model.ProductInfo;
import cn.edu.nyist.food.model.ProductType;
import cn.edu.nyist.food.model.ManagerInfo;
import cn.edu.nyist.food.utils.MyBeanUtils;

@Controller
@RequestMapping("/back")
public class ProductInfoController {
	
	@Autowired
	private ProductInfoService productInfoService;
	@Autowired
	private ProductTypeService productTypeService;
	
    //显示商品列表
	@RequestMapping("/productInfoList")
	public String productInfoList(Model model, @RequestParam(defaultValue = "1", required = false) int pageNo,
			@RequestParam(defaultValue = "", required = false) String productName,
			@RequestParam(defaultValue = "-1", required = false) int productTid,
			@RequestParam(defaultValue = "productId", required = false) String sortName,
			HttpServletRequest request,@ModelAttribute ProductInfo productInfo) {
			
		ManagerInfo sellerInfo=(ManagerInfo) request.getSession().getAttribute("manager");
		Integer sellerId=sellerInfo.getId();
		Page<ProductInfo> pageInfo = productInfoService.findAllProductInfos(pageNo,sellerId,productName, productTid, sortName);
		List<ProductType> types = productTypeService.findProductTypes();
		model.addAttribute("types", types);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("productTid", productTid);
		model.addAttribute("sortName", sortName);
	
		return "/back/productInfoList";
	}
	
	/*
	 * 此处可以设置模态对话框，提交模态对话框中的表单内容
	 */
	//添加商品  --如果添加验证失败在这里不需要把types传给前端,因为前端列表页面的添加页面是个模态对话框--
	@RequestMapping("/productInfoAdd")
	public String productInfoAdd(@ModelAttribute ProductInfo productInfo,HttpServletRequest request,HttpSession session,@RequestParam MultipartFile productPhotox) throws IllegalStateException, IOException {
		String fileName = productPhotox.getOriginalFilename();
		if(!fileName.equals("")) {
			fileName = fileName.lastIndexOf("\\") == -1 ? fileName : fileName.substring(fileName.lastIndexOf("\\") + 1);
			String ext = fileName.substring(fileName.lastIndexOf('.') + 1);
			String newFileName = UUID.randomUUID().toString() + "." + ext;
			productPhotox.transferTo(new File(request.getServletContext().getRealPath("WEB-INF/upload/" + newFileName)));
			productInfo.setProductPhoto(newFileName);
		}else {
			//商家用户没有选择图片
			productInfo.setProductPhoto(null);
		}
		ProductInfo result = productInfoService.save(productInfo);
		if(result!=null) {
			return "redirect:/back/productInfoList";
		}else {	
			session.setAttribute("addError","很抱歉添加失败!");
			return "/back/productInfoList";
		}
	}
	
	/*
	 * 根据商品id转到商品修改界面
	 */
	@RequestMapping("/toProductInfoEdit")
	@ResponseBody
	public Map<String, Object> toProductInfoEdit(@RequestParam int productId) {
		Map<String,Object> data=new HashMap<>();
		ProductInfo productInfo=productInfoService.findById(productId);
		data.put("productInfo", productInfo);
		List<ProductType> types = productTypeService.findProductTypes();
		data.put("types", types);
		return data;
	}
	
	/*
	 * 商品修改
	 */
	@RequestMapping("/productInfoEdit")
	public String productInfoEdit(HttpServletRequest request,HttpSession session,@RequestParam MultipartFile productPhotox) throws IllegalStateException, IOException {
		
		ProductInfo productInfo=new ProductInfo();
		productInfo.setProductStock(10);
		MyBeanUtils.populate(productInfo,request.getParameterMap(),"yyyy-MM-dd");
		String fileName = productPhotox.getOriginalFilename();
		if(!fileName.equals("")) {
			fileName = fileName.lastIndexOf("\\") == -1 ? fileName : fileName.substring(fileName.lastIndexOf("\\") + 1);
			String ext = fileName.substring(fileName.lastIndexOf('.') + 1);
			String newFileName = UUID.randomUUID().toString() + "." + ext;
			productPhotox.transferTo(new File(request.getServletContext().getRealPath("WEB-INF/upload/" + newFileName)));
			productInfo.setProductPhoto(newFileName);
		}
		//商家没有该图片，那么就不进行修改图片这一栏
		System.out.println("---------------------------------->"+productInfo.getSellerId());
		ProductInfo result = productInfoService.save(productInfo);
		if(result!=null) {
			return "redirect:/back/productInfoList";
		}else {	
			session.setAttribute("addError","很抱歉修改失败!");
			return "/back/productInfoList";
		}
	}
	
	@RequestMapping("/productInfoDel")
	public String productInfoDel(@RequestParam("id") Integer id) {
		productInfoService.del(id);
		return "redirect:/back/productInfoList";
	}
	
	@RequestMapping("/deleteChecked")
	public String productInfoDelChecked(@RequestParam int delSel[],HttpServletResponse response) throws IOException {
		List<Integer> delSels=new ArrayList<>(delSel.length);
		for (Integer delItem : delSel) {
			delSels.add(delItem);
		}
		//首先查看订单有没有被处理，如果处理了，那么就可以删除订单项，因为我们的订单项依赖于订单，必须先删除订单项，才可以删除订单
		//一、第一种方式
		//1.查询商品对应的订单项
		//2.查询订单项的订单处理情况
		//3.返回查询订单的处理情况
		//4.根据3的返回值，进行订单项的删除
		/*
		 * 二、第二种方式
		 * 	1.查询所有已处理的订单
		 * 	2.通过查询结果，然后查看订单项，对应删除含有该商品已处理的订单项
		 * 	3.删除商品
		 * 			代码在业务层实现
		 */
		productInfoService.deleteBatch(delSels);
		return "redirect:/back/productInfoList";
	}
}

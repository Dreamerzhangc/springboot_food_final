package cn.edu.nyist.food.front.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.food.common.ValidateController;
import cn.edu.nyist.food.front.service.BuyerInfoService;
import cn.edu.nyist.food.model.BuyerInfo;


@Controller
@RequestMapping("/front")
public class LoginController {
	
	@Autowired
	private BuyerInfoService buyerInfoService;
	/*
	 * 登录的controller
	 */
	
	@RequestMapping("/toLogin")
	public String toLogin( ) {
		
		return "/front/login";
	}
	@RequestMapping("/login")
	public String reg(@RequestParam String name,@RequestParam String pwd,@RequestParam String vcode,HttpServletRequest request,HttpSession session) {
		/*zhang
		 * 用户登录判断
		 *  2.验证码是否正确
		 */
		//服务器的验证码
		String serverVcode=(String) session.getAttribute(ValidateController.SERVER_VCODE);
		System.out.println(serverVcode);
		//验证码是否正确
		System.out.println(vcode);
		if(!vcode.equalsIgnoreCase(serverVcode)) {
			request.setAttribute("msg", "验证码不正确");
			request.setAttribute("name", name);
			return "/front/login";
		}
		System.out.println("++++++++++++++++++++++++");
		//登录验证
	    BuyerInfo buyer=buyerInfoService.find(name,pwd);
	    System.out.println(buyer);
	    if(buyer!=null)
	    {
	    	//登陆成功到主界面
	    	session.setAttribute("buyer",buyer);//登录成功，记录在session
	    	session.setAttribute("carts", new ArrayList<>());
	    	return "/front/main";
	    }else {
	    	request.setAttribute("msg","用户名或者密码错误");
	    	request.setAttribute("name", name);
	    	return "/front/login";
	    }
	}
	
}

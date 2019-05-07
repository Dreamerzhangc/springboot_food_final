package cn.edu.nyist.food.back.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.food.back.service.ManagerService;
import cn.edu.nyist.food.common.ValidateController;
import cn.edu.nyist.food.model.ManagerInfo;

@Controller(value = "backLoginContrller")
@RequestMapping("/back")
public class LoginController {

	@Autowired
	private ManagerService managerService;
	/*
	 * 登录的controller
	 */

	@RequestMapping("/toLogin")
	public String toLogin() {

		return "/back/login";
	}

	@RequestMapping("/login")
	public String reg(@RequestParam String username, @RequestParam String password, @RequestParam String vcode, @RequestParam int role,
			HttpServletRequest request, HttpSession session) {

		String serverVcode = (String) session.getAttribute(ValidateController.SERVER_VCODE);
		System.out.println(serverVcode);
		// 验证码是否正确
		System.out.println(vcode);
		if (!vcode.equalsIgnoreCase(serverVcode)) {
			request.setAttribute("msg", "验证码不正确");
			request.setAttribute("name", username);
			return "/back/login";
		}

		// 登录验证
		ManagerInfo manager = managerService.findSellerInfo(username, password,role);
		if (manager != null) {
			// 登陆成功到主界面
			System.out.println(manager.getUsername()+"-----------------------11");
			session.setAttribute("manager", manager);// 登录成功，记录在session
			
			return "redirect:/back/productInfoList";
		} else {
			request.setAttribute("msg", "用户名或者密码错误");
			request.setAttribute("name", username);
			return "/back/login";
		}
	}
	
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.removeAttribute("manager");
		return "redirect:/back/toLogin";
	}
}

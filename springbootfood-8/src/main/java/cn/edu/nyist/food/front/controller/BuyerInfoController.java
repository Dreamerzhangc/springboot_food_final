package cn.edu.nyist.food.front.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.food.front.service.BuyerInfoService;
import cn.edu.nyist.food.model.BuyerInfo;

@Controller("frontBuyerInfoController")
@RequestMapping("/front")
public class BuyerInfoController {

	@Autowired
	private BuyerInfoService buyerInfoService;

	@RequestMapping("/buyerInfoEdit")
	public String buyerInfoEdit(@RequestParam String pwd, @RequestParam String xpwd, @RequestParam String xpwdx,
			HttpSession session, HttpServletRequest request) {

		if (!xpwd.equals(xpwdx)) {
			request.setAttribute("msg", "两次输入密码不一致");

			return "/front/personmsg";
		}

		BuyerInfo buyer = buyerInfoService.findBuyerByPwd(pwd);
		if (buyer == null) {
			request.setAttribute("msg", "原密码输入错误！");

			return "/front/personmsg";
		}
		buyer.setBuyerPwd(xpwd);
		buyerInfoService.saveBuyer(buyer);
		request.setAttribute("msg", "密码修改成功，请退出，重新登录");
		return "/front/personmsg";
	}

}

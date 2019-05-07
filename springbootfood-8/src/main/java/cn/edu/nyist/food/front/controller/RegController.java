package cn.edu.nyist.food.front.controller;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.nyist.food.common.ValidateController;
import cn.edu.nyist.food.front.service.BuyerInfoService;
import cn.edu.nyist.food.model.BuyerInfo;
import cn.edu.nyist.food.utils.SendMessageUtil;

@Controller
@RequestMapping("/front")
public class RegController {
	/*
	 * 由于注册和登录在一个界面，不用这儿转去注册界面
	 */
	@Autowired
	private BuyerInfoService buyerInfoService;

	@RequestMapping("/reg")
	public String reg(@RequestParam String name, @RequestParam String secondphone, 
			@RequestParam String secondpwd, @RequestParam String pwd, @RequestParam String vcode,
			HttpServletRequest request, HttpSession session) {
		/*
		 * 用户注册判断 1.二次密码是否相同 2.验证码是否正确 3.用户名是否被注册
		 */
		// 服务器的验证
		// 判断二次密码是否相同
		if (!pwd.equals(secondpwd)) {
			request.setAttribute("regmsg", "两次输入的密码不符");
			request.setAttribute("name", name);
			return "/front/login";
		}
		/*// 判断手机号验证码是否与填写的一致

		String phoneSMS = (String) session.getAttribute("phoneSMS");
		if (!phoneSMS.equals(secondsms)) {
			request.setAttribute("phonemsg", "手机验证码不正确");
			return "/front/login";
		}*/
		//
		String serverVcode = (String) request.getSession().getAttribute(ValidateController.SERVER_VCODE);
		System.out.println(serverVcode + "-----------------------");
		// 验证码是否正确
		if (!vcode.equalsIgnoreCase(serverVcode)) {
			request.setAttribute("regmsg", "验证码不正确");
			request.setAttribute("name", name);
			return "/front/login";
		}
		// 用户名是否被注册
		BuyerInfo buyer = buyerInfoService.findBuyerByName(name);
		if (buyer == null) {
			BuyerInfo buyerInfo = new BuyerInfo();
			buyerInfo.setBuyerName(name);
			buyerInfo.setBuyerPwd(pwd);
			buyerInfo.setBuyerPhone(secondphone);
			BuyerInfo buyerInfo2 = buyerInfoService.saveBuyer(buyerInfo);
			if (buyerInfo2 != null) {

				request.setAttribute("regmsg", "注册成功");
				return "/front/login";
			} else {
				request.setAttribute("regmsg", "注册失败");
				request.setAttribute("name", name);
			}

		} else {
			request.setAttribute("msg", "用户名已存在");
			request.setAttribute("name", name);
		}
		return "/front/login";
	}

	@RequestMapping("/sendSMS")
	@ResponseBody
	public void sendSMS(@RequestParam String phone, HttpSession session) throws ClientProtocolException, IOException {
		System.out.println(phone);
		String phoneSMS = SendMessageUtil.SendCode(phone);
		// System.out.println("-----------||----------"+phoneSMS);
		// 把从网易云发过来的手机验证码存入session
		session.setAttribute("phoneSMS", phoneSMS);
		System.out.println(phoneSMS);
		// 设置手机验证码有效时间
		try {
			// TimerTask实现5分钟后从session中删除phoneSMS
			final Timer timer = new Timer();
			timer.schedule(new TimerTask() {
				@Override
				public void run() {
					String code = (String) session.getAttribute("phoneSMS");
					if (code != null) {
						// 确保清除不出错
						session.removeAttribute("phoneSMS");
					}
					timer.cancel();
				}
			}, 5 * 60 * 1000);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

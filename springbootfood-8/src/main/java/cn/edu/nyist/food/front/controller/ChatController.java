package cn.edu.nyist.food.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("frontChatController")
@RequestMapping("/front")
public class ChatController {
@RequestMapping("/buyerChat")
public String chatBuyer() {
	return "/front/buyerChat";
}

}

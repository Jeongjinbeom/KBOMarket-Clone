package com.controller.KBOMarket;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value="/")
	public String index() {
		return "index";
	}
	
	//로그아웃
	@RequestMapping(value="logout", method = RequestMethod.GET)
	public String logout(HttpSession session){
		
		session.invalidate();
		
		return "redirect:/";
	}
}

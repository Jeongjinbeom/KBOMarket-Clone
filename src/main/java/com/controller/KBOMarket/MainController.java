package com.controller.KBOMarket;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import admin.service.AdminService;
import goods.bean.GoodsDTO;

@Controller
public class MainController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/")
	public ModelAndView index() {
		List<GoodsDTO> list = adminService.getIndexList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("index");
			
		return mav;
	}
	
	//로그아웃
	@RequestMapping(value="logout", method = RequestMethod.GET)
	public String logout(HttpSession session){
		
		session.invalidate();
		
		return "index";
	}
	
}

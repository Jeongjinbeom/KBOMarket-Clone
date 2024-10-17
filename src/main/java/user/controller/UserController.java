package user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserDTO;
import user.dao.UserDAO;
import user.service.UserService;

@Controller
@RequestMapping(value="user")
public class UserController {
	@Autowired
	private UserService userService;

	//회원가입-폼
	@RequestMapping(value="writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "/user/writeForm";
	}
	
	//회원가입-id확인
	@RequestMapping(value="getExistId", method = RequestMethod.POST)
	@ResponseBody
	public String getExistId(String userId) {
		
		return userService.getExistId(userId);
	}
	
	//회원가입버튼
	@RequestMapping(value="join", method = RequestMethod.POST)
	@ResponseBody
	public void join(@ModelAttribute UserDTO userDTO) {
		System.out.println("UserDTO : " + userDTO);
		userService.join(userDTO);
	}
		
	//로그인-폼
	@RequestMapping(value="loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "/user/loginForm";
	}
	
	//로그인 버튼
	@RequestMapping(value="login", method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam("userId") String userId,
			@RequestParam("pwd") String pwd, HttpSession session){
			
			Map<String, String> map = new HashMap<>();
	        map.put("userId", userId);
	        map.put("pwd", pwd);
	        UserDTO userDTO = userService.login(map); 

			//응답
			if(userDTO != null) {
				//세션으로 로그인 성공.
				session.setAttribute("userId", userDTO.getUserId());
				session.setAttribute("pwd", userDTO.getPwd());
				session.setAttribute("name", userDTO.getName());
				
				session.setAttribute("userDTO", userDTO);

	            System.out.println("userId: " + session.getAttribute("userId"));
	            System.out.println("name: " + session.getAttribute("name"));
	        
	            return "success";
			} else {
				return "fail";
			}

	    }
	


}

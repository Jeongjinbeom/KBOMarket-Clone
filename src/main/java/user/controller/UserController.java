package user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserDTO;
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
				
				/* session.setAttribute("userDTO", userDTO); */

	            System.out.println("userId: " + session.getAttribute("userId"));
	            System.out.println("name: " + session.getAttribute("name"));
	        
	            return "success";
			} else {
				return "fail";
			}

	    }
	
	//마이페이지
	@RequestMapping(value="myPage", method = RequestMethod.GET)
	public String myPage() {
		return "/user/myPage";
	}
	
	//수정페이지
	@RequestMapping(value="updateForm", method = RequestMethod.GET)
	public String updateForm(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		UserDTO userDTO  = userService.updateuserId(userId);
		
		model.addAttribute("userDTO", userDTO);
	return "/user/updateForm";
	}
	
	//수정
	@RequestMapping(value="update", method = RequestMethod.POST)
	@ResponseBody
	public void update(@ModelAttribute UserDTO userDTO, HttpSession session) {
		userService.update(userDTO);

		session.setAttribute("userId", userDTO.getUserId());
		session.setAttribute("pwd", userDTO.getPwd());
		session.setAttribute("name", userDTO.getName());
	}
	
	//탈퇴 - 폼
	@RequestMapping(value="deleteForm", method = RequestMethod.GET)
	public String deleteForm(HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("userId");
		String pwd = (String) session.getAttribute("pwd");
		//UserDTO userDTO  = userService.deleteuserPwd(userId, pwd);
		
		//model.addAttribute("userDTO", userDTO);
		return "/user/deleteForm";
	}
	
	//탈퇴 - 비밀번호 확인
	@RequestMapping(value="getExistPwd", method = RequestMethod.POST)
	@ResponseBody
	public UserDTO getExistPwd(@RequestParam String pwd, HttpSession session, Model model) {
		String id = (String) session.getAttribute("userId");
		
		System.out.println(userService.getExistPwd(id, pwd));
		return userService.getExistPwd(id, pwd);
	}
		
	//탈퇴 버튼
	@RequestMapping(value="delete", method = RequestMethod.POST)
	@ResponseBody
	public void delete(@RequestParam String pwd, HttpSession session) {
		String id = (String) session.getAttribute("userId");
		userService.delete(id);
	}
	
	//탈퇴 후 로그아웃
	@RequestMapping(value="logout", method = RequestMethod.POST)
	@ResponseBody
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}

	// 이메일


}

package user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

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
	

	
	
	/***** 세현 카카오 로그인 *******/
	@GetMapping("/oauth")
	public String kakaoCallback(@RequestParam("code") String code, HttpSession session) {
	    // Access Token 요청
	    String tokenUrl = "https://kauth.kakao.com/oauth/token";
	    RestTemplate restTemplate = new RestTemplate();
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
	    
	    MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
	    params.add("grant_type", "authorization_code");
	    params.add("client_id", "319352d2da2702df6d942999d2ec691d"); // 카카오 앱의 클라이언트 ID
	    params.add("redirect_uri", "http://localhost:8080/KBOMarket/user/oauth");
	    params.add("code", code);

	    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
	    ResponseEntity<Map> response = restTemplate.postForEntity(tokenUrl, request, Map.class);

	    if (response.getStatusCode() != HttpStatus.OK) {
	        // 에러 처리
	        return "error"; // 적절한 에러 페이지로 리다이렉트
	    }

	    String accessToken = (String) response.getBody().get("access_token");

	    // 사용자 정보 요청
	    String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
	    headers.set("Authorization", "Bearer " + accessToken);
	    HttpEntity<String> userInfoRequest = new HttpEntity<>(headers);
	    ResponseEntity<Map> userInfoResponse = restTemplate.exchange(userInfoUrl, HttpMethod.GET, userInfoRequest, Map.class);

	    if (userInfoResponse.getStatusCode() != HttpStatus.OK) {
	        // 에러 처리
	        return "error"; // 적절한 에러 페이지로 리다이렉트
	    }

	    // 사용자 정보 처리
	    Map<String, Object> userInfo = userInfoResponse.getBody();
	    return processUserInfo(userInfo, session);
	}

    private String processUserInfo(Map<String, Object> userInfo, HttpSession session) {
        Map<String, Object> properties = (Map<String, Object>) userInfo.get("properties");
        String name = (String) properties.get("nickname");
        String email = (String) userInfo.get("kakao_account.email");

        UserDTO user = new UserDTO();
        user.setName(name);
        user.setEmail(email);
        user.setUserId(email);
        // UserDTO에 필요한 다른 필드도 설정할 수 있습니다.

        // 세션에 사용자 정보 저장
        UserDTO userDTO = userService.findUser(user);
        if(userDTO == null) {
        	userService.saveUser(user);
        }
        
        session.setAttribute("userId", userDTO.getUserId());
        session.setAttribute("name", userDTO.getName());
        
    	return "index"; // 필요에 따라 반환

    }

}

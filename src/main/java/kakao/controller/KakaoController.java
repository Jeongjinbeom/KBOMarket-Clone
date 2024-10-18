package kakao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kakao.service.IKakaoLoginService;

@Controller
public class KakaoController {
	@Autowired
	private IKakaoLoginService service;
	
	//폼 이동
	@RequestMapping(value = "kakao", method = RequestMethod.GET)
	public String kakao() {

		return "/goods/kakaoLogin";
	}
	
	//로그인 버튼 눌렀을 때 code값 받기 - 자동으로 줌
	@RequestMapping(value = "oauth", method = RequestMethod.GET)
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {

		// 1번
		System.out.println("code:" + code);
		
		// 2번 - 토큰값 얻어오기
		String access_Token = service.getAccessToken(code);
		System.out.println(access_Token);
		
		return null;	
		// return에 페이지를 해도 되고, 여기서는 코드가 넘어오는지만 확인할거기 때문에 따로 return 값을 두지는 않았음
	}
}
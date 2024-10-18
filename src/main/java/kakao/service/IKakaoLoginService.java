package kakao.service;

public interface IKakaoLoginService {
	//code 보내서 access_Token 얻기
	String getAccessToken(String authorize_code) throws Throwable;
}

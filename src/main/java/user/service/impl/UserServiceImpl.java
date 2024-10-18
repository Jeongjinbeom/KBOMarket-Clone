package user.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.bean.UserDTO;
import user.dao.UserDAO;
import user.service.UserService;

@Service
public class UserServiceImpl implements UserService {	
	@Autowired
	private UserDAO userDAO;
	
	//아이디 체크
	@Override
	public String getExistId(String userId) {
		System.out.println(userId);
		UserDTO userDTO = userDAO.getExistId(userId);
		
		System.out.println(userDTO);
		
		if(userDTO == null)
			return "non_exist";
		else
			return "exist";
	}
	
	//회원가입
	@Override
	public void join(UserDTO userDTO) {
		userDAO.join(userDTO);		
	}

	@Override
	public UserDTO login(Map<String, String> map) {
		return userDAO.login(map);
	}

	@Override
	public void saveUser(UserDTO user) {
		userDAO.saveUser(user);
	}

	@Override
	public UserDTO findUser(UserDTO user) {
		return userDAO.findUser(user);
	}


	//이메일 인증
	
	//로그인


	


	
}

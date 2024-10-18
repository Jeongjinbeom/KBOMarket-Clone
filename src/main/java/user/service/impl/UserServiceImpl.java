package user.service.impl;

import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.bean.UserDTO;
import user.dao.UserDAO;
import user.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;


	// 아이디 체크
	@Override
	public String getExistId(String userId) {
		UserDTO userDTO = userDAO.getExistId(userId);

		
		//System.out.println(userDTO);
		
		if(userDTO == null)

		System.out.println(userDTO);

		if (userDTO == null)

			return "non_exist";
		else
			return "exist";
	}

	// 회원가입
	@Override
	public void join(UserDTO userDTO) {
		userDAO.join(userDTO);
	}

	//로그인
	@Override
	public UserDTO login(Map<String, String> map) {
		return userDAO.login(map);
	}
	
	//
	@Override
	public void update(UserDTO userDTO) {
		System.out.println("userDTO.impl" + userDTO);
		userDAO.update(userDTO);
	}
	
	//
	@Override
	public UserDTO updateuserId(String userId) {
		return userDAO.updateuserId(userId);
	}
	//비밀번호찾기
	@Override
	public UserDTO getExistPwd(String userId, String pwd) {
		Map<String, String> map = new HashedMap<String, String>();
		map.put("userId", userId);
		map.put("pwd", pwd);
		UserDTO userDTO = userDAO.getExistPwd(map);
		return userDTO;
	}

	@Override
	public void delete(String userId) {
		userDAO.delete(userId);	
	}

	@Override
	public UserDTO deleteuserPwd(String userId, String pwd) {
		Map<String, String> map = new HashedMap<String, String>();
		map.put("userId", userId);
		map.put("pwd", pwd);
		
		UserDTO userDTO = userDAO.getExistPwd(map);
		return userDTO;
	}

	@Override
	public void saveUser(UserDTO user) {
		userDAO.saveUser(user);
	}


	//이메일 인증

	@Override
	public UserDTO findUser(UserDTO user) {
		return userDAO.findUser(user);
	}




}

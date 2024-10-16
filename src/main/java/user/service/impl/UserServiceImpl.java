package user.service.impl;

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

}

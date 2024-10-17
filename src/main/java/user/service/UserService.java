package user.service;

import java.util.Map;

import user.bean.UserDTO;

public interface UserService {

	public String getExistId(String userId);

	public void join(UserDTO userDTO);

	public UserDTO login(Map<String, String> map);



}

package user.service;

import java.util.Map;

import user.bean.UserDTO;

public interface UserService {

	public String getExistId(String userId);

	public void join(UserDTO userDTO);

	public UserDTO login(Map<String, String> map);

	public void update(UserDTO userDTO);

	public UserDTO updateuserId(String userId);

	public UserDTO getExistPwd(String userId, String pwd);

	public void delete(String userId);

	public UserDTO deleteuserPwd(String userId, String pwd);


	public void saveUser(UserDTO user);

	public UserDTO findUser(UserDTO user);


}

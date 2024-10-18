package user.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import user.bean.UserDTO;

@Mapper
public interface UserDAO {

	public UserDTO getExistId(String userId);

	public void join(UserDTO userDTO);

	public UserDTO login(Map<String, String> map);

	public void saveUser(UserDTO user);

	public UserDTO findUser(UserDTO user);


}

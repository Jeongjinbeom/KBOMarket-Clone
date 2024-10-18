package user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import user.bean.UserDTO;

@Mapper
public interface UserDAO {

	public int update(UserDTO userDTO);
	
	public UserDTO getExistId(String userId);

	public void join(UserDTO userDTO);

	public UserDTO login(Map<String, String> map);

	public UserDTO updateuserId(String userId);
	
	public UserDTO deleteuserPwd(String pwd);
	
	public UserDTO getExistPwd(Map<String, String> map);

	public void delete(String userId);

	public void saveUser(UserDTO user);

	public UserDTO findUser(UserDTO user);
	
	// 관리자페이지 회원가입 목록 뿌리기위함
	public List<UserDTO> getAdminUserList();

}

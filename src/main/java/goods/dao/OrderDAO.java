package goods.dao;

import org.apache.ibatis.annotations.Mapper;

import goods.bean.CartDTO;
import user.bean.UserDTO;

@Mapper
public interface OrderDAO {

	public void insertCart(CartDTO cartDTO);

	public UserDTO getOrderUser(String userId);

}

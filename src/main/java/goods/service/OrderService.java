package goods.service;

import goods.bean.CartDTO;
import user.bean.UserDTO;

public interface OrderService {

	public void insertCart(CartDTO cartDTO);

	public UserDTO getOrderUser(String userId);

}

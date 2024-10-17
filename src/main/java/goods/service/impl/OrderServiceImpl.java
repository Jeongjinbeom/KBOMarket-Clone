package goods.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import goods.bean.CartDTO;
import goods.dao.OrderDAO;
import goods.service.OrderService;
import user.bean.UserDTO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public void insertCart(CartDTO cartDTO) {
		orderDAO.insertCart(cartDTO);
	}

	@Override
	public UserDTO getOrderUser(String userId) {
		return orderDAO.getOrderUser(userId);
	}
}

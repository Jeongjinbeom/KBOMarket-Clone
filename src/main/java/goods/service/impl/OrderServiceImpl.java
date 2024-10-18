package goods.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import goods.bean.CartDTO;
import goods.bean.GoodsDTO;
import goods.bean.OrderDTO;
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

	@Override
	public GoodsDTO getGoods(int prdNo) {
		return orderDAO.getGoods(prdNo);
	}

	@Override
	public void insertOrderInfo(OrderDTO orderDTO) {
		orderDAO.insertOrderInfo(orderDTO);
		
	}

	@Override
	public List<OrderDTO> getOrderDTO(String userId) {
		return orderDAO.getOrderDTO(userId);
	}

	@Override
	public List<CartDTO> getCartDTO(String userId) {
		return orderDAO.getCartDTO(userId);
	}

	@Override
	public GoodsDTO getGoodsList(int prdNo) {
		return orderDAO.getGoodsList(prdNo);
	}

	@Override
	public void orderDelete(String ordNo) {
		orderDAO.orderDelete(ordNo);
		
	}

	@Override
	public void cartDelete(String cartNo) {
		orderDAO.cartDelete(cartNo);
	}
}

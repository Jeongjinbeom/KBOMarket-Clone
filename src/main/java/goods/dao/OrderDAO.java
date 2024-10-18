package goods.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goods.bean.CartDTO;
import goods.bean.GoodsDTO;
import goods.bean.OrderDTO;
import user.bean.UserDTO;

@Mapper
public interface OrderDAO {

	public void insertCart(CartDTO cartDTO);

	public UserDTO getOrderUser(String userId);

	public GoodsDTO getGoods(int prdNo);

	public void insertOrderInfo(OrderDTO orderDTO);

	public List<OrderDTO> getOrderDTO(String userId);

	public List<CartDTO> getCartDTO(String userId);

	public GoodsDTO getGoodsList(int prdNo);

	public void orderDelete(String ordNo);

	public void cartDelete(String cartNo);

}

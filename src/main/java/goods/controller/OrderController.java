package goods.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import goods.bean.CartDTO;
import goods.bean.GoodsDTO;
import goods.bean.OrderDTO;
import goods.service.OrderService;
import user.bean.UserDTO;

@Controller
@RequestMapping(value="order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "insertCart", method = RequestMethod.POST)
	@ResponseBody
	public String insertCart(@ModelAttribute CartDTO cartDTO, HttpServletRequest request) {
		
	    HttpSession session = request.getSession(false); // 현재 세션 가져오기
	    
	    if (session != null && session.getAttribute("userId") != null) {
	        String userId = (String) session.getAttribute("userId");
	        cartDTO.setUserId(userId);
	        
	        List<CartDTO> cartDTO2 = orderService.getCartDTO(userId);
	        boolean exists = false; 
	        
	        if (cartDTO2 != null) {
	            for (CartDTO data : cartDTO2) {
	                if (data.getPrdNo() == cartDTO.getPrdNo()) {
	                    exists = true; // 동일한 prdNo가 발견되었음을 기록
	                    break; // 더 이상 반복할 필요 없음
	                }
	            }
	        }

	        if (!exists) {
	            orderService.insertCart(cartDTO); // 모든 prdNo가 동일하지 않은 경우에만 추가
	        }
	        
	        return "true";
	    } else {
	    	return "false";
	    }
	}
	
	@RequestMapping(value = "cartForm", method = RequestMethod.GET)
	public String cartForm(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		System.out.println(userId);
		List<CartDTO> cartDTO = orderService.getCartDTO(userId);
		List<GoodsDTO> goodsDTO = new ArrayList<GoodsDTO>();
		
		if(cartDTO != null) {
			for(CartDTO data : cartDTO) {
				goodsDTO.add(orderService.getGoodsList(data.getPrdNo()));
			}	
		}
		System.out.println(goodsDTO);
		model.addAttribute("goodsDTO", goodsDTO);		
		model.addAttribute("cartDTO", cartDTO);
   
		return "/goods/goodsCart";
	}
	
	@RequestMapping(value = "orderForm", method = RequestMethod.POST)
	public String orderForm(@ModelAttribute OrderDTO orderDTO,
	        HttpServletRequest request, 
	        Model model) {
	    
	    HttpSession session = request.getSession();
	    UserDTO userDTO = orderService.getOrderUser((String) session.getAttribute("userId"));
	    
	    GoodsDTO goodsDTO = orderService.getGoods(orderDTO.getPrdNo());
	    
	    // Add data to model for view
	    model.addAttribute("goodsDTO", goodsDTO);
	    model.addAttribute("userDTO", userDTO);
	    model.addAttribute("orderDTO", orderDTO);
	    
	    return "/goods/goodsOrderForm"; // Redirect to the order confirmation page
	}
	
	
	@RequestMapping(value = "order", method = RequestMethod.POST)
	public String order(@ModelAttribute OrderDTO orderDTO, HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		
		orderService.insertOrderInfo(orderDTO);
		
		return "redirect:userOrderForm"; // 리디렉션 URL
	}
	
	@RequestMapping(value = "userOrderForm", method = RequestMethod.GET)
	public String userOrderForm(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		
		List<OrderDTO> list = orderService.getOrderDTO(userId);
		List<GoodsDTO> goodsDTO = new ArrayList<>();
		
		for(OrderDTO data : list) {
			goodsDTO.add(orderService.getGoods(data.getPrdNo()));
		}
	    model.addAttribute("goodsDTO", goodsDTO);
		model.addAttribute("list", list);
		
	    return "/user/orderForm";
	}
	
	@RequestMapping(value="orderDelete", method = RequestMethod.POST)
	public String orderDelete(@RequestParam List<String> ids) { //String[] check
		
		for (String id : ids) {
	        orderService.orderDelete(id);
	    }
		
		return "/user/orderForm";
	}
	
	@RequestMapping(value="cartDelete", method = RequestMethod.POST)
	public String cartDelete(@RequestParam List<String> ids) { //String[] check
		
		for (String id : ids) {
	        orderService.cartDelete(id);
	    }
		
		return "/goods/goodsCart";
	}
}

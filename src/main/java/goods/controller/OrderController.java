package goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import goods.bean.CartDTO;
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
	        orderService.insertCart(cartDTO);
	        return "true";
	    } else {
	    	return "false";
	    }
	}
	
	@RequestMapping(value = "orderForm", method = RequestMethod.POST)
	public String orderForm(@ModelAttribute OrderDTO orderDTO, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		UserDTO userDTO = orderService.getOrderUser("se");//원래는 session값 넣어야함
		
		model.addAttribute("userDTO", userDTO);
	    model.addAttribute("orderDTO", orderDTO);
	    return "/goods/goodsCart";
	}
	
}

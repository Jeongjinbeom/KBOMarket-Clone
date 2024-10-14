package goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import goods.service.GoodsService;

@Controller
@RequestMapping(value="goods")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value="goodsList", method=RequestMethod.GET)
	public String goodsList() {
		return "goods/goodsList";
	}
}

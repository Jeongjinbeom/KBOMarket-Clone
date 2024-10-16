package goods.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import goods.bean.GoodsDTO;
import goods.service.GoodsService;

@Controller
@RequestMapping(value="goods")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value="goodsList", method=RequestMethod.GET)
	public String goodsList(@RequestParam String teamId, @RequestParam(required = false, defaultValue = "000") String ctg, @RequestParam(required = false, defaultValue = "regDate") String order, Model model) {
		Map<String, String> categories = new HashMap<>();
		categories.put("000", "전체");
		categories.put("001", "응원도구");
		categories.put("002", "유니폼");
		categories.put("003", "의류");
		categories.put("004", "모자");
		categories.put("005", "잡화");
		
		model.addAttribute("categories", categories);
		
		String teamName = goodsService.getTeamName(teamId);
		
		model.addAttribute("teamName", teamName);
		
		List<GoodsDTO> list;
		int total;
		
		if(ctg.equals("000")) {
			list = goodsService.getGoodsList(teamId, order);
			total = goodsService.getTotalGoods(teamId);
		}else {
			list = goodsService.getGoodsList2(teamId, ctg, order);
			total = goodsService.getTotalGoods2(teamId, ctg);
		}

		System.out.println(list);
		
		model.addAttribute("teamId", teamId);
		model.addAttribute("ctg", ctg);
		model.addAttribute("order", order);
		model.addAttribute("total", total);
		model.addAttribute("list", list);
		
		return "goods/goodsList";
	}
	
	@RequestMapping(value="goodsDetail", method=RequestMethod.GET)
	public String goodsDetail(@RequestParam String prdNo, Model model) {
		
		GoodsDTO goodsDTO = goodsService.getGoods(prdNo);
		
		String prdSize = goodsDTO.getPrdSize();
		String[] sizesArray;
		
		if (prdSize != null && !prdSize.isEmpty()) {
		    sizesArray = prdSize.split(","); // ,로 나누기
		} else {
		    sizesArray = new String[]{"Original"}; // Original 배열 초기화
		}
		
		model.addAttribute("dto", goodsDTO);
		model.addAttribute("sizesArray", sizesArray); // 배열 추가
		
		return "goods/goodsDetail";
	}
}

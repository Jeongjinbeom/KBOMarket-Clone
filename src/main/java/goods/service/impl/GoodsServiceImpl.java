package goods.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import goods.bean.GoodsDTO;
import goods.dao.GoodsDAO;
import goods.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;

	@Override
	public List<GoodsDTO> getGoodsList(String teamId, String order) {
		String[] orderParts = order.split("_");
		String orderDirection;
		
		if (orderParts.length > 1) {
	        orderDirection = orderParts[1]; // e.g., 'asc' or 'desc'
	    } else {
	    	orderDirection = "asc"; // Default direction if not specified
	    }
		
		Map<String, Object> map = new HashMap<>();
		map.put("teamId", teamId);
		map.put("order", orderParts[0]);
		map.put("orderDirection", orderDirection);
		
		return goodsDAO.getGoodsList(map);
	}

	@Override
	public List<GoodsDTO> getGoodsList2(String teamId, String ctg, String order) {
		String[] orderParts = order.split("_");
		String orderDirection;
		
		if (orderParts.length > 1) {
	        orderDirection = orderParts[1]; // e.g., 'asc' or 'desc'
	    } else {
	    	orderDirection = "asc"; // Default direction if not specified
	    }
		
		System.out.println(orderParts[0] + ", " + orderDirection + ", " + teamId+", " + ctg);
		
		Map<String, Object> map = new HashMap<>();
		map.put("teamId", teamId);
		map.put("ctg", ctg);
		map.put("order", orderParts[0]);
		map.put("orderDirection", orderDirection);
		
		return goodsDAO.getGoodsList2(map);
	}

	@Override
	public int getTotalGoods(String teamId) {
		
		return goodsDAO.getTotalGoods(teamId);
	}

	@Override
	public int getTotalGoods2(String teamId, String ctg) {
		Map<String, Object> map = new HashMap<>();
		map.put("teamId", teamId);
		map.put("ctg", ctg);
		
		return goodsDAO.getTotalGoods2(map);
	}

	@Override
	public String getTeamName(String teamId) {
		return goodsDAO.getTeamName(teamId);
	}

	@Override
	public GoodsDTO getGoods(String prdNo) {
		return goodsDAO.getGoods(prdNo);
	}
}

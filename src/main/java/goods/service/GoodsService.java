package goods.service;

import java.util.List;

import goods.bean.GoodsDTO;

public interface GoodsService {

	public List<GoodsDTO> getGoodsList(String teamId, String order);

	public List<GoodsDTO> getGoodsList2(String teamId, String ctg, String order);

	public int getTotalGoods(String teamId);

	public int getTotalGoods2(String teamId, String ctg);

	public String getTeamName(String teamId);

	public GoodsDTO getGoods(String prdNo);

}

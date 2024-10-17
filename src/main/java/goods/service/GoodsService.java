package goods.service;

import java.util.List;
import java.util.Map;

import goods.bean.GoodsDTO;
import goods.bean.ReviewDTO;

public interface GoodsService {

	public List<GoodsDTO> getGoodsList(String teamId, String order);

	public List<GoodsDTO> getGoodsList2(String teamId, String ctg, String order);

	public int getTotalGoods(String teamId);

	public int getTotalGoods2(String teamId, String ctg);

	public String getTeamName(String teamId);

	public GoodsDTO getGoods(String prdNo);

	public Map<String, Object> getReviewCount(String prdNo, String pg);

	public String getUserName(String userId);

	public void updateViews(String prdNo);

	public void reviewLike(int reviewNo);

}

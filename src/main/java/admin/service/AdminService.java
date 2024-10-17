package admin.service;

import java.util.List;

import goods.bean.GoodsDTO;

public interface AdminService {

	public void goodsWrite(List<GoodsDTO> imageUploadList);

	public List<GoodsDTO> getAdminList();

	public void deleteAdminList(String[] check);

}

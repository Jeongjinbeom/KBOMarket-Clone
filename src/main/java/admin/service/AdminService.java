package admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import goods.bean.GoodsDTO;
import user.bean.UserDTO;

public interface AdminService {

	public void goodsWrite(List<GoodsDTO> imageUploadList);

	public List<GoodsDTO> getAdminList();

	public void deleteAdminList(String[] check);

	public List<GoodsDTO> getIndexList();

	public GoodsDTO getAdminUpdateList(String prdNo);

	public void adminUpdate(GoodsDTO goodsDTO, MultipartFile imageFile);

	public List<UserDTO> getAdminUserList();
	

}

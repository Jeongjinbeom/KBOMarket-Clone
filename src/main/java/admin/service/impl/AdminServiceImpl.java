package admin.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.service.AdminService;
import admin.service.ObjectStorageService;
import goods.bean.GoodsDTO;
import goods.dao.GoodsDAO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private GoodsDAO goodsDAO;
	
	// 네이버 클라우드
	@Autowired
	private ObjectStorageService objectStorageService;

	private String bucketName = "bitcamp-9th-bucket-138";

	
	
	@Override
	public void goodsWrite(List<GoodsDTO> imageUploadList) {
		
		
		goodsDAO.goodsWrite(imageUploadList);
	
	
	}

	@Override
	public List<GoodsDTO> getAdminList() {
		return goodsDAO.getAdminList();
	}

	@Override
	public void deleteAdminList(String[] check) {
		
		List<String> list = new ArrayList<String>();
		
		for(String prdNo : check) {
			String imageFileName = goodsDAO.getImageFileName(Integer.parseInt(prdNo));
			list.add(imageFileName);
		}

		// NCP 스토리지 삭제
		objectStorageService.deleteImageFile(bucketName, "storage/", list);

		
		// DB 삭제
		goodsDAO.deleteAdminList(list);
	}

}

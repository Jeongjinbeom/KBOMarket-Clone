package admin.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import admin.service.AdminService;
import admin.service.ObjectStorageService;
import goods.bean.GoodsDTO;
import goods.dao.GoodsDAO;
import user.bean.UserDTO;
import user.dao.UserDAO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private GoodsDAO goodsDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	// 네이버 클라우드
	@Autowired
	private ObjectStorageService objectStorageService;

	private String bucketName = "bitcamp-9th-bucket-138";

	@Autowired
	private HttpSession session;
	
	
	@Override
	public void goodsWrite(List<GoodsDTO> imageUploadList) {
		
		
		goodsDAO.goodsWrite(imageUploadList);
	
	
	}

	@Override
	public List<GoodsDTO> getAdminList() {
		return goodsDAO.getAdminList();
	}

	
	// 회원가입된 유저 목록 가져가기
	@Override
	public List<UserDTO> getAdminUserList() {
		
		return userDAO.getAdminUserList();
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

	
	// 조회수별 데이터 가져오기
	@Override
	public List<GoodsDTO> getIndexList() {
		
		return goodsDAO.getIndexList();
	}

	@Override
	public GoodsDTO getAdminUpdateList(String prdNo) {
		
		return goodsDAO.getAdminUpdateList(prdNo);
	}

	@Override
	public void adminUpdate(GoodsDTO goodsDTO, MultipartFile imageFile) {
		String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
		
		GoodsDTO dto = goodsDAO.getAdminUpdateList(goodsDTO.getPrdNo()+"");
		
		
		
		String imageFileName;
		
		if(imageFile.getSize() != 0) {
			imageFileName = dto.getImageFileName();
			
			// NCP 이미지 삭제
			objectStorageService.adminDeleteImageFile(bucketName, "storage/", imageFileName);
			
			// 이미지 업로드
			imageFileName = objectStorageService.uploadFile(bucketName, "storage/", imageFile);
			
			String imageOriginalFileName = imageFile.getOriginalFilename();
			File file = new File(filePath, imageOriginalFileName);
			
			try {
				imageFile.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			goodsDTO.setImageFileName(imageFileName);
			goodsDTO.setImageOriginalFileName(imageOriginalFileName);
			
		}else {
			goodsDTO.setImageFileName(dto.getImageFileName());
			goodsDTO.setImageOriginalFileName(dto.getImageOriginalFileName());
		}
		
		System.out.println("파일 UUID : " + goodsDTO.getImageFileName());
		System.out.println("파일 원래이름 : " + goodsDTO.getImageOriginalFileName());
		
		
		goodsDAO.adminUpdate(goodsDTO);
		
	}

	

}

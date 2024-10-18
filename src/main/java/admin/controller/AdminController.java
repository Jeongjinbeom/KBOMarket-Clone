package admin.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.service.AdminService;
import admin.service.ObjectStorageService;
import goods.bean.GoodsDTO;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 네이버 클라우드
	@Autowired
	private ObjectStorageService objectStorageService; 	
	
	private String bucketName = "bitcamp-9th-bucket-138";
	
	
	@RequestMapping(value="admin/admin")
	public String admin() {
		
		return "admin/admin";
	}
	
	@RequestMapping(value="admin/adminGoodsWriteForm")
	public String adminGoodsWriteForm() {
		
		return "admin/adminGoodsWriteForm";

	}
	
	@RequestMapping(value="admin/adminList")
	public ModelAndView adminList() {
		List<GoodsDTO> list = adminService.getAdminList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("admin/adminList");
			
		return mav;
	}
	
	
	
	@RequestMapping(value="admin/goodsWrite", method = RequestMethod.POST, produces="text/html; charset=UTF-8")
	@ResponseBody
	public String goodsWrite(@ModelAttribute GoodsDTO goodsDTO,
            @RequestParam("imageFile") List<MultipartFile> list,
            HttpSession session) {
		
		 String filePath = session.getServletContext().getRealPath("WEB-INF/storage");
	     System.out.println("실제 폴더 = " + filePath);
	      
	     String imageFileName;
	     String imageoriginalFileName;
	     File file;
	     String result = "";
		
	     List<GoodsDTO> imageUploadList = new ArrayList<GoodsDTO>();
	     
	     for(MultipartFile img : list) {
	    	 
	    	 
	    	 // 네이버 클라우드 스토리지
	    	 imageFileName = objectStorageService.uploadFile(bucketName, "storage/", img);
	    	 
	    	 
	    	 imageoriginalFileName = img.getOriginalFilename();
	         file = new File(filePath, imageoriginalFileName);
	         
	         try {
	         img.transferTo(file);
	         } catch (IllegalStateException e) {
	         e.printStackTrace();
	         } catch (IOException e) {
	         e.printStackTrace();
	         }
	         
	         GoodsDTO dto = new GoodsDTO();
	               

	         dto.setTeamId(goodsDTO.getTeamId());
	         dto.setCtg(goodsDTO.getCtg());
	         dto.setPrdName(goodsDTO.getPrdName());
	         dto.setPrdPrice(goodsDTO.getPrdPrice());
	         dto.setPrdSize(goodsDTO.getPrdSize());
	         dto.setQty(goodsDTO.getQty());
	         dto.setImageFileName(imageFileName);
	         dto.setImageOriginalFileName(imageoriginalFileName);
	         
	         imageUploadList.add(dto);
	         result="상품이 등록되었습니다.";
	     }
	     
	     adminService.goodsWrite(imageUploadList);

		
		return result;
	}
	
	 @RequestMapping(value="admin/deleteAdminList", produces = "text/html; charset=UTF-8")
	 public String deleteAdminList(@RequestParam String[] check) {
		 adminService.deleteAdminList(check);
		 return "redirect:adminList";
	 }
	 
	 @RequestMapping(value="admin/adminUpdateForm", produces = "text/html; charset=UTF-8")
	 public String adminUpdateForm(@RequestParam String prdNo, Model model) {
		 
		 GoodsDTO goodsDTO = adminService.getAdminUpdateList(prdNo);
		 
		 model.addAttribute("goodsDTO", goodsDTO);
		 
		 return "admin/adminUpdateForm";
	 }
	 
	 @RequestMapping(value="admin/adminUpdate", produces = "text/html; charset=UTF-8")
	 @ResponseBody
	 public String adminUpdate(@ModelAttribute GoodsDTO goodsDTO,
			 				   @RequestParam("imageFile") MultipartFile imageFile) {
		 
		 adminService.adminUpdate(goodsDTO, imageFile);
		 
		 return "상품이 수정되었습니다.";
	 }
	
}

package goods.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import goods.bean.GoodsDTO;
import goods.bean.ReviewDTO;
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
	public String goodsDetail(@RequestParam(required=false, defaultValue="1") String pg, 
								@RequestParam String prdNo, Model model,
								HttpServletRequest request,
								HttpServletResponse response) {
		
		/*쿠키삭제
		Cookie cookieToDelete = new Cookie("viewedProducts", null);
		cookieToDelete.setMaxAge(0); // 만료 시간을 0으로 설정
		cookieToDelete.setPath("/"); // 쿠키의 경로 설정 (모든 경로에서 삭제)
		response.addCookie(cookieToDelete); // 쿠키 삭제 요청
		*/
		
		//조회수 증가
	    Cookie[] cookies = request.getCookies();
	    Set<String> viewedProducts = new HashSet<>();
	    
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	        	System.out.println("cookieName : " + cookie.getName());
	            if (cookie.getName().equals("viewedProducts")) {
	            	try {
	                    // 쿠키 값을 URL 디코딩
	                    String decodedValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
	                    System.out.println("Decoded Value: " + decodedValue); // 디코딩 후 출력
	                    String[] productIds = decodedValue.split(",");
	                    viewedProducts.addAll(Arrays.asList(productIds));
	                    System.out.println("Arrays.asList(productIds) : " + Arrays.asList(productIds));
	                } catch (UnsupportedEncodingException e) {
	                    e.printStackTrace(); // 오류 처리
	                }
	            }
	        }
	    }
	    
	    // 조회수 증가 여부 판단
	    if (!viewedProducts.contains(prdNo)) {
	        // 조회수 증가
	        goodsService.updateViews(prdNo);
	        
	        // 쿠키에 상품 ID 추가
	        viewedProducts.add(prdNo);
	        try {
	            // URL 인코딩 적용
	        	String valueToEncode = String.join(",", viewedProducts);
	        	String encodedValue = URLEncoder.encode(valueToEncode, "UTF-8");
	            Cookie viewedProductsCookie = new Cookie("viewedProducts", encodedValue);
	            viewedProductsCookie.setMaxAge(60 * 60 * 24); // 1일 동안 유지
	            response.addCookie(viewedProductsCookie);
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace(); // 오류 처리
	        }
	    }
		
		//상품
		GoodsDTO goodsDTO = goodsService.getGoods(prdNo);
		
		//리뷰(list, reviewPaging, total)
		Map<String, Object> map = goodsService.getReviewCount(prdNo, pg);
		//리뷰 작성자 이름
		List<String> userNames = new ArrayList<>(); 
		
		//리뷰리스트
		List<ReviewDTO> reviewList = (List<ReviewDTO>) map.get("list");
		for(ReviewDTO list : reviewList) {
			String userName = goodsService.getUserName(list.getUserId());			
			userNames.add(userName);
		}
		
		//상품사이즈 카테고리
		String prdSize = goodsDTO.getPrdSize();
		String[] sizesArray;
		
		if (prdSize != null && !prdSize.isEmpty()) {
		    sizesArray = prdSize.split(","); // ,로 나누기
		} else {
		    sizesArray = new String[]{"Original"}; // Original 배열 초기화
		}
		
		
		model.addAttribute("dto", goodsDTO);
		model.addAttribute("sizesArray", sizesArray); // 배열 추가
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("map", map); //list, reviewPaging, total
		model.addAttribute("userNames", userNames);
		
		model.addAttribute("pg", pg);
		
		return "goods/goodsDetail";
	}
	
	@RequestMapping(value="goodsReview", method=RequestMethod.GET)
	public String goodsReview(@RequestParam(required=false, defaultValue="1") String pg, @RequestParam String prdNo, Model model) {
		
		//리뷰(list, reviewPaging, total)
		Map<String, Object> map = goodsService.getReviewCount(prdNo, pg);
		
		//리뷰 작성자 이름
		List<String> userNames = new ArrayList<>(); 

		//리뷰 리스트
		List<ReviewDTO> reviewList = (List<ReviewDTO>) map.get("list");
		for(ReviewDTO list : reviewList) {
			String userName = goodsService.getUserName(list.getUserId());			
			userNames.add(userName);
		}

		model.addAttribute("reviewList", reviewList);
		model.addAttribute("map", map); //list, reviewPaging, total
		model.addAttribute("userNames", userNames);
		
		model.addAttribute("pg", pg);
		
		return "goods/reviewForm";
	}
	
	
	@RequestMapping(value="reviewLike", method=RequestMethod.POST)
	@ResponseBody
	public void reviewLike(@RequestParam Integer reviewNo) {
		goodsService.reviewLike(reviewNo);
	}
}

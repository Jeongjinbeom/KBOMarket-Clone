package goods.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoodsDTO {
	private int prdNo; // 상품번호
	private int teamId; // 구단이름
	private String ctg; // 상품 카테고리
	private String prdName; // 상품명
	private int prdPrice; // 상품 가격
	private String prdSize; // 상품 사이즈
	private int qty; // 상품 개수
	private String imageFileName; // UUID 이미지 이름
	private String imageOriginalFileName; // 파일 원래 이름
	private Date regDate; // 생성날자
	private int views; // 조회수
}

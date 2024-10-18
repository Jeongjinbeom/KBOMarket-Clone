package goods.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDTO {
	private int ordNo; //구매번호
	private String userId; //회원아이디
	private int prdNo; //상품번호
	private int orderPrice; //상품가격 추가
	private String orderSize; //상품사이즈
	private String name; // 아이디
	private String tel; //휴대폰번호
	private String zipcode; //우편번호
	private String addr1; //도로명주소
	private String addr2; //상세주소
	private int qty; //상품개수
	private Date regDate; //구매날짜
}

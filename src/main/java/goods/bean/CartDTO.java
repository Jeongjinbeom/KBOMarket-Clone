package goods.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartDTO {
	private int cartNo; // 장바구니번호
	private String userId; //회원아이디
	private int prdNo; //상품번호
	private int orderPrice; //상품가격 추가
	private String orderSize; //상품사이즈
	private int qty; //상품개수
	private Date regDate; //담은날짜
}

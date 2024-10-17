package goods.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewDTO {
	private int reviewNo; // 후기번호
	private int prdNo; // 상품번호
	private String userId; // 회원아이디
	private String reviewTitle; // 후기제목
	private String reviewContent; // 후기내용
	private int likes; // 후기 좋아요 수
	private Date regDate; // 등록날짜
}

package goods.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoodsDTO {
	private int prdNo;
	private int teamId;
	private String ctg;
	private String prdName;
	private int prdPrice;
	private String prdSize;
	private String playerName;
	private int qty;
	private String imageFileName;
	private String imageOriginalFileName;
	private Date regDate;
	private int views;
}

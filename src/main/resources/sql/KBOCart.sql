#장바구니테이블

CREATE TABLE KBOCart (
	cartNo INT PRIMARY KEY AUTO_INCREMENT, -- 장바구니번호
	prdNo INT NOT NULL, -- 상품번호
	userId VARCHAR(100) NOT NULL, -- 회원아이디
	qty INT DEFAULT 1 CHECK (qty > 0), -- 개수
	regDate DATETIME DEFAULT CURRENT_TIMESTAMP, -- 등록날짜
	
	FOREIGN KEY (prdNo) REFERENCES KBOGoods(prdNo),
	FOREIGN KEY (userId) REFERENCES KBOUser(userId)
);
#구매테이블

CREATE TABLE KBOOrder (
	ordNo INT PRIMARY KEY AUTO_INCREMENT, -- 구매번호
	prdNo INT NOT NULL, -- 상품번호
	userId VARCHAR(100) NOT NULL, -- 회원아이디
	qty INT NOT NULL CHECK (qty > 0), -- 상품개수
	regDate DATETIME DEFAULT CURRENT_TIMESTAMP, -- 구매날짜
	
	FOREIGN KEY (prdNo) REFERENCES KBOGoods(prdNo),
	FOREIGN KEY (userId) REFERENCES KBOUser(userId)
);
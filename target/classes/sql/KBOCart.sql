#장바구니테이블

CREATE TABLE KBOCart (
	cartNo INT PRIMARY KEY AUTO_INCREMENT, -- 장바구니번호
	userId VARCHAR(100) NOT NULL, -- 회원아이디
	prdNo INT NOT NULL, -- 상품번호
	orderPrice INT NOT NULL, -- 상품가격 (추가)
	orderSize VARCHAR(50), -- 상품사이즈
	qty INT NOT NULL CHECK (qty > 0), -- 상품개수
	regDate DATETIME DEFAULT CURRENT_TIMESTAMP, -- 담은날짜
	
	FOREIGN KEY (prdNo) REFERENCES KBOGoods(prdNo),
	FOREIGN KEY (userId) REFERENCES KBOUser(userId)
);
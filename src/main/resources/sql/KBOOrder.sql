#구매테이블

CREATE TABLE KBOOrder (
	ordNo INT PRIMARY KEY AUTO_INCREMENT, -- 구매번호
	userId VARCHAR(100) NOT NULL, -- 회원아이디
	prdNo INT NOT NULL, -- 상품번호
	orderPrice INT NOT NULL, -- 상품가격 (추가)
	orderSize VARCHAR(50), -- 상품사이즈
	name VARCHAR(100), -- 아이디
	tel VARCHAR(15), -- 휴대폰번호
	zipcode VARCHAR(30), -- 우편번호
	addr1 VARCHAR(255), -- 도로명주소
	addr2 VARCHAR(255), -- 상세주소
	qty INT NOT NULL CHECK (qty > 0), -- 상품개수
	regDate DATETIME DEFAULT CURRENT_TIMESTAMP, -- 구매날짜
	
	FOREIGN KEY (prdNo) REFERENCES KBOGoods(prdNo),
	FOREIGN KEY (userId) REFERENCES KBOUser(userId)
);
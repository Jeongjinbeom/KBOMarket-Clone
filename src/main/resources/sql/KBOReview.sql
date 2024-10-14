#후기테이블

CREATE TABLE KBOReview(
	reviewNo INT PRIMARY KEY AUTO_INCREMENT, -- 후기번호
	prdNo INT NOT NULL, -- 상품번호
	userId VARCHAR(100) NOT NULL, -- 회원아이디
	reviewTitle VARCHAR(200), -- 후기제목
	reviewContent TEXT NOT NULL, -- 후기내용
	likes INT DEFAULT 0, -- 후기 좋아요 수
	regDate DATETIME DEFAULT CURRENT_TIMESTAMP, -- 등록날짜
	
	FOREIGN KEY (prdNo) REFERENCES KBOGoods(prdNo),
	FOREIGN KEY (userId) REFERENCES KBOUser(userId)
);
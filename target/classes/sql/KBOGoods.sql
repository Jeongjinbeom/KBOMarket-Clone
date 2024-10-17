#상품테이블

CREATE TABLE KBOGoods (
	prdNo INT PRIMARY KEY AUTO_INCREMENT, -- 상품번호
	teamId INT NOT NULL, -- 야구구단이름
	ctg VARCHAR(100) NOT NULL, -- 상품 카테고리
	prdName VARCHAR(200) NOT NULL, -- 상품명
	prdPrice DECIMAL(10, 2) NOT NULL CHECK (prdPrice >= 0), -- 상품가격
	prdSize VARCHAR(50) DEFAULT 'original', -- 상품사이즈
	qty INT DEFAULT 0, -- 상품개수
    imageFileName VARCHAR(100) not null,
	imageOriginalFileName VARCHAR(100) not null,
	regDate DATETIME DEFAULT CURRENT_TIMESTAMP, -- 등록날짜
	views INT DEFAULT 0, -- 조회수
	
	FOREIGN KEY (teamId) REFERENCES KBOTeam(teamId)
);
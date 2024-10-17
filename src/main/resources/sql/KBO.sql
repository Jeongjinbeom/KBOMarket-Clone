## MySQL

#회원테이블
DROP TABLE KBOUser;
CREATE TABLE KBOUser (
	userId VARCHAR(100) PRIMARY KEY, -- 이름
	name VARCHAR(100), -- 아이디
	pwd VARCHAR(200), -- 비밀번호
	email VARCHAR(200) NOT NULL UNIQUE, -- 이메일
	tel VARCHAR(15), -- 휴대폰번호
	zipcode VARCHAR(30), -- 우편번호
	addr1 VARCHAR(255), -- 도로명주소
	addr2 VARCHAR(255), -- 상세주소
	regDate DATETIME DEFAULT CURRENT_TIMESTAMP -- 등록날짜
);

#구단테이블
DROP TABLE KBOTeam;
CREATE TABLE KBOTeam (
	teamId INT PRIMARY KEY,
	teamAbbr VARCHAR(50) NOT NULL,  -- 팀 약자
	teamName VARCHAR(100) NOT NULL UNIQUE    -- 팀 전체 이름
);

INSERT INTO KBOTeam (teamId, teamAbbr, teamName) VALUES 
(1, 'TWINS', 'LG 트윈스'),
(2, 'WIZ', 'KT 위즈'),
(3, 'LANDERS', 'SSG 랜더스'),
(4, 'DINAS', 'NC 다이노스'),
(5, 'BEARS', '두산 베어스'),
(6, 'TIGERS', 'KIA 타이거즈'),
(7, 'GIANTS', '롯데 자이언츠'),
(8, 'LIONS', '삼성 라이온즈'),
(9, 'EAGLES', '한화 이글스'),
(10, 'HEROES', '키움 히어로즈')
ON DUPLICATE KEY UPDATE
teamAbbr = VALUES(teamAbbr), teamName = VALUES(teamName);

#상품테이블
DROP TABLE KBOGoods;
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

#후기테이블
DROP TABLE KBOReview;
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

#장바구니테이블
DROP TABLE KBOCart;
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

#구매테이블
DROP TABLE KBOOrder;
CREATE TABLE KBOOrder (
	ordNo INT PRIMARY KEY AUTO_INCREMENT, -- 구매번호
	userId VARCHAR(100) NOT NULL, -- 회원아이디
	prdNo INT NOT NULL, -- 상품번호
	orderPrice INT NOT NULL, -- 상품가격 (추가)
	orderSize VARCHAR(50), -- 상품사이즈
	qty INT NOT NULL CHECK (qty > 0), -- 상품개수
	regDate DATETIME DEFAULT CURRENT_TIMESTAMP, -- 구매날짜
	
	FOREIGN KEY (prdNo) REFERENCES KBOGoods(prdNo),
	FOREIGN KEY (userId) REFERENCES KBOUser(userId)
);
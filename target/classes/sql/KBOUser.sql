#회원테이블

## MySQL
CREATE TABLE KBOUser (
	userId VARCHAR(100) PRIMARY KEY, -- 이름
	name VARCHAR(100), -- 아이디
	pwd VARCHAR(200), -- 비밀번호
	email VARCHAR(200) NOT NULL UNIQUE, -- 이메일
	tel VARCHAR(15), -- 휴대폰번호
	addr1 VARCHAR(255), -- 도로명주소
	addr2 VARCHAR(255), -- 상세주소
	regDate DATETIME DEFAULT CURRENT_TIMESTAMP -- 등록날짜
);

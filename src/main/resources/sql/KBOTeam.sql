#구단테이블

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
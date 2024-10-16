<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KBO마켓 : 로그인</title>
<link rel="stylesheet" href="../css/writeForm.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
<section>
	<div class="location_cont">
	      <em><a href="#" class="local_home">HOME</a> &gt; 로그인</em>
	</div>
	<hr>
</section>
<section>
    <div>
    <!-- 실선 아래 간격 조절  -->
    	<div class="sub_content"></div>
    	 <div class="signup-container">
        <h1>로그인</h1>
        <form action="#" method="post" class="signup-form">
            <div class="signup-form-group">
                <label for="userId" class="signup-label">아이디</label>
                <input type="text" id="userId" name="userId" required class="signup-input" style="width: 100%; max-width: 400px;">
                <input type="hidden" id="checkid" value="">
            </div>
            <div class="signup-form-group">
                <label for="pwd" class="signup-label">비밀번호</label>
                <input type="password" id="pwd" name="pwd" required class="signup-input" style="width: 100%; max-width: 350px;">
            </div>
            
            <div class="signup-btn-group">
                <button type="button" class="signup-btn signup-btn-secondary">회원가입</button>
                <button type="submit" class="signup-btn signup-btn-primary">로그인</button>
            </div>
        </form>
 		</form>
 		
	</div>
	<!-- 아래 간격 조절  -->
	<div>
    	<div class="sub_content"></div>
	</div>
</section>

	<footer>
		<span id="footerFont"> (주)비트캠프코리아 서울특별시 강남구 비트캠프 602호<br>
			대표 : 김세현 &emsp; 사업자등록번호 : 200-65-30201 &emsp; 통신판매업신고번호 : 제
			2024-서울비트캠프-2770호 &emsp; 개인정보관리자 : 신재영<br> 대표번호 : 1234-5678
			&emsp; 팩스번호 : 02-1234-5678 &emsp; 메일 : bitcamp@bit.co.kr &emsp; 호스팅제공
			: 비트캠프스(주)<br> copyright. 2024. www.bitcampket.com. All rights
			reserved.<br>
		</span>
	</footer>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/writeForm.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KBO마켓 : 회원탈퇴</title>
<link rel="stylesheet" href="../css/deleteForm.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
<section>
	<div class="location_cont">
	      <em><a href="/KBOMarket/" class="local_home">HOME</a> &gt; 마이페이지 &gt; 회원탈퇴</em>
	</div>
	<hr>
</section>
<section>
    <div>
    <!-- 실선 아래 간격 조절  -->
    	<div class="sub_content"></div>
    	 <div class="signup-container">
	        <h1>회원탈퇴</h1>
	        <form class="signup-form" id="userDeleteForm" name="userDeleteForm">
	            <div class="signup-form-group">
	                <label for="pwd">비밀번호 확인</label>
	  			</div>
	                <input type="password" id="pwd" name="pwd" class="signup-input" style="width: 100%; max-width: 250px;" placeholder="비밀번호를 입력하세요.">
	                 <div id="checkDiv"></div>
	           
	            <div class="signup-form-group">
	                <label for="deletecomment">탈퇴 사유</label>
	            </div>
	                <textarea style="width: 100%; max-width: 250px; height: 200px;"class="signup-input" placeholder="탈퇴사유를 입력하세요."></textarea>
	            <div class="signup-btn-group">
	                <input type="button" class="signup-btn signup-btn-secondary" onclick="location.href='/KBOMarket/'" value="홈"/>
	            </div>
	            <div class="signup-btn-group">
	                <button type="button" class="signup-btn signup-btn-primary" id="deleteBtn">회원탈퇴</button>    
	            </div>
	        </form>	
		</div>
	</div>
	<!-- 아래 간격 조절  -->
	<div class="sub_content"></div>
</section>

	<footer id="footer">
		<span id="footerFont"> (주)비트캠프코리아 서울특별시 강남구 비트캠프 602호<br>
			대표 : 김세현 &emsp; 사업자등록번호 : 200-65-30201 &emsp; 통신판매업신고번호 : 제
			2024-서울비트캠프-2770호 &emsp; 개인정보관리자 : 신재영<br> 대표번호 : 1234-5678
			&emsp; 팩스번호 : 02-1234-5678 &emsp; 메일 : bitcamp@bit.co.kr &emsp; 호스팅제공
			: 비트캠프스(주)<br> copyright. 2024. www.bitcampket.com. All rights
			reserved.<br>
		</span>
	</footer>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/deleteForm.js"></script>

</body>
</html>

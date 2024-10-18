<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KBO마켓 : 회원가입</title>
<link rel="stylesheet" href="../css/writeForm.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
<section>
	<div class="location_cont">
	      <em><a href="#" class="local_home">HOME</a> &gt; 회원가입 &gt; 정보입력</em>
	</div>
	<hr>
</section>
<section>
	<!-- 실선 아래 간격 조절  -->
    <div class="sub_content"></div>
    
    <div class="signup-container">
        <h1>회원가입</h1>
        <form class="signup-form" id="userWriteForm" name="userWriteForm">
        	<div class="signup-form-group">
                <label for="userId" class="signup-label">아이디</label>
                <input type="text" id="userId" name="userId" required class="signup-input" style="width: 100%; max-width: 400px;">
            	<div id="userIdDiv"></div>
            </div>
            <div class="signup-form-group">
                <label for="pwd" class="signup-label">비밀번호</label>
                <input type="password" id="pwd" name="pwd" required class="signup-input" style="width: 100%; max-width: 350px;">
            	<div id="pwdDiv"></div>
            </div>
            <div class="signup-form-group">
                <label for="repwd" class="signup-label">비밀번호확인</label>
                <input type="password" id="repwd" required class="signup-input" style="width: 100%; max-width: 350px;">
           		<div id="repwdDiv"></div>
            </div>
            <div class="signup-form-group">
                <label for="name" class="signup-label">이름</label>
                <input type="text" id="name" name="name" required class="signup-input"  style="width: 100%; max-width: 350px;">
                <div id="nameDiv"></div>
            </div>
            
            <div class="signup-form-group">
                <label for="email" class="signup-label">이메일</label>
                <input type="text" id="email" name="email" required class="signup-input"  style="width: 100%; max-width: 320px;">
                <input type="button" id="sendVerificationBtn" value="인증번호 발송" class="signup-btn signup-btn-secondary">
                <div id="emailDiv"></div>
            </div> 
            
            <div class="signup-form-group">
                <label for="verificationCode" class="signup-label">이메일 인증</label>
                <input type="text" id="verificationCode" required class="signup-input" style="width: 100%; max-width: 320px;"> 
                <input type="button" id="verifyCodeBtn" value="인증번호 확인" class="signup-btn signup-btn-secondary" required>
                <div id="emailcheckDiv"></div>
            </div>

  
            <div class="signup-form-group">
                <label for="tel" class="signup-label">휴대폰번호</label>
                <input type="text" id="tel" name="tel" required class="signup-input" style="width: 100%; max-width: 350px;">
            </div>
            
            <div class="signup-form-group">
                <label for="phone" class="signup-label">주소</label>
                <input type="text" name="zipcode" id="zipcode" size="6" required class="signup-input" style="width: 100%; max-width: 250px;"/>
                <input type="button" value="우편번호 검색" onclick="checkPost(); return false;" class="signup-btn signup-btn-secondary">
			</div>
			<div class="signup-form-group">
                <input type="text" id="addr1" name="addr1" placeholder="주소"
              		readonly required class="signup-input" style="width: 100%; max-width: 550px;">
            </div>
            <div class="signup-form-group">
              	<input type="text"id="addr2" name="addr2" placeholder="상세주소" 
              	required class="signup-input" style="width: 100%; max-width: 550px;">
            </div>
            
            <div class="signup-btn-group">
                <button type="reset" class="signup-btn signup-btn-secondary">취소</button>
                <button class="signup-btn signup-btn-primary" id="joinBtn">회원가입</button>
            </div>
        </form>
    </div>
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
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script type="text/javascript" src="../js/writeForm.js"></script>
<!-- 우편번호 -->
<script>
function checkPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 
            
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById('addr1').value = addr;
            document.getElementById('addr2').focus();
        }
    }).open();
}
</script>

<script type="text/javascript">

</script>
</body>
</html>
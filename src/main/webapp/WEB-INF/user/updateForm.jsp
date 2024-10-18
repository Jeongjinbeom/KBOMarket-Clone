<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KBO마켓 : 회원정보수정</title>
<link rel="stylesheet" href="../css/updateForm.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/myPage.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
<section>
	<div class="location_cont">
	      <em><a href="/KBOMarket/" class="local_home">HOME</a> &gt; 마이페이지 &gt; 회원정보수정</em>
	</div>
	<hr>
</section>
	<jsp:include page="./myPage.jsp" />
<section>
	<!-- 실선 아래 간격 조절  -->
    <div class="sub_content"></div>
    
    <div class="signup-container">
        <h1>회원정보수정</h1>
        <form class="signup-form" id="userUpdateForm" name="userUpdateForm">
        	<div class="signup-form-group">
                <label for="userId" class="signup-label">아이디</label>
                <input type="text" id="userId" name="userId" value="${userDTO.userId}" required class="signup-input" style="width: 100%; max-width: 400px;" readonly>
                
            	<div id="userIdDiv"></div>
            </div>
            <div class="signup-form-group">
                <label for="pwd" class="signup-label">비밀번호</label>
                <input type="password" id="pwd" name="pwd" value="${userDTO.pwd}"class="signup-input" style="width: 100%; max-width: 350px;">
            	<div id="pwdDiv"></div>
            </div>
            <div class="signup-form-group">
                <label for="repwd" class="signup-label">비밀번호확인</label>
                <input type="password" id="repwd" class="signup-input" style="width: 100%; max-width: 350px;">
           		<div id="repwdDiv"></div>
            </div>
            <div class="signup-form-group">
                <label for="name" class="signup-label">이름</label>
                <input type="text" id="name" name="name" value="${userDTO.name }" class="signup-input"  style="width: 100%; max-width: 350px;">
                <div id="nameDiv"></div>
            </div>
            
            <div class="signup-form-group">
                <label for="email" class="signup-label">이메일</label>
                <input type="text" id="email" name="email" readonly value="${userDTO.email }"required class="signup-input"  style="width: 100%; max-width: 350px;">
                <!-- <input type="button" id="sendVerificationBtn" value="인증번호 발송" class="signup-btn signup-btn-secondary"> -->
                <div id="emailDiv"></div>
            </div> 
            
            <!-- <div class="signup-form-group">
                <label for="verificationCode" class="signup-label">이메일 인증</label>
                <input type="text" id="verificationCode" required class="signup-input" style="width: 100%; max-width: 320px;"> 
                <input type="button" id="verifyCodeBtn" value="인증번호 확인" class="signup-btn signup-btn-secondary" required>
                <div id="emailcheckDiv"></div>
            </div> -->

  
            <div class="signup-form-group">
                <label for="tel" class="signup-label">휴대폰번호</label>
                <input type="text" id="tel" name="tel" value="${userDTO.tel}" class="signup-input" style="width: 100%; max-width: 350px;">
            </div>
            
            <div class="signup-form-group">
                <label for="phone" class="signup-label">주소</label>
                <input type="text" name="zipcode" id="zipcode" value="${userDTO.zipcode}" size="6" class="signup-input" style="width: 100%; max-width: 250px;"/>
                <input type="button" value="우편번호 검색" onclick="checkPost(); return false;" class="signup-btn signup-btn-secondary">
			</div>
			<div class="signup-form-group">
                <input type="text" id="addr1" name="addr1" placeholder="주소" value="${userDTO.addr1}"
              		  class="signup-input" style="width: 100%; max-width: 550px;">
            </div>
            <div class="signup-form-group">
              	<input type="text"id="addr2" name="addr2" placeholder="상세주소" value="${userDTO.addr2}"
              	class="signup-input" style="width: 100%; max-width: 550px;">
            </div>
            
            <div class="signup-btn-group">
                <input type="reset" class="signup-btn signup-btn-secondary" value="취소"/>
                <input type="button" class="signup-btn signup-btn-primary" id="updateBtn" value="회원정보수정"/>
                <input type="button" class="signup-btn signup-btn-third" id="deleteBtn" value="회원탈퇴" onclick="location.href='/KBOMarket/user/deleteForm'"/>
            </div>
        </form>
    </div>
    <div>
    	<div class="sub_content"></div>
	</div>
	</section>

<section class="menuList">
       <div class="menu-container">
           <div class="menu-column">
               <h3>ABOUT US</h3>
               <ul>
                   <li>회사소개</li>
                   <li>이용안내</li>
                   <li>공지사항</li>
                   <li>광고/제휴 문의</li>
               </ul>
           </div>
           <div class="menu-column">
               <h3>MEMBER</h3>
               <ul>
                   <li>로그인</li>
                   <li>회원가입</li>
                   <li>아이디찾기</li>
                   <li>비밀번호찾기</li>
               </ul>
           </div>
           <div class="menu-column">
               <h3>MYPAGE</h3>
               <ul>
                   <li>주문목록/배송조회</li>
                   <li>취소/반품/교환 내역</li>
                   <li>환불/입금 내역</li>
                   <li>찜리스트</li>
               </ul>
           </div>
           <div class="menu-column">
               <h3>HELP</h3>
               <ul>
                   <li>1:1문의</li>
                   <li>FAQ</li>
                   <li>상품문의</li>
                   <li>고객센터</li>
               </ul>
           </div>
       </div>
   </section>

<jsp:include page="../footer.jsp"></jsp:include>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script type="text/javascript" src="../js/updateForm.js"></script>
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
</body>
</html>
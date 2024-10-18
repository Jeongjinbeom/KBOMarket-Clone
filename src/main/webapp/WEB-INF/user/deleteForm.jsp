<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KBO마켓 : 회원정보수정</title>
<link rel="stylesheet" href="../css/deleteForm.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/myPage.css">
<head>
<body>
	<jsp:include page="../header.jsp" />
<section>
	<div class="location_cont">
	      <em><a href="/KBOMarket/" class="local_home">HOME</a> &gt; 마이페이지 &gt; 회원탈퇴</em>
	</div>
	<hr>
</section>
<section>
<jsp:include page="./myPage.jsp" />
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
	                <input type="password" id="pwd" name="pwd" class="signup-input" style="width: 100%; max-width: 300px;" placeholder="비밀번호를 입력하세요.">
	                 <div id="checkDiv"></div>
	           
	            <div class="signup-form-group">
	                <label for="deletecomment">탈퇴 사유</label>
	            </div>
	                <textarea style="width: 100%; max-width: 300px; height: 200px;"class="signup-input" placeholder="탈퇴사유를 입력하세요."></textarea>
	            <div class="signup-btn-group">
	                <button type="button" class="signup-btn signup-btn-primary" id="deleteBtn">회원탈퇴</button>    
	            </div>
	            <div class="signup-btn-group">
	                <input type="button" class="signup-btn signup-btn-secondary" onclick="location.href='/KBOMarket/'" value="홈"/>
	            </div>
	        </form>	
		</div>
	</div>
	<!-- 아래 간격 조절  -->
	<div class="sub_content"></div>
</section>
<!-- <div style="margin-bottom: 300px;"></div> -->
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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/deleteForm.js"></script>

</body>
</html>

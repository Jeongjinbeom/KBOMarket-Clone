<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KBO마켓 : 로그인</title>
<link rel="stylesheet" href="../css/loginForm.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
<section>
	<div class="location_cont">
	      <em><a href="/KBOMarket/" class="local_home">HOME</a> &gt; 로그인</em>
	</div>
	<hr>
</section>
<section>
    <div id="loginFormDiv">
    <!-- 실선 아래 간격 조절  -->
    	<div class="sub_content"></div>
    	<div style="margin-bottom: 50px;"></div>
    	 <div class="signup-container">
	        <h1>로그인</h1>
	        <form class="signup-form" id="userLoginForm" name="userLoginForm">
	            <div class="signup-form-group">
	                <label for="userId" class="signup-label">아이디</label>
	                <input type="text" id="userId" name="userId" class="signup-input" style="width: 100%; max-width: 250px;">
	                 <div id="checkidDiv"></div>
	            </div>
	            <div class="signup-form-group">
	                <label for="pwd" class="signup-label">비밀번호</label>
	                <input type="password" id="pwd" name="pwd" class="signup-input" style="width: 100%; max-width: 250px;">
		            <div id="checkpwdDiv"></div>
	            </div>
	            <div class="signup-btn-group">
	                <input type="button" class="signup-btn signup-btn-secondary" onclick="location.href='/KBOMarket/user/writeForm'" value="회원가입"/>
	                <input type="button" class="signup-btn signup-btn-primary" id="loginBtn" value="로그인"/>
	            </div>
	            <div class="signup-btn-group">
	            </div>

	        </form>	
		</div>
	</div>
	<!-- 아래 간격 조절  -->
	<div class="sub_content"></div>
</section>
<div style="margin-bottom: 100px;"></div>
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
<script type="text/javascript" src="../js/loginForm.js"></script>


</body>
</html>

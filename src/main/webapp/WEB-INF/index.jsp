<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KBO마켓</title>
<link rel="stylesheet" href="./css/index.css">
<link rel="stylesheet" href="./css/header.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <!-- 본문 -->
    <section class="imageSlider">
        <div class="slider">
            <a href="/KBOMarket/goods/goodsList?teamId=1"><img src="https://cdn-pro-web-250-211.cdn-nhncommerce.com/keienkorea5_godomall_com/data/editor/promotion/241017/36b107e510638e04ab851318c1367623_190803.jpg" alt="첫 번째 슬라이드" id="slide1"></a>
            <a href="/KBOMarket/goods/goodsList?teamId=1"><img src="https://cdn-pro-web-250-211.cdn-nhncommerce.com/keienkorea5_godomall_com/data/skin/front/awesome/img/banner/slider_511517418/56ac6e04092e2a3a456881ae42554a2a_38633.jpg" alt="두 번째 슬라이드" id="slide2"></a>
            <a href="/KBOMarket/goods/goodsList?teamId=1"><img src="https://cdn-pro-web-250-211.cdn-nhncommerce.com/keienkorea5_godomall_com/data/skin/front/awesome/img/banner/slider_511517418/2fcfbcd7db1612eccc7ec55e0655fa75_75161.jpg" alt="세 번째 슬라이드" id="slide3"></a>
        </div>
    </section>
    
    <section class="productList">
       <h2 class="weekly-best">- WEEKLY BEST -</h2>
       <div class="product-grid">
       <!-- 여기가 이제 등록한 상품 추가하는 이미지가 될것같습니다~ -->
            <c:forEach items="${list }" var="item">
		    <div class="product-item" onclick="location.href='/KBOMarket/goods/goodsDetail?prdNo=${item.prdNo}'">
		        <img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-138/storage/${item.imageFileName}" width="220" alt="${item.prdName}" title="${item.prdName}" class="middle">
		        <h3>${item.prdName}</h3>
		        <p class="price"><fmt:formatNumber pattern="#,### 원">${item.prdPrice}</fmt:formatNumber></p>
		    </div>
	    </c:forEach>
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

<jsp:include page="footer.jsp" />


</body>
</html>
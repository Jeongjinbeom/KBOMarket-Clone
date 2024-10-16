<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>KBOMarket</title>
	<link rel="stylesheet" href="../css/index.css">
	<link rel="stylesheet" href="../css/header.css">
	<link rel="stylesheet" href="../css/goodsList.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div id="goodsListDiv">
	
	<div id="history">
		<a href="/KBOMarket/">HOME</a> > 
		<select id="selectTeam" onchange="location.href='/KBOMarket/goods/goodsList?teamId=' + this.value">
			<option value="1" ${teamId == 1 ? 'selected' : ''}>LG 트윈스</option>
			<option value="2" ${teamId == 2 ? 'selected' : ''}>KT 위즈</option>
			<option value="3" ${teamId == 3 ? 'selected' : ''}>SSG 랜더스</option>
			<option value="4" ${teamId == 4 ? 'selected' : ''}>NC 다이노스</option>
			<option value="5" ${teamId == 5 ? 'selected' : ''}>두산 베어스</option>
			<option value="6" ${teamId == 6 ? 'selected' : ''}>KIA 타이거즈</option>
			<option value="7" ${teamId == 7 ? 'selected' : ''}>롯데 자이언츠</option>
			<option value="8" ${teamId == 8 ? 'selected' : ''}>삼성 라이온즈</option>
			<option value="9" ${teamId == 9 ? 'selected' : ''}>한화 이글스</option>
			<option value="10" ${teamId == 10 ? 'selected' : ''}>키움 히어로즈</option>
		</select>
	</div>
	
	<div id="teamName">
		<div class="teamName">${teamName }</div>
		<img style="width: 100%; max-width: 1200px" src="../image/${teamId }.jpg" title="${teamId }.jpg" alt="${teamId }.jpg" class="banner">
	</div>
	
	<div id="ctg">
	<c:forEach var="entry" items="${categories}">
        <span>
            <a href="/KBOMarket/goods/goodsList?teamId=${teamId}&ctg=${entry.key}" 
               class="${ctg == entry.key ? 'active' : ''}">${entry.value}</a>
        </span>
    </c:forEach>
	</div>

	<div id="productCount">
		<div class="totalGoods">상품 <span class="count">${total }</span>개</div>
		<div class="orderList">
			<select id="orderList" onchange="location.href='/KBOMarket/goods/goodsList?teamId=${teamId }&ctg=${ctg }&order='+this.value">
				<option value="regDate" ${order == 'regDate' ? 'selected' : ''}>최신순</option>
				<option value="views" ${order == 'views' ? 'selected' : ''}>인기순</option>
				<option value="prdPrice_asc" ${order == 'prdPrice_asc' ? 'selected' : ''}>낮은가격순</option>
				<option value="prdPrice_desc" ${order == 'prdPrice_desc' ? 'selected' : ''}>높은가격순</option>
			</select>
		</div>
	</div>
	
	<div id="productListDiv">
	<section class="productList">
	    <div class="product-grid">
	    
	    <c:forEach items="${list }" var="item">
		    <div class="product-item" onclick="location.href='/KBOMarket/goods/goodsDetail?prdNo=${item.prdNo}'">
		        <img src="${item.imageFileName}" width="220" alt="${item.prdName}" title="${item.prdName}" class="middle">
		        <h3>${item.prdName}</h3>
		        <p class="price">${item.prdPrice}원</p>
		    </div>
	    </c:forEach>
	    
	   </div>
	</section>
	</div>	
	
	</div>
	
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- <script type="text/javascript" src="../js/goodsList.js"></script> -->
<script type="text/javascript">
$(function(){
	
})
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KBO Market</title>

<link rel="stylesheet" href="../css/goodsList.css">

</head>
<body>
<%-- <jsp:include page="header.jsp"></jsp:include> --%>
<div id="goodsListDiv">
	<div id="filter">
		<input type="button" class="filter" value="Filter"/>
		<div class="goodsOption">
			<div class="selected">정렬기준</div>
			<div class="options">
				<div class="option"><span id="LG트윈스" class="desc">최신</span></div>
				<div class="option"><span id="hit" class="desc">인기 상품</span></div>
				<div class="option"><span id="product_price" class="desc">가격(높음)</span></div>
				<div class="option"><span id="product_price" class="asc">가격(낮음)</span></div>			
			</div>
		</div>
	</div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KBOMarket</title>
	<link rel="stylesheet" href="../css/index.css">
	<link rel="stylesheet" href="../css/header.css">
	<link rel="stylesheet" href="../css/goodsOrder.css">
	<link rel="stylesheet" href="../css/orderForm.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	
<div id="history">
	<a href="/KBOMarket/">HOME</a>
	<span> > </span>
	<span>장바구니</span>
</div>

<div id="orderDiv">
	<div id="uorderTitle">장바구니</div>
	<form id="uploadDeleteForm">
	<input type="button" id="delBtn" class="false" value="편집" onclick="toggleCheckboxes()"/>
	
	<div id="detailOrderDiv">
		<table>
			<tr>
				<th>
					<input type="checkbox" id="allDeleteBtn" class="deleteBtn" style="display: none;" onclick="toggleAll(this)"/>
				</th>
				<th colspan="2">
					<label for="allDeleteBtn">상품/옵션 정보</label>
				</th>
				<th>수량</th>
				<th>상품금액</th>
			</tr>
	<c:if test="${cartDTO !=null }">
	<c:forEach items="${cartDTO }" var="data"  varStatus="status">
			
	<tr>
		<td>
		<input type="checkbox" name="seq" value="${data.cartNo }" id="${data.cartNo }" style="display: none;" class="deleteBtn" value="${data.cartNo }"  onclick="updateAllCheckbox(this)"/>
		</td>
		<td class="img">
		<label for="${data.cartNo }">
			<img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-138/storage/${goodsDTO[status.index].imageFileName}" id="orderPrdImage"/>
		</label>
		</td>
		
		
		<td class="prdname">
			<span class="prdname">${goodsDTO[status.index].prdName }</span><br>
			<span class="option">옵션 ${data.orderSize }</span></td>
		<td>${data.qty }</td>
		<td><fmt:formatNumber pattern="#,### 원">${data.orderPrice }</fmt:formatNumber></td>
	</tr>
		
	</c:forEach>
	</c:if>
		</table>
		<input type="button" id="deleteBtn" value="삭제하기" style="display: none;"/>
	</div>
	
	</form>
</div>

<div style="margin-bottom: 300px;"></div>
<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="../js/cartForm.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KBOMarket</title>
	<link rel="stylesheet" href="../css/index.css">
	<link rel="stylesheet" href="../css/header.css">
	<link rel="stylesheet" href="../css/goodsDetail.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div id="goodsDetailDiv">

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
	
	
	<div id="detailDiv1">
		<div id="detailImage"><img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-138/storage/${dto.imageFileName }" class="detailImg"/></div>
		<div id="detailContent">
			<div class="views">조회수 ${dto.views }</div>
			<div class="title"><pre>${dto.prdName }</pre></div>
			<div class="tr" id="price"><span class="firsttd">판매가</span><span class="price">${dto.prdPrice } 원</span></div>
			<div class="tr"><span class="firsttd">사이즈</span>${dto.prdSize }</div>
			<div class="tr" id="prdNo"><span class="firsttd">상품코드</span>${ dto.prdNo}</div>
			
			
			<div class="selectSize">
			    <span class="firsttd">사이즈</span>
			    <select name="prdSizeSelect" id="prdSizeSelect" onchange="selectSize(this)">
			        <option value="" selected disabled>사이즈를 선택하세요</option>
			        <option value="" disabled>-------------------------</option>
			        <c:forEach var="size" items="${sizesArray}">
			            <option value="${size}">${size}</option>
			        </c:forEach>
			    </select>
			</div>
			
			
			<div id="orderDiv"></div>
			
			
			<div id="detailBtnDiv">
				<input type="button" id="cartBtn" value="장바구니"/>
				<input type="button" id="orderBtn" value="바로 구매"/>
			</div>
		</div>
	</div>
	
	<div id="detailDiv2">
		<div id="ctgList">
			<ul>
				<li>상품상세정보</li>
				<li>배송안내</li>
				<li>교환 및 반품안내</li>
				<li>상품후기()</li>
				<li>상품문의()</li>
			</ul>
		</div>
		<div id="ctgContentDiv"></div>
	</div>

	</div>
	
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="../js/goodsDetail.js"></script>
<script type="text/javascript">
function selectSize(selectElement) {
    const selectedValue = selectElement.value;
    const orderDiv = document.getElementById('orderDiv');

    // 기존 폼 제거
    orderDiv.innerHTML = '';

    if (selectedValue) {
    	console.log(selectedValue)
        // orderForm 생성
        orderDiv.innerHTML = `
        	<div class="orderDiv">
            <form id="orderForm">
            <input type="hidden" name="prdNo" value="${dto.prdNo}" />
	            <table id="orderTable">
	            	<tr>
	           			<td><span class="orderSizeTitle">${dto.prdName}(` + selectedValue + `)</span>
	           				<input type="hidden" name="prdSize" id="orderPrdSize" value="` + selectedValue + `" /></td>
	        			<td><input type="number" name="qty" id="qty" value="1" onchange="updatePrice()" /></td>
		               	<td>
				            <div class="buttonContainer">
				                <button id="up" type="button" onclick="changeQuantity(1)">▲</button>
				                <button id="down" type="button" onclick="changeQuantity(-1)">▼</button>
				            </div>
	               		<td><span id="displayPrice">${dto.prdPrice}</span></td>
		            </tr>
		        </table>
            </form>
            </div>
        `;

        updatePrice();
    }
}

function updatePrice() {
    const qty = document.getElementById('qty').value;
    const price = parseFloat(document.getElementById('orderPrice').value);
    const totalPrice = price * qty;
    document.getElementById('displayPrice').textContent = totalPrice;
}

function changeQuantity(delta) {
    const qtyInput = document.getElementById('qty');
    let currentQty = parseInt(qtyInput.value, 10);
    
    // 수량을 증가시키거나 감소시킵니다.
    currentQty += delta;

    // 수량이 1 미만이 되지 않도록 합니다.
    if (currentQty < 1) {
        currentQty = 1;
    }

    qtyInput.value = currentQty; // 업데이트된 수량을 입력 필드에 설정
    updatePrice(); // 가격 업데이트
}
</script>
</body>
</html>
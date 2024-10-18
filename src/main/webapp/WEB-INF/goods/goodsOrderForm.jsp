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
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<div id="history">
	<a href="/KBOMarket/">HOME</a>
	<span> > </span>
	<span>주문서작성/결제</span>
</div>

<div id="orderDiv">
	<div id="orderTitle">
		<span id="title1">주문서작성/결제</span>
		<span id="title2">01 장바구니 > <span class="titleSpan">02 주문서작성/결제 ></span> 03 주문완료</span>
	</div>
	
	<div id="detailOrderDiv">
		<table>
			<tr>
				<th colspan="2">상품/옵션 정보</th>
				<th>수량</th>
				<th>상품금액</th>
				<th>할인/적립</th>
				<th>합계금액</th>
				<th>배송비</th>
			</tr>
			
			<tr>
				<td class="img"><img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-138/storage/${goodsDTO.imageFileName}" id="orderPrdImage"/></td>
				<td class="prdname">
					<span class="prdname">${goodsDTO.prdName }</span><br>
					<span class="option">옵션 ${orderDTO.orderSize }</span></td>
				<td>${orderDTO.qty }</td>
				<td><fmt:formatNumber pattern="#,### 원">${orderDTO.orderPrice }</fmt:formatNumber></td>
				<td></td>
				<td><fmt:formatNumber pattern="#,### 원">${orderDTO.orderPrice }</fmt:formatNumber></td>
				<td>0원</td>
			</tr>
		</table>
	</div>
		
	<div id="orderTotalPriceDiv">
		<table>
			<tr>
				<th></th>
				<th>총 ${orderDTO.qty }개의 상품</th>
				<th rowspan="2">+</th>
				<th>배송비</th>
				<th rowspan="2">=</th>
				<th>합계</th>
			</tr>
			<tr>
				<td></td>
				<td><fmt:formatNumber pattern="#,### 원">${orderDTO.orderPrice }</fmt:formatNumber></td>
				<td>0원</td>
				<td><fmt:formatNumber pattern="#,### 원">${orderDTO.orderPrice }</fmt:formatNumber></td>
			</tr>
		</table>
	</div>
		
	<div id="orderInfoDiv">
		<div id="orderInfoTitle">주문자 정보</div>
		<table>
			<tr>
				<td>주문하시는 분</td>
				<td>${userDTO.name }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><c:if test="${userDTO.zipcode !=null && !empty userDTO.zipcode}">[${userDTO.zipcode }] ${userDTO.addr1 } ${userDTO.addr2}</c:if></td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td>${userDTO.tel }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${userDTO.email }</td>
			</tr>
		</table>
	</div>
	
	
	<form id="orderForm" action="/KBOMarket/order/order" method="post">
	<div id="deliveryInfoDiv">
		<div id="deliveryInfoTitle">배송정보</div>
		<table>
			<tr>
				<td>* 받으실분</td>
				<td>
					<input type="text" id="name" name="name" value="${userDTO.name }"/>
					<div id="nameDiv" class="errorDiv"></div>
				</td>
			</tr>
			<tr>
				<td>* 받으실 곳</td>
				<td>
					<input type="text" id="zipcode" name="zipcode" value="${userDTO.zipcode }" readonly/>
					<input type="button" id="zipcode" value="우편번호 검색" class="btn" id="findAddr" onclick="checkPost()"/><br>
					
					<input type="text" id="addr1" name="addr1" value="${userDTO.addr1 }" readonly />
					<input type="text" id="addr2" name="addr2" value="${userDTO.addr2 }" />
					<div id="addrDiv" class="errorDiv"></div>
				</td>
			</tr>
			<tr>
				<td>* 휴대폰번호</td>
				<td>
					<input type="text" id="tel" name="tel" value="${userDTO.tel }"/>
					<div id="telDiv" class="errorDiv"></div>
				</td>
			</tr>
		</table>
		<input type="hidden" name="userId" value="${sessionScope.userId }"/>
		<input type="hidden" name="prdNo" value="${orderDTO.prdNo }"/>
		<input type="hidden" name="orderPrice" value="${orderDTO.orderPrice}"/>
		<input type="hidden" name="orderSize" value="${orderDTO.orderSize }"/>
		<input type="hidden" name="qty" value="${orderDTO.qty }"/>
	</div>
	</form>
		

	<div id="finalPriceDiv">
		<span>최종 결제 금액</span>
		<span><fmt:formatNumber pattern="#,### 원">${orderDTO.orderPrice }</fmt:formatNumber></span>
	</div>
	
	<div id="orderBtnDiv">
		<input type="button" id="orderBtn" value="결제하기"/>
	</div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/goodsOrder.js"></script>
<script type="text/javascript">
$('#orderBtn').click(function(){
	$('.errorDiv').empty();
	
	if($('#name').val() === ''){
		$('#nameDiv').html('* 받으실 분을 입력하세요.');
		$('#name').focus();
	}else if($('#zipcode').val() === ''){
		$('#addrDiv').html('* 받으실 곳을 입력하세요.');
		$('#btn').focus();
	}else if($('#addr1').val() === ''){
		$('#addrDiv').html('* 받으실 곳을 입력하세요.');
		$('#btn').focus();
	}else if($('#addr2').val() === ''){
		$('#addrDiv').html('* 받으실 곳을 입력하세요.');
		$('#addr2').focus();
	}else if($('#tel').val() === ''){
		$('#telDiv').html('* 휴대폰번호를 입력하세요.');
		$('#tel').focus();
	}else{
		$('#orderForm').submit();
	}

	
});

$('input[type="text"]').focusout(function() {
    if ($(this).val() !== '') {
        $('.errorDiv').empty();
    }
});

</script>
</body>
</html>
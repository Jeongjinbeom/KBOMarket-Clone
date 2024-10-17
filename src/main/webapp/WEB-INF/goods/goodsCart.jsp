<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KBOMarket</title>
	<link rel="stylesheet" href="../css/index.css">
	<link rel="stylesheet" href="../css/header.css">
	<link rel="stylesheet" href="../css/goodsCart.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<div id="orderDiv">
	<div id="orderTitle">
		<span>주문서작성/결제</span>
		<span>01 장바구니 > <span class="titleSpan">02 주문서작성/결제 ></span> 03 주문완료</span>
	</div>
	
	<div id="detailOrderDiv">
		<table>
			<tr>
				<th>상품/업션 정보</th>
				<th>수량</th>
				<th>상품금액</th>
				<th>할인/적립</th>
				<th>합계금액</th>
				<th>배송비</th>
			</tr>
			<tr>
				<td>${orderDTO.prdNo }, ${orderDTO.orderSize }</td>
				<td>${orderDTO.qty }</td>
				<td>${orderDTO.orderPrice }</td>
				<td></td>
				<td>${orderDTO.orderPrice }</td>
				<td>0원</td>
			</tr>
		</table>
		
		<div id="orderTotalPriceDiv">
			<table>
				<tr>
					<td>총 ${orderDTO.qty }개의 상품</td>
					<td>배송비</td>
					<td>합계</td>
				</tr>
				<tr>
					<td>${orderDTO.orderPrice } 원</td>
					<td>0원</td>
					<td>${orderDTO.orderPrice } 원</td>
				</tr>
			</table>
		</div>
		
		<div id="orderInfoDiv">
			<div id="orderInfoTitle">주문자 정보</div>
			<table>
				<tr>
					<td>주문하시는 분</td>
					<td><input type="text" id="name" name="name" value="${userDTO.name }"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>[${userDTO.zipcode }] ${userDTO.addr1 } ${userDTO.addr2}</td>
				</tr>
				<tr>
					<td>휴대폰번호</td>
					<td><input type="text" id="tel" name="tel" value="${userDTO.tel }"/></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="email" name="email" value="${userDTO.email }"/></td>
				</tr>
			</table>
		</div>
	</div>

</div>
${orderDTO.userId }
${orderDTO.prdNo }

${orderDTO.orderPrice }
${orderDTO.orderSize }

${orderDTO.qty }

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
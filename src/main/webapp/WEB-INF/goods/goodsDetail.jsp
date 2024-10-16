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
		<div id="detailImage"><img src="../image/${dto.imageFileName }" class="detailImg"/></div>
		<div id="detailContent">
			<div class="views">조회수 ${dto.views }</div>
			<div class="title"><pre>${dto.prdName }</pre></div>
			
			<div class="tr" id="price">
				<span class="firsttd">판매가</span>
				<span class="price">
					<fmt:formatNumber pattern="#,### 원" >${dto.prdPrice }</fmt:formatNumber>
				</span>
			</div>
			<div class="tr">
				<span class="firsttd">사이즈</span>
				<span class="size">${dto.prdSize }</span>
			</div>
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
			
			<span id="prdNo" class="${dto.prdNo }"></span>
			<span id="prdName" class="${dto.prdName }"></span>
			<span id="prdPrice" class="${dto.prdPrice }"></span>
			
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
				<li id="1">상품상세정보</li>
				<li id="2">배송안내</li>
				<li id="3">교환 및 반품안내</li>
				<li id="4">상품후기 (${map.total })</li>
				<li id="5">상품문의 (0)</li>
			</ul>
		</div>
		<div id="ctgContentDiv">
			<jsp:include page="reviewForm.jsp"></jsp:include>
		</div>
	</div>

	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="../js/goodsDetail.js"></script>
<script type="text/javascript">
$(function(){
	$('#orderBtn').click(function(){
		$('#orderForm').submit();
	})
	
	$('#ctgList ul li').eq(0).addClass('clickLi');
	
    $('#ctgList ul li').click(function() {
        $('#ctgList ul li').removeClass('clickLi');
        $(this).addClass('clickLi');
        
        const selectedId = $(this).attr('id');
        
        $('#ctgContentDiv > div').hide();

        // 선택한 ID에 해당하는 reviewDiv만 보임
        $('#reviewDiv' + selectedId).show();
    });
    
    // 초기 상태에서 첫 번째 div 보이기
    $('#ctgContentDiv > div').hide(); // 모든 div 숨기기
    $('#reviewDiv1').show(); // 첫 번째 div 보이기
})

function userPaging(i) {
    $.ajax({
        url: '/KBOMarket/goods/goodsReview',
        type: 'GET',
        data: {
            pg: i,
            prdNo: '${dto.prdNo}' // 현재 상품 번호 전달
        },
        success: function(response) {
            // #ctgContentDiv의 내용을 업데이트
            $('#ctgContentDiv').html(response);
            $('#ctgContentDiv > div').hide();
            $('#reviewDiv4').show();
        },
        error: function(xhr, status, error) {
            console.error("AJAX Error:", status, error);
        }
    });
}
</script>
</body>
</html>
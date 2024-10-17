<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/simplePagination.min.css">
<link rel="stylesheet" href="../css/adminList.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<form id="adminListForm">
		<div id="padding"></div>
		<div class="content-List">
			<h2>상품목록</h2>
			<hr>
			<button id="deleteSelected" onclick="deleteSelectedItems()">선택 삭제</button>
		</div>
			<div id="adminListDiv">
				<section class="adminList">
					<div class="admin-grid">
						<c:forEach items="${list }" var="item">
							<div class="admin-item-container">
							    <div class="admin-item" onclick="location.href='/KBOMarket/goods/goodsDetail?prdNo=${item.prdNo}'">
							        <img
							            src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-138/storage/${item.imageFileName}"
							            alt="userUploadDTO.imageName" width="50" height="50">
							        <h3>${item.prdName}</h3>
							        <fmt:formatNumber value="${item.prdPrice}" type="number" groupingUsed="true" /> 원
	                           </div>
							    <div class="item-checkbox"> <!-- Updated for positioning -->
							        <input type="checkbox" name="check" id="check" value="${item.prdNo}">
							    </div>
							</div>
						</c:forEach>
					</div>
				</section>
			<div class="pagination-wrapper">
			    <div id="pagination"></div>
			</div>
		</div>
	</form>
	<jsp:include page="../footer.jsp" />

<script>
$(document).ready(function() {
    var items = $(".admin-item-container"); 
    var numItems = items.length;
    var perPage = 10;

    items.slice(perPage).hide();

    if ($("#pagination").length) {
        $("#pagination").pagination({
            items: numItems,
            itemsOnPage: perPage,
            cssStyle: 'light-theme',
            prevText: "이전",
            nextText: "다음",
            onPageClick: function(pageNumber) {
                var showFrom = perPage * (pageNumber - 1);
                var showTo = showFrom + perPage;
                items.hide().slice(showFrom, showTo).show();
            },
            edges: 1,
            displayedPages: 3
        });
    } else {
        console.error("Pagination div not found");
    }
});

function deleteSelectedItems(){
	// 체크된 항목들의 prdNo 값을 배열에 추가
    var check = [];
    $("input[name='check']:checked").each(function() {
    	check.push($(this).val());
    });
	
    if (check.length === 0) {
        alert("삭제할 항목을 선택하세요.");
        return;
    }

    // 삭제 확인 메시지
    var confirmDelete = confirm("정말 삭제하시겠습니까?");
    
    if (confirmDelete) {
	    console.log(check);
        // "Yes"를 선택했을 때 삭제 진행
        $.ajax({
            type: "POST",
            url: "/KBOMarket/admin/deleteAdminList", 
            data: $('#adminListForm').serialize(),
            success: function() {
            	alert('삭제 완료되었습니다.');
                location.href="/KBOMarket/admin/adminList";
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error);
                alert("삭제 중 오류가 발생했습니다.");
            }
        });
    } else {
        // "No"를 선택했을 때 아무 동작도 하지 않음
        alert("삭제가 취소되었습니다.");
    }
} 
</script>
</body>
</html>
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
	<jsp:include page="./adminHeader.jsp" />
	<form id="adminListForm" action="/KBOMarket/admin/deleteAdminList" method="post">
		<div id="padding"></div>
		<div class="content-List">
			<h2>상품목록</h2>
			<hr>
			<button id="deleteSelected" onclick="deleteSelectedItems(event)">선택 삭제</button>
		</div>
			<div id="adminListDiv">
				<section class="adminList">
					<div class="admin-grid">
						<c:forEach items="${list }" var="item">
							<div class="admin-item-container">
							    <div class="admin-item" onclick="location.href='/KBOMarket/admin/adminUpdateForm?prdNo=${item.prdNo}'">
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

<script type="text/javascript" src="../js/adminList.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/admin.css">
</head>
<body>
	<jsp:include page="./adminHeader.jsp" />

	<section class="admin-section">
		<h2>관리자님이 사용할 기능을 선택해주세요</h2>
		<div class="admin-menu">

			<div class="menu-item">
				<h2>회원 관리</h2>
				<p>가입된 회원 목록을 확인하고 관리합니다.</p>
				<a href="./adminUserList" class="btn">회원 목록 보기</a>
			</div>

			<div class="menu-item">
				<h2>상품 등록</h2>
				<p>새로운 상품을 등록합니다.</p>
				<a href="./adminGoodsWriteForm" class="btn">상품 등록하기</a>
			</div>

			<div class="menu-item">
				<h2>상품 등록 내역</h2>
				<p>등록된 상품 목록을 확인하고 관리합니다.</p>
				<a href="./adminList" class="btn">등록 내역 보기</a>
			</div>
		</div>
	</section>

	<jsp:include page="../footer.jsp" />
</body>
</html>
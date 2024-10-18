<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 목록</title>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/index.css">
<style type="text/css">
body {
	font-family: Arial, sans-serif;
}

h2 {
	padding: 20px 0;
	margin-left: 50px;
}

hr {
	margin-left: 50px;
	margin-right: 50px;
}

.admin-List {
	max-width: 1300px;
	margin: 0 auto;
	padding: 0 20px;
}

#adminPadding {
	padding: 15px;
}

table {
	width: 100%;
	max-width: 1150px; /* 테이블 최대 너비 설정 */
	border-collapse: collapse;
	margin: 20px auto; /* 중앙 정렬 */
	background-color: #fff; /* 테이블 배경색 */
	border: 1px solid #333; /* 테이블 외곽선 색 */
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}

th {
	background-color: #333; /* 헤더 배경색 */
	color: #fff; /* 헤더 텍스트 색 */
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #e0e0e0; /* 마우스 호버 시 색상 */
}

.pagination-wrapper {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.pagination {
	display: flex;
	list-style: none;
	padding: 0;
}

.pagination li {
	margin: 0 5px;
}

.pagination a, .pagination span {
	padding: 10px 15px;
	border: 1px solid #ddd;
	background-color: #333;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: all 0.3s ease;
}

.pagination a:hover {
	background-color: gray;
}

.pagination .active span {
	background-color: #333333;
	color: #fff;
	border-color: #333333;
}

#footerPadding{
	padding: 20px;
}

/* 반응형 처리 */
@media (max-width: 1200px) {
	h2 {
		margin-left: 20px;
	}
	
	.admin-List {
		padding: 0 10px;
	}
	
	table {
		max-width: 90%; /* 테이블 최대 너비를 90%로 설정 */
	}
	
	.pagination a, .pagination span {
		padding: 8px 12px; /* 패딩 조정 */
	}
}

@media (max-width: 768px) {
	h2 {
		margin-left: 10px;
	}
	
	.admin-List {
		padding: 0 5px;
	}
	
	#adminPadding {
		padding: 10px;
	}
	
	table {
		font-size: 14px; /* 폰트 크기 조정 */
	}
	
	.pagination a, .pagination span {
		padding: 5px 10px; /* 패딩 조정 */
	}
}

@media (max-width: 480px) {
	h2 {
		font-size: 20px; /* 제목 폰트 크기 조정 */
		margin-left: 0; /* 왼쪽 여백 제거 */
	}
	
	.admin-List {
		padding: 0; /* 여백 제거 */
	}
	
	table {
		font-size: 12px; /* 폰트 크기 조정 */
	}
	
	#footerPadding {
		padding: 15px; /* 푸터 여백 조정 */
	}
}
</style>
</head>
<body>
	<jsp:include page="adminHeader.jsp"></jsp:include>
	<div id="adminPadding"></div>
	<div class="admin-List">
		<h2>회원 목록</h2>
		<hr>
		<table>
			<thead>
				<tr>
					<th>회원 이름</th>
					<th>회원 아이디</th>
					<th>회원 이메일</th>
					<th>회원 핸드폰번호</th>
					<th>회원 도로명주소</th>
					<th>상세주소</th>
				</tr>
			</thead>
			<tbody id="userTableBody">
				<c:forEach items="${list}" var="user">
					<c:if test="${user.name != '관리자'}">
						<tr>
							<td>${user.name}</td>
							<td>${user.userId}</td>
							<td>${user.email}</td>
							<td>${user.tel}</td>
							<td>${user.addr1}</td>
							<td>${user.addr2}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagination-wrapper">
			<ul class="pagination" id="pagination"></ul>
		</div>
	</div>
	<div id=footerPadding></div>
	<jsp:include page="../footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script>
	$(document).ready(function () {
	    var items = $("#userTableBody tr");
	    var numItems = items.length;
	    var perPage = 14;

	    items.hide();
	    items.slice(0, perPage).show();

	    var totalPages = Math.ceil(numItems / perPage);
	    for (var i = 1; i <= totalPages; i++) {
	        $("#pagination").append('<li><a href="#" class="page-link">' + i + '</a></li>');
	    }

	    // 이전 및 다음 버튼 추가
	    $("#pagination").prepend('<li><a href="#" class="prev-link">이전</a></li>');
	    $("#pagination").append('<li><a href="#" class="next-link">다음</a></li>');

	    // 페이지 번호 클릭
	    $(".page-link").click(function (e) {
	        e.preventDefault();
	        var pageNumber = $(this).text();
	        showPage(pageNumber);
	    });

	    // 이전 버튼 클릭
	    $(".prev-link").click(function (e) {
	        e.preventDefault();
	        var currentPage = $(".pagination li a.active").text();
	        if (currentPage > 1) {
	            showPage(currentPage - 1);
	        }
	    });

	    // 다음 버튼 클릭
	    $(".next-link").click(function (e) {
	        e.preventDefault();
	        var currentPage = $(".pagination li a.active").text();
	        if (currentPage < totalPages) {
	            showPage(currentPage - 0 + 1); // currentPage를 숫자로 변환
	        }
	    });

	    $(".pagination li a").first().addClass("active");

	    function showPage(pageNumber) {
	        var showFrom = (pageNumber - 1) * perPage;
	        var showTo = showFrom + perPage;
	        items.hide().slice(showFrom, showTo).show();
	        $(".pagination li a").removeClass("active");
	        $(".pagination li a.page-link").eq(pageNumber - 1).addClass("active");

	        // 이전/다음 버튼 활성화 상태 조정
	        $(".prev-link").toggle(pageNumber > 1);
	        $(".next-link").toggle(pageNumber < totalPages);
	    }
	});
    </script>
</body>
</html>
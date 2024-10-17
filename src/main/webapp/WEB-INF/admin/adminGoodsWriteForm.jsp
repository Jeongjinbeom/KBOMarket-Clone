<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 등록</title>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/adminGoodsWriteForm.css">
</head>
<body>
    <jsp:include page="../header.jsp" />
<hr>
    <div class="container">
        <!-- 왼쪽 이미지 및 중요한 정보 -->
        <div class="left-section">
            <img id="productImage">
            <div class="upload-text">이미지 등록</div>
            <div class="product-info">
                <h2><span id="prdNameDisplay"></span></h2>
            </div>
        </div>

        <!-- 오른쪽 세부 정보 입력 폼 -->
        <div class="right-section">
            <form id="imageUploadForm">
                <!-- 구단 이름 선택 -->
                <label for="teamId">구단 선택</label>
                <select name="teamId" id="teamId" required>
                    <option value="" disabled>-- 구단 선택 --</option>
                    <option value="1">LG 트윈스</option>
                    <option value="2">KT 위즈</option>
                    <option value="3">SSG 랜더스</option>
                    <option value="4">NC 다이노스</option>
                    <option value="5">두산 베어스</option>
                    <option value="6">KIA 타이거즈</option>
                    <option value="7">롯데 자이언츠</option>
                    <option value="8">삼성 라이온즈</option>
                    <option value="9">한화 이글스</option>
                    <option value="10">키움 히어로즈</option>
                </select>
                

                <!-- 상품 카테고리 입력 -->
                <label for="ctg">상품 카테고리</label>
 					<select name="ctg" id="ctg" required>
                    <option value="" disabled>-- 구단 선택 --</option>
                    <option value="000">전체</option>
                    <option value="001">응원도구</option>
                    <option value="002">유니폼</option>
                    <option value="003">의류</option>
                    <option value="004">모자</option>
                    <option value="005">잡화</option>
                    </select>
                <!-- 상품명 입력 -->
                <label for="prdName">상품명</label>
                <input type="text" id="prdName" name="prdName" required>
                <div id="prdNameDiv"></div>

                <!-- 상품 가격 입력 -->
                <label for="prdPrice">상품 가격</label>
                <input type="number" id="prdPrice" name="prdPrice" required>
				<div id="prdPriceDiv"></div>
				
                <!-- 상품 사이즈 선택 -->
                <label for="prdSize">상품 사이즈</label>
                <select name="prdSize" id="prdSize" required>
                    <option value="free">free</option>
                    <option value="XS,S,M,L,XL,XXL">XS,S,M,L,XL,XXL</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                    <option value="XL">XL</option>
                    <option value="XXL">XXL</option>
                </select>

                <!-- 상품 개수 입력 -->
                <label for="qty">상품 개수</label>
                <input type="number" id="qty" name="qty" required>
                <div id="qtyDiv"></div>

                <!-- 이미지 업로드 -->
                <input type="file" id="imageFile" name="imageFile" style="display: none;">

                <!-- 폼 제출 -->
                <input type="button" value="등록" id="prdWriteBtn">
            </form>
        </div>
    </div>
    <div id ="footerId" style="padding: 30px"></div>
    <jsp:include page="../footer.jsp" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="../js/adminGoodsWriteForm.js"></script>
</body>
</html>
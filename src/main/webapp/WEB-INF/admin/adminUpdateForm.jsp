<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/adminGoodsWriteForm.css">
</head>
<body>
<jsp:include page="./adminHeader.jsp" />
<hr>
<form id="imageUploadForm">
<input type="hidden" name="prdNo" value="${goodsDTO.prdNo}">
    <div class="container">
        <!-- 왼쪽 이미지 및 중요한 정보 -->
        <div class="left-section">
            <img id="productImage" src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-138/storage/${goodsDTO.imageFileName}">
            <div class="upload-text" style="${goodsDTO.imageFileName != null ? 'display:none;' : ''}">이미지 등록</div>
            <div class="product-info">
                <h2><span id="prdNameDisplay"></span></h2>
            </div>
        </div>

        <!-- 오른쪽 세부 정보 입력 폼 -->
        <div class="right-section">
                <!-- 구단 이름 선택 -->
                <label for="teamId">구단 선택</label>
	               <select name="teamId" id="teamId" required>
					    <option value="" disabled>-- 구단 선택 --</option>
					    <option value="1" ${goodsDTO.teamId == 1 ? 'selected' : ''}>LG 트윈스</option>
					    <option value="2" ${goodsDTO.teamId == 2 ? 'selected' : ''}>KT 위즈</option>
					    <option value="3" ${goodsDTO.teamId == 3 ? 'selected' : ''}>SSG 랜더스</option>
					    <option value="4" ${goodsDTO.teamId == 4 ? 'selected' : ''}>NC 다이노스</option>
					    <option value="5" ${goodsDTO.teamId == 5 ? 'selected' : ''}>두산 베어스</option>
					    <option value="6" ${goodsDTO.teamId == 6 ? 'selected' : ''}>KIA 타이거즈</option>
					    <option value="7" ${goodsDTO.teamId == 7 ? 'selected' : ''}>롯데 자이언츠</option>
					    <option value="8" ${goodsDTO.teamId == 8 ? 'selected' : ''}>삼성 라이온즈</option>
					    <option value="9" ${goodsDTO.teamId == 9 ? 'selected' : ''}>한화 이글스</option>
					    <option value="10" ${goodsDTO.teamId == 10 ? 'selected' : ''}>키움 히어로즈</option>
					</select>

                <!-- 상품 카테고리 입력 -->
                <label for="ctg">상품 카테고리</label>
 					<select name="ctg" id="ctg" required>
					    <option value="" disabled>-- 구단 선택 --</option>
					    <option value="000" ${goodsDTO.ctg == '000' ? 'selected' : ''}>전체</option>
					    <option value="001" ${goodsDTO.ctg == '001' ? 'selected' : ''}>응원도구</option>
					    <option value="002" ${goodsDTO.ctg == '002' ? 'selected' : ''}>유니폼</option>
					    <option value="003" ${goodsDTO.ctg == '003' ? 'selected' : ''}>의류</option>
					    <option value="004" ${goodsDTO.ctg == '004' ? 'selected' : ''}>모자</option>
					    <option value="005" ${goodsDTO.ctg == '005' ? 'selected' : ''}>잡화</option>
					</select>
                <!-- 상품명 입력 -->
                <label for="prdName">상품명</label>
                <input type="text" id="prdName" name="prdName" value="${goodsDTO.prdName}"required>
                <div id="prdNameDiv"></div>

                <!-- 상품 가격 입력 -->
                <label for="prdPrice">상품 가격</label>
                <input type="number" id="prdPrice" name="prdPrice" value="${goodsDTO.prdPrice }"required>
				<div id="prdPriceDiv"></div>
				
                <!-- 상품 사이즈 선택 -->
                <label for="prdSize">상품 사이즈</label>
                <select name="prdSize" id="prdSize" required>
				    <option value="free" ${goodsDTO.prdSize == 'free' ? 'selected' : ''}>free</option>
				    <option value="XS,S,M,L,XL,XXL" ${goodsDTO.prdSize == 'XS,S,M,L,XL,XXL' ? 'selected' : ''}>XS,S,M,L,XL,XXL</option>
				    <option value="M" ${goodsDTO.prdSize == 'M' ? 'selected' : ''}>M</option>
				    <option value="L" ${goodsDTO.prdSize == 'L' ? 'selected' : ''}>L</option>
				    <option value="XL" ${goodsDTO.prdSize == 'XL' ? 'selected' : ''}>XL</option>
				    <option value="XXL" ${goodsDTO.prdSize == 'XXL' ? 'selected' : ''}>XXL</option>
				</select>

                <!-- 상품 개수 입력 -->
                <label for="qty">상품 개수</label>
                <input type="number" id="qty" name="qty" value="${goodsDTO.qty }"required>
                <div id="qtyDiv"></div>

                <!-- 이미지 업로드 -->
                <input type="file" id="imageFile" name="imageFile" style="display: none;">

                <input type="button" value="수정" id="prdUpdateBtn">
        </div>
    </div>
</form>
    <div id ="footerId" style="padding: 30px"></div>
    <jsp:include page="../footer.jsp" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../js/adminUpdate.js"></script>
</body>
</html>
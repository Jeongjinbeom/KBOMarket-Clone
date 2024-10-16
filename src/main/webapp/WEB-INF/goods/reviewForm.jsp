<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="reviewDiv1">
	<div id="reviewTitle">상품상세보기</div>
</div>

<div id="reviewDiv2">
    <div id="reviewTitle">배송안내</div>
    <!-- 배송안내 내용 -->
</div>

<div id="reviewDiv3">
    <div id="reviewTitle">교환 및 반품안내</div>
    <!-- 교환 및 반품안내 내용 -->
</div>

<div id="reviewDiv4">
    <div id="reviewTitle">상품후기 (총 ${map.total}개)</div>
	
	<c:forEach var="list" items="${reviewList}" varStatus="status">
		<div id="reviewAllDiv">
			<div id="reviewName"><span>@${userNames[status.index]}</span> 님</div>
			<div id="reviewContent">
				<div class="reviewTitle">${list.reviewTitle }<span><fmt:formatDate pattern="YYYY.MM.dd" value="${list.regDate }"/></span></div>
				<div class="reviewContent"><pre>${list.reviewContent }</pre></div>
				<div class="reviewLike">좋아요 ${list.likes }</div>
			</div>
		</div>
	</c:forEach>
	
	<div id="pagingHTML">
		${map.reviewPaging.pagingHTML }
	</div>
</div>

<div id="reviewDiv5">
    <div id="reviewTitle">상품문의</div>
    <!-- 상품문의 내용 -->
</div>

<div id="reviewDiv6">
    <div id="reviewTitle">상품상세보기</div>
</div>
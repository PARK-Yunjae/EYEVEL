<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctx}/css/boardComplain.css">
<script src="${ctx}/js/boardComplain.js" defer></script>
<section class="boardSection">
	<div class="innerBox">
		<h2 class="title">자주 하는 질문</h2>
		<div id="categoryList">
			<div class="complain_category">전체</div>
			<div class="complain_category">계정</div>
			<div class="complain_category">게시판</div>
			<div class="complain_category">관광지</div>
			<div class="complain_category">기타</div>
		</div>
		<c:forEach var="list" items="${list}">
			<div class="complain_main ${list.category} on">
				<div class="complain_title">
					<div class="complain_category_text">
						<c:if test="${list.category eq '91'}">계정</c:if>
						<c:if test="${list.category eq '92'}">게시판</c:if>
						<c:if test="${list.category eq '93'}">관광지</c:if>
						<c:if test="${list.category eq '94'}">기타</c:if>
					</div>
					<div class="complain_title_text">${list.title }</div>
					<div class="complain_title_arrow">
						<i class="fas fa-arrow-left arrow"></i>
					</div>
				</div>
				<div class="complain_contents">${list.contents}</div>
			</div>
		</c:forEach>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
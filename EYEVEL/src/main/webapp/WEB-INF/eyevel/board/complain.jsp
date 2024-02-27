<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/boardComplain.css">
<section class="boardSection">
	<div class="innerBox">
		<h1>자주 하는 질문</h1>
		<hr>
		    <div id="categoryList">
		        <div id="category">전체</div>
		        <div id="category">계정</div>
		        <div id="category">게시판</div>
		        <div id="category">관광지</div>
		        <div id="category">기타</div>
		    </div>
		<hr>
		<c:forEach var="list" items="${list}">
			<div id="title">
				 제목
			</div>
			<div id="contents">
				 내용
			</div>
		</c:forEach>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
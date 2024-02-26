<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/boardList.css">
<section class="boardSection">
	<div class="innerBox">
		<h2 class="title">게시판</h2>
		<button class="btn" onclick="location.href='${ctx}/boardAdd.do'">글쓰기</button>
		<ul class="category">
			<li class="on">전체</li>
			<li>공지사항</li>
			<li>카테고리</li>
		</ul>
		<table>
			<tr>
				<th>No</th>
				<th>카테고리</th>
				<th style="width: 40%;">제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요</th>
			</tr>
			<c:forEach var="board" items="${list}">
				<tr>
					<td>${board.no}</td>
					<td>${board.category}</td>
					<td>${board.title}</td>
					<td>${board.regdate}</td>
					<td>${board.hits}</td>
					<td>${board.heart}</td>
				</tr>
			</c:forEach>
		</table>
		<ul class="paging">
			<li onclick="location.href=''"><i class="fas fa-chevron-left"></i></li>
			<li onclick="location.href=''">1</li>
			<li onclick="location.href=''">2</li>
			<li onclick="location.href=''">3</li>
			<li onclick="location.href=''">4</li>
			<li onclick="location.href=''">5</li>
			<li onclick="location.href=''"><i class="fas fa-chevron-right"></i></li>
		</ul>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
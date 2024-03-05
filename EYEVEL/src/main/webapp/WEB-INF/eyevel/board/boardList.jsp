<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/boardList.css">
<script src="${ctx}/js/boardList.js" defer></script>
<section class="boardSection">
	<div class="innerBox">
		<h2 class="title">게시판</h2>
		<div class="search">
			<input type="text" id="searchText" placeholder="검색"
				<c:if test="${!empty searchText}">
					value="${searchText}"
				</c:if>
			> 
				<a onclick="boardSearchText()"><i class="fas fa-search"></i></a>
		</div>
		<button class="btn" onclick="boardAddCheck('${loginId}')">글쓰기</button>
		<ul class="category">
			<li class=
				<c:if test="${!empty category && category ne 'all'}">"all"</c:if>
				<c:if test="${empty category || category eq 'all'}">"all on"</c:if>
			>전체</li>
			<li class=
				<c:if test="${category ne 'notice'}">"notice"</c:if>
				<c:if test="${category eq 'notice'}">"notice on"</c:if>
			>공지사항</li>
			<li class=
				<c:if test="${category ne 'complain'}">"complain"</c:if>
				<c:if test="${category eq 'complain'}">"complain on"</c:if>
			>건의사항</li>
		</ul>
		<table>
			<tr>
				<th>No</th>
				<th>카테고리</th>
				<th class="board_title">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="7">
						<h2>아무 글이 없습니다</h2>
					</td>
				</tr>
			</c:if>
			<c:forEach var="board" items="${list}">
				<tr>
					<td>${board.no}</td>
					<td>
					<c:if test="${board.category eq '0'}">공지</c:if>
					<c:if test="${board.category eq '1'}">건의</c:if>
					</td>
					<td><a href="${ctx}/boardInfo.do?no=${board.no}">${board.title}</a></td>
					<td>${board.member_id}</td>
					<td>${board.reg_date}</td>
					<td>${board.hits}</td>
					<td>${board.heart}</td>
				</tr>
			</c:forEach>
		</table>
		<ul class="paging">
			<c:if test="${startPage>3}">
				<li class="start" onclick="location.href='${ctx}/boardList.do?page=${startPage-3}&start=${startPage-3}&searchText=${searchText}&category=${category}'"><i class="fas fa-chevron-left"></i></li>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li onclick="location.href='${ctx}/boardList.do?page=${i}&start=${startPage}&searchText=${searchText}&category=${category}'"<c:if test="${i==page}">class="on"</c:if>>${i}</li>
			</c:forEach>
			<c:if test="${totalPage>endPage}">
				<li class="end" onclick="location.href='${ctx}/boardList.do?page=${startPage+3}&start=${startPage+3}&searchText=${searchText}&category=${category}'"><i class="fas fa-chevron-right"></i></li>
			</c:if>
		</ul>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
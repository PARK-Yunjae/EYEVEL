<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
// 줄바꿈
pageContext.setAttribute("br", "<br/>");
pageContext.setAttribute("cn", "\n");
%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/boardInfo.css">
<script src="${ctx}/js/boardInfo.js" defer></script>
<section class="boardAddSection">
	<div class="innerBox">
		<form method="post">
			<div class="board_info">
				<a href="${ctx}/boardList.do">뒤로가기</a>
				<h2>${board.title}</h2>
				<div class="board_nav">
					<div class="m_info">
						<div class="profile_img">
							<img src="https://picsum.photos/50/50" alt="">
						</div>
						<div>
							<h4>${board.member_id}</h4>
							<p>${board.reg_date}</p>
						</div>
					</div>
					<div class="edit">
						<p>조회수 : ${board.hits}</p>
						<span><i class="far fa-heart icon"></i></span>
						<p class="board_heart_count">${board.heart}</p>
						<i class="fas fa-ellipsis-v icon" onclick="clickBox()"></i>
						<!-- class on 추가시 수정/삭제 보임 -->
						<div class="edit_box">
							<a href="${ctx}/boardUpdate.do?no=${board.no}">수정</a>
							<a href="${ctx}/boardDelete.do?no=${board.no}">삭제</a>
						</div>
					</div>
				</div>
				<div class="board_content">${fn:replace(board.contents, cn, br)}</div>
			</div>
		</form>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
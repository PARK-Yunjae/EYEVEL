<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div class="innerBox" >
		<div class="board_info">
			<a href="${ctx}/boardList.do">뒤로가기</a>
			<h2>${board.title}</h2>
			<div class="board_nav">
				<div class="m_info">
					<div class="profile_img">
						<img src="http://localhost:8080/IMAGES/profile/${member.img}"
							alt="프로필이미지">
					</div>
					<div>
						<h4>${board.member_id}</h4>
						<p>${board.reg_date}</p>
					</div>
				</div>
				<div class="edit">
					<p>조회수 : ${board.hits}</p>
					<div class="like">
						<span id="like_btn" onclick="likeBtnCheck('${board.no}','${loginId}')">
							<i id="heart"class=
							<c:if test="${empty boardlike}">"fa-heart icon far "</c:if>
							<c:if test="${!empty boardlike}">"fa-heart icon fa "</c:if>
							></i>
						</span>
						<p class="board_heart_count">${board.heart}</p>
					</div>
					<c:if test="${loginId eq board.member_id || loginId eq 'admin'}">
						<button id="board_info_option" onclick="optionCheck()">
							<i class="fas fa-ellipsis-v icon"></i>
						</button>
						<!-- class on 추가시 수정/삭제 보임 -->
						<div class="edit_box">
							<a href="${ctx}/boardUpdate.do?no=${board.no}">수정</a> <a
								href="${ctx}/boardDelete.do?no=${board.no}">삭제</a>
						</div>
					</c:if>
				</div>
			</div>
			<div class="board_content">${fn:replace(board.contents, cn, br)}</div>
		</div>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
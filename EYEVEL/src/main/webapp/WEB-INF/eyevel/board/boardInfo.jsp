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
		<div class="board_info">
			<a href="${ctx}/boardList.do">뒤로가기</a>
			<h2>${board.title}</h2>
			<div class="board_nav">
				<div class="m_info">
					<div class="profile_img">
						<img src="http://localhost:8080/IMAGES/profile/${member.img}" alt="프로필이미지">
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
							<i id="heart" class=
							<c:if test="${empty boardlike}">"fa-heart icon far "</c:if> 
							<c:if test="${!empty boardlike}">"fa-heart icon fa "</c:if>> 
							</i>
						</span>
						<p class="board_heart_count">${board.heart}</p>
					</div>
					<c:if test="${loginId eq board.member_id || loginId eq 'admin'}">
						<button id="board_info_option" onclick="optionCheck()">
							<i class="fas fa-ellipsis-v icon"></i>
						</button>
						<!-- class on 추가시 수정/삭제 보임 -->
						<div class="edit_box">
							<a href="${ctx}/boardUpdate.do?no=${board.no}">수정</a>
							<a href="${ctx}/boardDelete.do?no=${board.no}">삭제</a>
						</div>
					</c:if>
				</div>
			</div>
			<div class="board_content">${fn:replace(board.contents, cn, br)}</div>
		</div>
		<div class="board_comment">
			<div id="board_comment_form">
				<input type="hidden" id="loginId" value="${loginId}">
				<input type="hidden" id="board_no" value="${board.no}">
				<div class="board_info_comment">
					<input type="text" id="board_info_comment" placeholder="댓글 입력...">
					<p class="msg board_info_msg">내용을 입력해 주세요</p>
				</div>
				<input type="button" class="button btn" value="등록" onclick="boardCommentCheck()">
			</div>
			<ul class="board_comment_list">
				<c:forEach var="bc" items="${bclist}">
					<!-- 현재날짜 가져온 뒤에 비교 (아직 미적용) -->
					<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
					<fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"
						value="${c.reg_datetime}" />
					<fmt:formatDate var="dateTempParse" pattern="yyyy-MM-dd"
						value="$dateFmt}" /> --%>
					<li>
						<div class="profile_image">
							<img src="http://localhost:8080//IMAGES/profile/${bc.img}" alt="">
						</div>
						<div class="content">
							<div>
								<h4 class="name">${bc.member_id}</h4>
								<p>${bc.reg_datetime}</p>
							</div>
							<p>${bc.comment}</p>
							<!-- no는 댓글 고유 번호, board_no는 게시글 번호  -->
							<c:if test="${loginId eq bc.member_id || loginId eq 'admin'}">
								<button onclick="location.href='${ctx}/boardCommentDelete.do?no=${bc.no}&board_no=${bc.board_no}'" style="display: block">삭제</button>
							</c:if>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
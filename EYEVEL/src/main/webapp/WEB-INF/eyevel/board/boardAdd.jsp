<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:if test="${empty loginId}">
	<script>
		location.href = "${ctx}/main.do";
	</script>
</c:if>
<link rel="stylesheet" type="text/css" href="${ctx}/css/boardAdd.css">
<script src="${ctx}/js/boardAdd.js" defer></script>
<section>
	<div class="innerBox">
		<h2 class="title">
			<c:if test="${board.title eq null}">
			글쓰기
		</c:if>
			<c:if test="${board.title ne null}">
			글 수정하기
		</c:if>
		</h2>
		<form action=<c:if test="${board.title eq null}">"${ctx}/boardAdd.do"</c:if> <c:if test="${board.title ne null}">"${ctx}/boardUpdate.do"</c:if> method="post" class="add_board">
			<input type="hidden" name="is_private" id="is_private" value="0" />
			<input type="hidden" name="admin_check" id="admin_check" value="0" />
			<input type="hidden" name="no" id="no" value="${board.no}" />
			<div class="input_info">
				<div class="input_title">
					<label for="title">제목</label><br>
					<c:if test="${board.title eq null}">
						<input type="text" name="title" placeholder="제목을 입력해주세요" id="title">
					</c:if>
					<c:if test="${board.title ne null}">
						<input type="text" name="title" value="${board.title}" id="title">
					</c:if>
				</div>
				<div class="input_date">
					<label for="date">작성일</label><br>
					<input type="text" name="date" id="date" readonly>
				</div>
				<div class="input_member">
					<label for="member">작성자</label><br>
					<c:if test="${board.title eq null}">
						<input type="text" name="member" id="member" readonly>
					</c:if>
					<c:if test="${board.title ne null}">
						<input type="text" name="member" id="member" value="${board.member_id}" readonly>
					</c:if>
				</div>
			</div>
			<label for="contents">내용</label>
			<c:if test="${board.title eq null}">
				<textarea name="contents" placeholder="내용을 입력해주세요" id="contents"></textarea>
			</c:if>
			<c:if test="${board.title ne null}">
				<textarea name="contents" id="contents">${board.contents}</textarea>
			</c:if>
			<!-- class에 on 추가시 보임 -->
			<c:if test="${loginId eq 'admin'}">
				<div class="notice_check">
					<input type="checkbox" id="notice" name="notice">
					<label for="notice" class="notice_label">공지사항으로 등록하기</label>
				</div>
			</c:if>
			<c:if test="${board.title eq null}">
				<input type="button" class="button btn" value="등록하기" onclick="boardAddCheck(form)">
			</c:if>
			<c:if test="${board.title ne null}">
				<input type="button" class="button btn" value="수정하기" onclick="boardAddCheck(form)">
			</c:if>
		</form>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
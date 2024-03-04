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
			<!-- class에 on 추가시 보임 -->
			<c:if test="${loginId eq 'admin'}">
				<div class="category_select">
					<select name="category" class="category_select_option">
						<option value="notice" selected>공지사항</option>
						<option value="complain">건의사항</option>
						<option value="qna">자주하는질문</option>
					</select>
					<div class="qna_select">
						<input type="radio" name="qna" id="qna90" value="90"/>
						<label class="qna_label" for="qna90" width="100px">전체</label>
						<input type="radio" name="qna" id="qna91" value="91"/>
						<label class="qna_label" for="qna91">계정</label>
						<input type="radio" name="qna" id="qna92" value="92"/>
						<label class="qna_label" for="qna92">게시판</label>
						<input type="radio" name="qna" id="qna93" value="93"/>
						<label class="qna_label" for="qna93">관광지</label>
						<input type="radio" name="qna" id="qna94" value="94"/>
						<label class="qna_label" for="qna94">기타</label>
					</div>
				</div>
			</c:if>
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
					<input type="text" name="date" id="date" value=
					<c:if test="${empty board.reg_date}">"${date}"</c:if>
					<c:if test="${!empty board.reg_date}">"${board.reg_date}"</c:if>
					readonly>
				</div>
				<div class="input_member">
					<label for="member">작성자</label><br>
					<input type="text" name="member" id="member" value="${name}" readonly>
				</div>
			</div>
			<label for="contents">내용</label>
			<c:if test="${board.title eq null}">
				<textarea name="contents" placeholder="내용을 입력해주세요" id="contents"></textarea>
			</c:if>
			<c:if test="${board.title ne null}">
				<textarea name="contents" id="contents">${board.contents}</textarea>
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
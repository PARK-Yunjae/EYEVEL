<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/boardAdd.css">
<script src="${ctx}/js/boardAdd.js" defer></script>
   <section>
      <div class="innerBox">
         <h2 class="title">글쓰기</h2>
         <form action="${ctx}/boardAdd.do" method="post" class="add_board">
         <input type="hidden" name="is_private" id="is_private" value="0"/>
         <input type="hidden" name="admin_check" id="admin_check" value="0"/>
            <div class="input_info">
               <div class="input_title">
                  <label for="title">제목</label><br>
                  <input type="text" name="title" placeholder="제목을 입력해주세요" id="title">
               </div>
               <div class="input_date">
                  <label for="date">작성일</label><br>
                  <input type="text" name="date" id="date" readonly>
               </div>
               <div class="input_member">
                  <label for="member">작성자</label><br>
                  <input type="text" name="member" id="member" readonly>
               </div>
            </div>
            <label for="contents">내용</label>
            <textarea name="contents" placeholder="내용을 입력해주세요" id="contents"></textarea>
            <!-- class에 on 추가시 보임 -->
            <c:if test="${loginId eq 'admin'}">
				<div class="notice_check">
					<input type="checkbox" id="notice" name="notice"> <label for="notice"
						class="notice_label">공지사항으로 등록하기</label>
				</div>
			</c:if>
            <input type="button" class="button btn" value="등록하기" onclick="boardAddCheck(form)">
         </form>
      </div>
   </section>
<%@ include file="../parts/footer.jsp"%>
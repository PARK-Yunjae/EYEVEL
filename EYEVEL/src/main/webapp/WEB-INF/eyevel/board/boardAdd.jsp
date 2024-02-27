<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:if test="${empty loginId}">
	<script>
		location.href="${ctx}/main.do";
	</script>
</c:if>
<link rel="stylesheet" type="text/css" href="${ctx}/css/boardAdd.css">
   <section>
      <div class="innerBox">
         <h2 class="title">글쓰기</h2>
         <form action="" method="post" class="add_board">
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
            <label for="content">내용</label>
            <textarea name="content" placeholder="내용을 입력해주세요" id="content"></textarea>
            <!-- class에 on 추가시 보임 -->
            <div class="notice_check">
               <input type="checkbox" id="notice">
               <label for="notice" class="notice_label">공지사항으로 등록하기</label>
            </div>
            <input type="button" class="button btn" value="등록하기">
         </form>
      </div>
   </section>
<%@ include file="../parts/footer.jsp"%>
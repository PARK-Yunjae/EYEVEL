<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/footer.css">
<script type="text/javascript">
	var chatAddr = '<%= application.getInitParameter("CHAT_ADDR") %>';
</script>
<script src="${ctx}/js/footer.js" defer></script>
<footer>
      <div class="innerBox">
         <div class="footer_logo">
            <div class="logo_img">
               <img src="${ctx}/img/logo.png" alt="page Logo Image">
            </div>
            <p>
               본 사이트는 상업적 목적이 아닌 팀 개인의 포트폴리오 용도로 만들어 졌습니다.<br>
               일부 내용 및 이미지 등은 그 출처가 따로 있음을 밝힙니다.<br><br>
               Copyright ⓒ 2024. Team Eyevel All rights reserved.<br>
            </p>
         </div>
         <ul class="footer_nav">
            <li>Menu</li>
            <li><a href="${ctx}/boardList.do">게시판</a></li>
            <li><a href="${ctx}/boardComplain.do">자주 하는 질문</a></li>
         </ul>
      </div>
   </footer>
   <c:if test="${!empty name}">
	   <div class="chat_Btn" onclick="chatOpen('${name}')">채팅</div>
   </c:if>
   <div class="chat_Main">
		<button id="closeBtn" onclick="disconnect();"><i class="fas fa-times"></i></button>
		<div id="chatWindow"></div>
		<div id="chatMessageBar">
			<input type="text" id="chatMessage" onkeyup="enterKey();">
			<button id="sendBtn" onclick="sendMessage();">전송</button>
		</div>
	</div>
</body>
</html>
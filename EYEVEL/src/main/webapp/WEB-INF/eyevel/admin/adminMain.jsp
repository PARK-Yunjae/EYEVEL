<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:if test="${empty loginId || loginId ne 'admin'}">
	<script>
		location.href="${ctx}/main.do";
	</script>
</c:if>
<link rel="stylesheet" type="text/css" href="${ctx}/css/adminMain.css">
<script>
	document.querySelector('header').classList.add('black');
	document.querySelector('html').style.background="none";
</script>
<section>
	<div class="innerBox">
		<h2 class="title">관리 페이지</h2>
		<ul class="admin_list">
			<li>
				<div class="image" onclick="location.href='${ctx}/memberList.do'">
				<img src="https://picsum.photos/300/300" alt="유저이미지"></div>
				<p>유저 관리</p>
			</li>
			<li>
				<div class="image" onclick="location.href='${ctx}/adminAreaList.do'">
				<img src="https://picsum.photos/200/200" alt="관광지이미지"></div>
				<p>관광지 관리</p>
			</li>
		</ul>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
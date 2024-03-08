<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:if test="${empty loginId || loginId ne 'admin'}">
	<script>
		location.href = "${ctx}/main.do";
	</script>
</c:if>
<link rel="stylesheet" type="text/css" href="${ctx}/css/adminAreaSelect.css">
<script src="${ctx}/js/adminAreaSelect.js" defer></script>
<script>
	document.querySelector('header').classList.add('black');
	document.querySelector('html').style.background = "none";
</script>
<section class="adminSelectSection">
	<div class="innerBox">
		<ul class="continent_nav gnb">
			<li onclick="selectContinent('asia')">아시아</li>
			<li onclick="selectContinent('africa')">아프리카</li>
			<li onclick="selectContinent('northAmerica')">북아메리카</li>
			<li onclick="selectContinent('southAmerica')">남아메리카</li>
			<li onclick="selectContinent('europe')">유럽</li>
			<li onclick="selectContinent('oceania')">오세아니아</li>
			<li onclick="selectContinent('antarctica')">남극</li>
		</ul>
		<div class="select_image asia">
			<button class="select_btn">선택완료</button>
			<img class="select_img" src="${ctx}/img/continent/asia.png" alt="지구 이미지">
		</div>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
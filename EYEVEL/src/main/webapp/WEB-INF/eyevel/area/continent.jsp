<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<script defer src="${ctx}/js/continent.js" defer></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/earth.css">
<div id="arealist" data-user="${list}"></div>
<section class="earthSection">
	<div class="innerBox">
	<div class="citys">
	<ul>
	<c:forEach var="city" items="${list}">
	<li>		
	<button id="${city.name}" onclick="location.href='${ctx}/areaCity.do?no=${city.no }&loginId=${loginId}'" style="top:${city.dir_X}px;left:${city.dir_Y}px;">${city.name}</button>
	</li>
	</c:forEach>
	</ul>
	</div>
		<img src="${ctx}/img/continent/${area}.png"/>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>


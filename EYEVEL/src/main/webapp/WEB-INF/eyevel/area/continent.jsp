<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<script defer src="${ctx}/js/continent.js" defer></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/earth.css">
<div id="arealist" data-user="${list}"></div>
<section class="earthSection">
	<div class="innerBox">
	<div class="citys">
	<c:forEach var="city" items="${list}">
	<ul>
	<li>		
	<button id="${city.name}" onclick="location.href='${ctx}/areaCity.do?no=${city.no }&loginId=${loginId}'" style="top:${city.dir_X}px;left:${city.dir_Y}px;">${city.name}</button>
	</li>
	</ul>
	</c:forEach>
	</div>

		<img src="${ctx}/img/worldmap1.png"/>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>


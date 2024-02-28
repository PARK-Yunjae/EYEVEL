<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/earth.css">
<section class="earthSection">
	<div class="innerBox">
		<button id="Antarctica" onclick="location.href='${ctx}/areaCity.do?no=18&loginId=${loginId}'">남극</button>
		<img src="${ctx}/img/worldmap1.png"/>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
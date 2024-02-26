<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${ctx}/css/earth.css">
<section class="earthSection">
	<div class="innerBox">
		<button id="seoul" onclick="location.href='${ctx}/areaCity.do?id=seoul'">서울</button>
		<img src="${ctx}/img/worldmap1.png"/>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
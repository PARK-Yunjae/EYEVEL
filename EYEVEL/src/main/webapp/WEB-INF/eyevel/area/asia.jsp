<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${ctx}/css/earth.css">
<section class="earthSection">
	<div class="innerBox">
		<button id="seoul" onclick="location.href='${ctx}/areaCity.do?id=1835847'">서울</button>
		<button id="tokyo" onclick="location.href='${ctx}/areaCity.do?id=1850147'">도쿄</button>
		<button id="delhi" onclick="location.href='${ctx}/areaCity.do?id=1273294'">델리</button>
		<img src="${ctx}/img/worldmap1.png"/>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
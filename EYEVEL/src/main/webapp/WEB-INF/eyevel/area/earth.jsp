<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/earth.css">
<section class="earthSection">
	<p class="earth_notice">원하는 대륙을 골라주세요</p>
	<div class="innerBox">
		<button id="asia" onclick="location.href='${ctx}/areaContinent.do?area=asia'">아시아</button>
		<button id="africa" onclick="location.href='${ctx}/areaContinent.do?area=africa'">아프리카</button>
		<button id="northAmerica" onclick="location.href='${ctx}/areaContinent.do?area=northAmerica'">북아메리카</button>
		<button id="southAmerica" onclick="location.href='${ctx}/areaContinent.do?area=southAmerica'">남아메리카</button>
		<button id="europe" onclick="location.href='${ctx}/areaContinent.do?area=europe'">유럽</button>
		<button id="oceania" onclick="location.href='${ctx}/areaContinent.do?area=oceania'">오세아니아</button>
		<button id="antarctica" onclick="location.href='${ctx}/areaContinent.do?area=antarctica'">남극</button>
		<img src="${ctx}/img/worldmap1.png"/>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>
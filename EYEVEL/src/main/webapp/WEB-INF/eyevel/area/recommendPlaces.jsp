<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script async
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfsi8KnJIWbseOCy2kEuaFLeG7pNpr36Y&libraries=places"></script>
<script defer src="${ctx}/js/recommendPlaces.js"></script>
<style>
/* 간단한 스타일링 */
#info-panel {
	width: 30%;
	height: 500px;
	overflow-y: auto; /* 내용이 많을 경우 스크롤 */
	float: left;
	padding: 20px;
	box-sizing: border-box;
}

#map {
	height: 500px;
	width: 70%;
	float: right;
}

select {
	margin-top: 10px;
}
</style>
</head>
<body>
	<div id="info-panel">
		<h2>장소 정보 및 이동 시간</h2>
		<div id="place-details"></div>
	</div>
	<div id="map"></div>
	<select id="mode">
		<option value="DRIVING">자동차</option>
		<option value="WALKING">도보</option>
		<option value="BICYCLING">자전거</option>
		<option value="TRANSIT">대중교통</option>
	</select>
</body>
</html>


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
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<style>
body, html {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	font-family: 'Roboto', sans-serif;
}

#info-panel {
	width: 30%;
	height: 100%;
	overflow-y: auto; /* 내용이 많을 경우 스크롤 */
	position: fixed;
	left: 0;
	top: 0;
	background-color: #f9f9f9; /* 밝은 회색 배경 */
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	padding: 20px;
	box-sizing: border-box;
}

#map {
	height: 100%;
	width: 70%;
	position: absolute;
	right: 0;
	top: 0;
}

#info-panel h2 {
	margin-top: 0;
	color: #333; /* 어두운 글자 색상 */
}

select {
	display: block;
	width: 200px;
	padding: 5px 10px;
	margin: 20px auto;
	font-size: 16px;
	border: 1px solid #ddd; /* 경계선 */
	border-radius: 5px; /* 모서리 둥글게 */
	background-color: #fff; /* 배경색 */
}

.place-info {
	padding: 10px;
	border-bottom: 1px solid #eee; /* 항목 사이의 구분선 */
	margin-bottom: 10px;
}

.place-info h3 {
	margin: 0 0 5px 0;
	color: #007bff; /* 제목 색상 */
}

.place-info p {
	margin: 4px 0;
	font-size: 14px;
	color: #666; /* 본문 글자 색상 */
}
#mode-selection {
    position: absolute;
    bottom: 20px;
    left: 20px;
    z-index: 5;
    background-color: white;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2); /* 약간의 그림자 효과 추가 */
}

.mode-title {
    font-size: 16px; /* 제목의 글자 크기 */
    margin-bottom: 5px; /* 제목과 선택 옵션 사이의 간격 */
    font-weight: bold; /* 글자 굵기 */
    color: #333; /* 글자 색상 */
}

#mode {
    width: 100%; /* 부모 요소인 #mode-selection의 너비에 맞춤 */
    padding: 5px;
    margin: 0; /* 기본 마진 제거 */
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
}
</style>
</head>
<body>
	<div id="info-panel">
		<h2>장소 정보 및 이동 시간</h2>
		<div id="place-details"></div>
	</div>
	<div id="map"></div>
	<div id="mode-selection">
		<div class="mode-title">이동수단 선택</div>
		<select id="mode">
			<option value="DRIVING">자동차</option>
			<option value="WALKING">도보</option>
			<option value="BICYCLING">자전거</option>
			<option value="TRANSIT">대중교통</option>
		</select>
	</div>

</body>
</html>


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
    background-color: #f2f2f2; /* 전체 배경색 변경 */
}

#info-panel {
    width: 30%;
    height: 100%;
    overflow-y: auto;
    position: fixed;
    left: 0;
    top: 0;
    background-color: #ffffff;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    padding: 20px;
    box-sizing: border-box;
    border-right: 2px solid #e0e0e0; /* 오른쪽 경계 추가 */
        transform: translateX(-100%);
    transition: transform 0.5s ease-out;
}
#info-panel.visible {
    transform: translateX(0);
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
    background-color: #f9f9f9; /* 배경색 변경 */
    padding: 15px;
    border-radius: 5px; /* 모서리 둥글게 */
    margin-bottom: 15px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1); /* 그림자 효과 추가 */
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
    background-color: #ffffff;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
    width: calc(30% - 40px); /* #info-panel의 너비에 맞춤 */
}

.mode-title {
    font-size: 16px;
    margin-bottom: 10px;
    font-weight: bold;
    color: #333;
}

#mode {
    width: 100%;
    padding: 8px 10px;
    margin: 0;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
    background-color: #f8f8f8; /* 배경색 변경 */
    cursor: pointer; /* 커서 변경 */
}
.custom-infowindow {
    position: absolute;
    bottom: 100px; /* 마커 위치에서 얼마나 위에 표시될지 */
    left: 50%;
    transform: translateX(-50%) scale(0);
    transition: transform 0.5s ease-out;
    background-color: white;
    padding: 10px;
    border-radius: 8px;
    border: 1px solid #ccc;
    box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    z-index: 100;
    display: none;
}

.custom-infowindow.visible {
    display: block;
    transform: translateX(-50%) scale(1);
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
		</select>
	</div>
<div id="custom-infowindow" class="custom-infowindow"></div>

</body>
</html>


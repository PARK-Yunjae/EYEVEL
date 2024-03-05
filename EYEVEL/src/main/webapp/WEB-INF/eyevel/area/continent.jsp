<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<script defer src="${ctx}/js/continent.js" defer></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/earth.css">
<div id="arealist" data-user="${list}"></div>
<section class="earthSection">
	<div class="innerBox">
	<div class="citys">
	<p class="city_notice">이미지를 누르시면 이동합니다.</p>
	<ul>
	<c:forEach var="city" items="${list}">
	<div class="${city.name} lon" value="${city.lon}" ></div>
	<div class="${city.name} lat" value="${city.lat}" ></div>
	<li>		
		<div class="city_btn" style="top:${city.dir_Y}px;left:${city.dir_X}px;">
            <div class="talkbubble_left">
               <h2>${city.name}</h2>${city.contents}
            </div>
            <div class="talkbubble_right">
               <h2>${city.name}</h2>${city.contents}
            </div>
            <a class="image"  id="${city.name}" onclick="location.href='${ctx}/areaCity.do?no=${city.no }&loginId=${loginId}'" >
               <img src="http://localhost:8080/IMAGES/area/${city.name}/${city.link_url}.jpg" alt="">
            </a>
		</div>
	</li>
	</c:forEach>
	</ul>
	</div>
		<img class="city_background_img" src="${ctx}/img/continent/${area}.png"/>
	</div>
</section>
<%@ include file="../parts/footer.jsp"%>


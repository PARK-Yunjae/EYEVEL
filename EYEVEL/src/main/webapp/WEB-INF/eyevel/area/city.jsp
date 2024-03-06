<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/city.css">
<script type="importmap">
    {
      "imports": {
        "@google/generative-ai": "https://esm.run/@google/generative-ai"
      }
    }
  </script>
<script defer src="${ctx}/js/city.js"></script>
<script defer src="${ctx}/js/panorama.js"></script>
<script async src="https://apis.google.com/js/api.js"></script>
<script async
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfsi8KnJIWbseOCy2kEuaFLeG7pNpr36Y&callback=initMap"></script>
<script defer src="${ctx}/js/cityYoutube.js"></script>
<script defer type="module" src="${ctx}/js/googleai.js"></script>
</script>
<div class="location" data-lon="${area.lon}" data-lat="${area.lat}"
	data-name="${area.name}" data-word="${area.link_url}"></div>
<c:forEach var="w" items="${img}">
	<div class="areaimg" data-img="${w.img}" data-weather="${w.weather}"></div>
</c:forEach>
<div id="map">
	<section class="city_section">
		<div class="innerBox">
			<div class="city_nav">
				<h2>${area.name}<div class="description"></div><i id="weather-icon"></i>
				
				</h2>
				<div>
					<h3>
						현재시간
						<div id="localTime">Loading...</div>
					</h3>
				</div>
				<c:if test="${loginId ne null}">
					<div class="zzimBtn">
						<span onclick="likeBtnCheck('${area.no}')"> <i id="Zzim"
							class="fa-heart fa<c:if test="${zzim eq null}">r</c:if>"></i>
						</span>
					</div>
				</c:if>
				</a>

			</div>
			<div class="city_content">
				<div class="video">
					<iframe id="youtube-video" src="" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>
				<ul class="tourist">
					<li>
						<h2>
							<span class="red" style="margin-right: 10px"><i
								class="fas fa-map-pin"></i></span>이 지역의 볼거리
						</h2> <!-- slick 사용위치 -->
						<div id="zzim_list">
							<div>
								<div class="image">
									<img src="https://picsum.photos/310/310" alt="">
								</div>
								<div class="content">
									<h3>${area.name}</h3>
									<p>${area.contents}</p>
									<div onclick="initMap()">
										<a href="javascript:void(0)" onclick="openPanorama()"
											class="panorama_btn">파노라마 뷰 보러가기 <i
											class="fas fa-arrow-right"></i>
										</a>
									</div>
									<p></p>
					
									<h3><b>AI 추천 관광지</b></h3>	
									<div id="output">Loading...</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div id="roadview" style="display: none;"></div>
			<div class="comment">
				<h3>댓글 ${fn:length(clist)}개</h3>
				<form name="commentform" action="${ctx}/commentAdd.do" method="post">
					<input type="hidden" name="id" value="${loginId}"> <input
						type="hidden" name="no" value="${area.no}"> <input
						type="hidden" name="areaId" value="${area.id}"> <input
						type="text" name="comment" id="" placeholder="댓글 입력..."> <input
						type="submit" class="button btn" value="등록"
						<c:if test="${loginId eq null }"> disabled="disabled"</c:if>>
				</form>
				<ul class="comment">
					<c:forEach var="c" items="${clist}">
						<li>
							<div class="profile_image">
								<img src="https://picsum.photos/100/100" alt="">
							</div>
							<div class="content">
								<div>
									<h4 class="name">${c.member_id}</h4>
									<p>${c.reg_datetime}</p>
								</div>
								<p>${c.contents}</p>
								<button
									onclick="location.href='${ctx}/commentDelete.do?no=${c.no}&areaNo=${area.no}'"
									<c:if test="${c.member_id ne loginId && loginId ne 'admin'}">style="display:none"</c:if>>삭제</button>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</section>
</div>
<div class="modal modal_panorama">
	<h2 class="title">${area.name}</h2>
	<p>${area.contents}</p>
	<div id="panorama" class="panorama"></div>
	<i class="fas fa-times" onclick="closePanorama()"></i>
</div>
<%@ include file="../parts/footer.jsp"%>

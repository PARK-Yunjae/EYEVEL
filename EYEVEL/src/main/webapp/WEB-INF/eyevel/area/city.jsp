<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/city.css">
<!-- suncalc 라이브러리. 일출일몰계산 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/suncalc/1.8.0/suncalc.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a495181d358f544f386983af5609309d"></script>
	    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfsi8KnJIWbseOCy2kEuaFLeG7pNpr36Y&callback=initialize&v=weekly"
      defer
    ></script>
	
<script>
	function openPanorama() {
	    document.querySelector(".city_section").style.display = "none";
	    let lat = parseFloat(document.querySelector(".location").dataset.lat);
	    let lon = parseFloat(document.querySelector(".location").dataset.lon);
	    
	    const location = { lat: lat, lng: lon };
	    const map = new google.maps.Map(document.getElementById("map"), {
	      center: location,
	      zoom: 14,
	    });
	    
	    const panorama = new google.maps.StreetViewPanorama(
	      document.getElementById("pano"), {
	        position: location,
	        pov: {
	          heading: 34,
	          pitch: 10,
	        },
	      }
	    );

	    map.setStreetView(panorama);
	}
</script>
<script defer src="${ctx}/js/city.js" defer></script>
<div class="location" data-lon="${area.lon}" data-lat="${area.lat}" data-name="${area.name}" ></div>
 <c:forEach var="w" items="${img}" >
<div class="areaimg" data-img="${w.img}" data-weather="${w.weather}" ></div>
 </c:forEach>
 <div id = "map">
<section class="city_section">
	<div class="innerBox">
		<div class="city_nav">
			<h2>${area.name}<div class="description"></div></h2>
		<div>
			<h3>현재시간
			<div id="localTime">Loading...</div></h3>
			</div>
			<c:if test="${loginId ne null}">
			 <div class="zzimBtn" >
			 <span onclick="likeBtnCheck('${area.no}')">
					<i id="Zzim" class="fa-heart fa<c:if test="${zzim eq null}">r</c:if>"></i>			 
			 </span>
				</div></c:if>
			</a>

		</div>
		<div class="city_content">
			<div class="video">
				<iframe width="850" height="476"
					src="https://www.youtube.com/embed/${area.link_url}"
					title="YouTube video player" frameborder="0" allowfullscreen></iframe>
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
								<div>
									<a href="javascript:void(0)" onclick="openPanorama()" class="panorama_btn">파노라마
										뷰 보러가기 <i class="fas fa-arrow-right"></i>
									</a>
								</div>
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
					<!-- 현재날짜 가져온 뒤에 비교 (아직 미적용) -->
					<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
					<fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"
						value="${c.reg_datetime}" />
					<fmt:formatDate var="dateTempParse" pattern="yyyy-MM-dd"
						value="$dateFmt}" /> --%>
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
								onclick="location.href='${ctx}/commentDelete.do?no=${c.no}&areaId=${area.id}'"
								<c:if test="${c.member_id ne loginId}">style="display:none"</c:if>>삭제</button>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</section>
</div>
<div class="modal modal_panorama">
	<h2 class="title">지역이름</h2>
	<p>짧은 설명</p>
	<div class="panorama"></div>
	<i class="fas fa-times" onclick="closePanorama()"></i>
</div>
<%@ include file="../parts/footer.jsp"%>

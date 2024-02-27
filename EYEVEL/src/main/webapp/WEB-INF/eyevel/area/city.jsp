<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/city.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a495181d358f544f386983af5609309d"></script>
<script>
	function openPanorama() {
		document.querySelector(".city_section").style.display = "none";
		// 일단 로드뷰를 넣을 곳을 만들어 둠
		var roadviewContainer = document.getElementById("roadview");
		roadviewContainer.style.display = "block";
		roadviewContainer.style.width = "50%";
		roadviewContainer.style.height = "100vh";
		var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
		var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

		var position = new kakao.maps.LatLng(37.5683, 126.9778);

		// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
		roadviewClient.getNearestPanoId(position, 50, function(panoId) {
			roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
		});
	}
</script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
<%-- <fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"
	value="${c.reg_datetime}" />
<fmt:formatDate var="dateTempParse" pattern="yyyy-MM-dd"
	value="$dateFmt}" /> --%>
<section class="city_section">
	<div class="innerBox">
		<div class="city_nav">
			<h2>${area.name}</h2>
			<h3>현지 시각 22:00</h3>
			<a
				href='${ctx}/<c:if test="${zzim eq null}">zzimAdd.do?no=${area.no}&id=${loginId}</c:if><c:if test="${zzim ne null}">zzimDelete.do?no=${area.no}&id=${loginId}</c:if>'>
				<div class="zzimBtn">
					<i class="fa<c:if test="${zzim eq null}">r</c:if> fa-heart"></i>
				</div>
			</a>
		</div>
		<div class="city_content">
			<div class="video">
				<iframe width="750" height="420"
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
									<a href="javascript:void(0)" onclick="openPanorama()">파노라마
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
<%@ include file="../parts/footer.jsp"%>

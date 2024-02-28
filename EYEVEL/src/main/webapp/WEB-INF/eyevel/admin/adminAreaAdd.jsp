<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:if test="${empty loginId || loginId ne 'admin'}">
	<script>
		location.href="${ctx}/main.do";
	</script>
</c:if>
<link rel="stylesheet" type="text/css" href="${ctx}/css/adminAddArea.css">
<script>
	document.querySelector('header').classList.add('black');
	document.querySelector('html').style.background="none";
</script>
   <section class="addAreaSection">
      <div class="innerBox">
         <h2 class="title">관광지 정보</h2>
         <form action="" method="post" enctype="multipart/form-data">
            <div class="input">
               <label for="area_name">관광지 이름</label>
               <input type="text" id="area_name" name="areaName" placeholder="관광지 이름 입력"
               	<c:if test="${vo ne null}">value="${vo.name}" class="readonly" readonly</c:if>>
               <p class="msg area_name_msg">이름을 입력해주세요</p>
            </div>
            <div class="input">
               <label for="area_id">관광지 아이디</label>
               <input type="text" id="area_id" name="areaId" placeholder="관광지 아이디 입력"
               <c:if test="${vo ne null}">value="${vo.id}" class="readonly" readonly</c:if>>
               <p class="msg area_id_msg">아이디를 입력해주세요</p>
            </div>
            <div class="input">
               <label for="area_url">동영상 URL</label>
               <input type="text" id="area_url" name="areaUrl" placeholder="관광지 동영상 URL 입력"
               <c:if test="${vo ne null}">value="${vo.link_url}"</c:if>>
               <p class="msg area_url_msg">url을 입력해주세요</p>
            </div>
            <p>관광지 배경 이미지</p>
            <div class="image_box input">
               <div class="image_am">
                  <label for="am_weather_clear">
                     <div class="image">
                        <img src=
                        <c:if test="${vo eq null}">"${ctx}/img/noImage.png"</c:if>
               			<c:if test="${vo ne null}">"${ctx}/img/${img}"</c:if>
                         alt="am_weather_clear" class="weather_img">
                     </div>
                  </label>
                  <input type="file" name="AmweatherClear" accept="image/*" id="am_weather_clear">
                  <label for="am_weather_cloudy" class="cloudy">
                     <div class="image">
                     <img src=
                        <c:if test="${vo eq null}">"${ctx}/img/noImage.png"</c:if>
               			<c:if test="${vo ne null}">"${ctx}/img/${img}"</c:if>
               			alt="am_weather_cloudy" class="weather_img">
                     </div>
                  </label>
                  <input type="file" name="AmweatherCloudy" accept="image/*" id="am_weather_cloudy">
                  <label for="am_weather_rain" class="rain">
                  	<div class="image">
                     <img src=
                        <c:if test="${vo eq null}">"${ctx}/img/noImage.png"</c:if>
               			<c:if test="${vo ne null}">"${ctx}/img/${img}"</c:if>
               			alt="am_weather_rain" class="weather_img">
                     </div>
                  </label>
                  <input type="file" name="AmweatherRain" accept="image/*" id="am_weather_rain">
                  <label for="am_weather_snow" class="snow">
                  	<div class="image">	
                     <img src=
                        <c:if test="${vo eq null}">"${ctx}/img/noImage.png"</c:if>
               			<c:if test="${vo ne null}">"${ctx}/img/${img}"</c:if>
               			alt="am_weather_snow" class="weather_img">
                     </div>
                  </label>
                  <input type="file" name="AmweatherSnow" accept="image/*" id="am_weather_snow">
               </div>
               <div class="image_pm">
                  <label for="pm_weather_clear">
                     <div class="image">
                     <img src=
                        <c:if test="${vo eq null}">"${ctx}/img/noImage.png"</c:if>
               			<c:if test="${vo ne null}">"${ctx}/img/${img}"</c:if>
               			alt="pm_weather_clear" class="weather_img">
                     </div>
                  </label>
                  <input type="file" name="PmweatherClear" accept="image/*" id="pm_weather_clear">
                  <label for="pm_weather_cloudy" class="cloudy">
                     <div class="image">
                     <img src=
                        <c:if test="${vo eq null}">"${ctx}/img/noImage.png"</c:if>
               			<c:if test="${vo ne null}">"${ctx}/img/${img}"</c:if>
               			alt="pm_weather_cloudy" class="weather_img">
                     </div>
                  </label>
                  <input type="file" name="PmweatherCloudy" accept="image/*" id="pm_weather_cloudy">
                  <label for="pm_weather_rain" class="rain">
                     <div class="image">
                     <img src=
                        <c:if test="${vo eq null}">"${ctx}/img/noImage.png"</c:if>
               			<c:if test="${vo ne null}">"${ctx}/img/${img}"</c:if>
               			alt="pm_weather_rain" class="weather_img">
                     </div>
                  </label>
                  <input type="file" name="PmweatherRain" accept="image/*" id="pm_weather_rain">
                  <label for="pm_weather_snow" class="snow">
                     <div class="image">
                     <img src=
                        <c:if test="${vo eq null}">"${ctx}/img/noImage.png"</c:if>
               			<c:if test="${vo ne null}">"${ctx}/img/${img}"</c:if>
               			alt="pm_weather_snow" class="weather_img">
                     </div>
                  </label>
                  <input type="file" name="PmweatherSnow" accept="image/*" id="pm_weather_snow">
               </div>
               <p class="msg area_img_msg">이미지를 모두 넣어주세요</p>
            </div>
            <div class="input">
               <p>관광지 설명</p>
               <textarea id="area_contents" name="areaContents" placeholder="관광지 설명 입력">
               <c:if test="${vo ne null}">${vo.contents}</c:if>
               </textarea>
               <p class="msg area_contents_msg">관광지 설명을 입력해주세요</p>
            </div>
            <input type="button" class="button btn" value="등록하기">
         </form>
      </div>
   </section>
<%@ include file="../parts/footer.jsp"%>
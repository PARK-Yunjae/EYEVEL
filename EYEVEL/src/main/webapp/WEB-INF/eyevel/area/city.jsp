<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${ctx}/css/city.css">

<section class="city_section">
      <div class="innerBox">
         <div class="city_nav">
            <h2>이름 (영문이름)</h2>
            <h3>현지 시각 22:00</h3>
            <div class="zzimBtn"><i class="far fa-heart"></i></div>
         </div>
         <div class="city_content">
            <div class="video"><iframe width="750" height="420" src="https://www.youtube.com/embed/viIhOorr11I?si=${area.link_url}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div>
            <ul class="tourist">
               <li>
                  <h2><span class="red" style="margin-right:10px"><i class="fas fa-map-pin"></i></span>이 지역의 볼거리</h2>
                  <!-- slick 사용위치 -->
                  <div id="zzim_list">
                     <div>
                        <div class="image"><img src="https://picsum.photos/310/310" alt=""></div>
                        <div class="content">
                           <h3>${area.name}</h3>
                           <p>${area.contents}</p>
                           <div>
                              <a href="해당 관광지(도시)페이지">파노라마 뷰 보러가기 <i class="fas fa-arrow-right"></i></a>
                           </div>
                        </div>
                     </div>
                  </div>
               </li>
            </ul>
         </div>
         <div class="comment">
            <h3>댓글 1개</h3>
            <form action="" method="post">
               <input type="text" name="comment" id="" placeholder="댓글 입력...">
               <input type="button" class="button btn" value="등록">
            </form>
            <ul class="comment">
               <li>
                  <div class="profile_image"><img src="https://picsum.photos/100/100" alt=""></div>
                  <div class="content">
                     <div>
                        <h4 class="name">이름</h4>
                        <p>1일전</p>
                     </div>
                     <p>I'm writing to express my admiration for your music channel. The content you provide is consistently outstanding, and I'm always excited to discover new tunes through your platform. Thank you for your musical contributions.</p>
                     <button>삭제</button>
                  </div>                  
               </li>
            </ul>
         </div>
      </div>
</section>
<%@ include file="../parts/footer.jsp"%>
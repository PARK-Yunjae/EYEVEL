<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/info.css">
<script src="${ctx}/js/info.js" defer>
console.log(${m.name});
</script>   
   <section class="info_section">
      <div class="innerBox">
         <form action="" method="post">
            <ul class="member_info">
               <li><div class="image"><img src="https://picsum.photos/300/300" alt=""></div></li>
               <li class="input_name">
                  <input type="text" name="name" id="name_input" value="${member.name}">
                  <p id="name_p">${member.name}</p>
                  <a onclick="nameUpdate()"><i class="fas fa-pen"></i></a>
               </li>
               <li class="input">
                  <label for="">아이디</label><br>
                  <input type="text" name="id" class="readonly" value="${member.id}" readonly>
               </li>
               <li class="input">
                  <label for="">비밀번호</label><br>
                  <input type="password" placeholder="비밀번호 입력" name="pw">
                  <p class="msg pw_msg">비밀번호를 입력해주세요</p>
               </li>
               <li class="input">
                  <label for="">이메일</label><br>
                  <input type="text" name="email"  class="readonly" value="${member.email}" readonly>
               </li>
               <li class="button_group">
                  <button class="btn1">확인</button>
                  <button class="btn2">취소</button>
               </li>
            </ul>
         </form>
         <ul class="zzim_list">
            <li>
               <h2><span class="red" style="margin-right:10px"><i class="fas fa-heart"></i></span> 내가 마음에 들어한 관광지</h2>
               <!-- slick 사용위치 -->
               <div id="zzim_list">
                  <div>
                     <div class="image"><img src="https://picsum.photos/310/310" alt=""></div>
                     <div class="content">
                        <h3>북아메리카</h3>
                        <p>긴 관광지 이름 매우 김</p>
                        <div>
                           <a href="해당 관광지(도시)페이지">보러가기 <i class="fas fa-arrow-right"></i></a>
                           <span onclick="/*찜하고 취소하기*/"><i class="far fa-heart"></i></span>
                        </div>
                     </div>
                  </div>
                  <div>
                     <div class="image"><img src="https://picsum.photos/320/320" alt=""></div>
                     <div class="content">
                        <h3>북아메리카</h3>
                        <p>긴 관광지 이름 매우 김</p>
                        <div>
                           <a href="해당 관광지(도시)페이지">보러가기 <i class="fas fa-arrow-right"></i></a>
                           <span onclick="/*찜하고 취소하기*/"><i class="far fa-heart"></i></span>
                        </div>
                     </div>
                  </div>
                  <div>
                     <div class="image"><img src="https://picsum.photos/330/330" alt=""></div>
                     <div class="content">
                        <h3>북아메리카</h3>
                        <p>긴 관광지 이름 매우 김</p>
                        <div>
                           <a href="해당 관광지(도시)페이지">보러가기 <i class="fas fa-arrow-right"></i></a>
                           <span onclick="/*찜하고 취소하기*/"><i class="far fa-heart"></i></span>
                        </div>
                     </div>
                  </div>
               </div>
            </li>
         </ul>
      </div>
   </section>
<%@ include file="../parts/footer.jsp"%>
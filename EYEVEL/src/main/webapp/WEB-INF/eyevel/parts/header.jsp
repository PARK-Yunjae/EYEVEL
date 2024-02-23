<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html style="background-image:linear-gradient(#00000033, #00000033), url('https://picsum.photos/id/74/200/300')">
<head>
<meta charset="UTF-8">
<title>EYEVEL</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/header.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/modal.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/loginJoinModal.css">
</head>
<body>
<header>
<div class="innerBox">
	<ul class="top_nav">
		<li class="logo_img">
               <img src="${ctx }/img/logo.png" alt="page Logo Image">
            </li>
            <li>
               <ul class="member">
                  <li>Guest 님</li>
                  <li><a href=""><i class="fas fa-user-alt"></i></a></li>
                  <li><a href=""><i class="fas fa-sign-out-alt"></i></a></li>
               </ul>
            </li>
         </ul>
         <ul class="gnb">
            <li><a href="">전체</a></li>
            <li><a href="">아시아</a></li>
            <li><a href="">아프리카</a></li>
            <li><a href="">북아메리카</a></li>
            <li><a href="">남아메리카</a></li>
            <li><a href="">유럽</a></li>
            <li><a href="">오세아니아</a></li>
            <li><a href="">남극</a></li>
		</ul>
	</div>
</header>
<!-- 모달 보이게 하기 위해서 class 'active' 추가 -->
<div class="modal modal_login">
    <div class="button_close"><i class="fas fa-times"></i></div>
    <h2>로그인</h2>
      <form action="" class="login">
         <div class="input">
            <label for="">id</label><br>
            <input type="text" placeholder="아이디 입력" name="id">
            <p class="msg id_msg">아이디를 입력해주세요</p>
         </div>
         <div class="input">
            <label for="">pw</label><br>
            <input type="password" placeholder="비밀번호 입력" name="pw">
            <p class="msg pw_msg">비밀번호를 입력해주세요</p>
         </div>
         <div class="button_group input">
            <input type="button" value="로그인" class="button btn1">
            <input type="button" value="회원가입" class="button btn2">
         </div>
      </form>
</div>
<div class="join_modal modal">
      <div class="button_close"><i class="fas fa-times"></i></div>
      <h2>회원가입</h2>
      <form action="" class="form">
         <div class="input_name input">
            <label for="">이름</label><br>
            <input type="text" placeholder="이름 입력" name="name">
            <p class="msg name_msg">이름을 입력해주세요</p>
         </div>
         <div class="input_id">
            <label for="">id</label><br>
            <div>
               <input type="text" placeholder="아이디 입력" name="id">
               <input type="button" value="중복확인" class="button btn">
            </div>
            <p class="msg id_msg">아이디를 입력해주세요</p>
         </div>
         <div class="input">
            <label for="">pw</label><br>
            <input type="password" placeholder="비밀번호 입력" name="pw">
            <p class="msg pw_msg">비밀번호를 입력해주세요</p>
         </div>
         <div class="input">
            <label for="">pw 확인</label><br>
            <input type="password" placeholder="비밀번호 확인" name="pwCheck">
            <p class="msg pw_msg">비밀번호를 확인해주세요</p>
         </div>
         <div class="input">
            <label for="">email</label><br>
            <input type="email" placeholder="이메일 입력" name="email">
            <p class="msg pw_msg">이메일을 입력해주세요</p>
         </div>
         <div class="input_terms">
            <label for="terms">개인정보 이용약관 동의</label>
            <input type="checkbox" id="terms" name="terms">
         </div>
         <div class="button_group">
            <input type="button" value="회원가입" class="button btn">
         </div>
      </form>
</div>
<div class="modal modal_alert">
	<h2><span><i class="fas fa-exclamation-triangle"></span></i>경고</h2>
      <p>삭제한 후에는 되돌리기가 불가능합니다.<br>정말 삭제하시겠습니까?</p>
      <div class="button_group">
         <button class="btn1">확인</button>
         <button class="btn2">취소</button>
      </div>
</div>
<div class="modal modal_warning">
      <h2><span><i class="fas fa-exclamation-triangle"></span></i>경고</h2>
      <p>이 페이지는 현재 사용할 수 없는 페이지입니다.<br>자세한 내용은 관리자에게 문의 바랍니다.</p>
      <div class="button_group">
         <button class="btn">확인</button>
      </div>
</div>
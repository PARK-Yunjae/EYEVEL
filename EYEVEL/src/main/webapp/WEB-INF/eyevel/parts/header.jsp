<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html
	style="background-image: linear-gradient(#00000033, #00000033), url('https://picsum.photos/id/74/4000/2000')">
<head>
<meta charset="UTF-8">
<title>EYEVEL</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/header.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/modal.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/loginJoinModal.css">
<script src="${ctx}/js/loginJoinModal.js" defer></script>
<!-- 날씨 표시를 위한 라이브러리 -->
<script defer
	src="https://use.fontawesome.com/releases/v5.15.2/js/all.js"
	integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF"
	crossorigin="anonymous"></script>
<script defer src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script defer src="${ctx}/js/weather.js" defer></script>
</head>
<body>
	<header>
		<div class="innerBox">
			<ul class="top_nav">
				<li class="logo_img"><a href="${ctx}/main.do"> <img
						src="${ctx}/img/logo.png" alt="page Logo Image">
				</a></li>
				<li>
					<div style="color: #fff">
						<div style="float: left;">
							<div class="weather_icon"></div>
						</div>
					</div>
				</li>
				<li>
					<div
						style="float: right; margin: -15px 0px 0px 0px; font-size: 11pt">
						<div class="temp_min"></div>
						<div class="temp_max"></div>
						<div class="humidity"></div>
						<div class="wind"></div>
						<div class="cloud"></div>
					</div>
					<div style="float: right; margin-top: -45px;">
						<div class="current_temp" style="font-size: 40pt"></div>
						<div class="weather_description" style="font-size: 20pt"></div>
						<div class="city" style="font-size: 13pt"></div>
					</div>

				</li>
				<li>
					<ul class="member">
						<li><c:if test="${empty loginId}">Guest 님</c:if> <c:if
								test="${!empty loginId}">${name} 님</c:if></li>
						<li>
							<a onclick=<c:if test="${empty loginId}">"loginModal()"</c:if>
									   <c:if test="${!empty loginId && loginId ne 'admin'}">"location.href='${ctx}/memberInfo.do'"</c:if>
									   <c:if test="${!empty loginId && loginId eq 'admin'}">"location.href='${ctx}/adminMain.do'"</c:if>>
								<i class="fas fa-user-alt"></i>
						</a></li>
						<c:if test="${!empty loginId }">
							<li>
								<a onclick="logoutCheck('${name}')">
								<i class="fas fa-sign-out-alt"></i>
								</a>
							</li>
						</c:if>
					</ul>
				</li>
			</ul>
			<ul class="gnb">
				<li><a href="${ctx}/areaEarth.do">전체</a></li>
				<li><a href="${ctx}/areaContinent.do?area=asia">아시아</a></li>
				<li><a href="${ctx}/areaContinent.do?area=africa">아프리카</a></li>
				<li><a href="${ctx}/areaContinent.do?area=northAmerica">북아메리카</a></li>
				<li><a href="${ctx}/areaContinent.do?area=southAmerica">남아메리카</a></li>
				<li><a href="${ctx}/areaContinent.do?area=europe">유럽</a></li>
				<li><a href="${ctx}/areaContinent.do?area=oceania">오세아니아</a></li>
				<li><a href="${ctx}/areaContinent.do?area=antarctica">남극</a></li>
			</ul>
		</div>
	</header>
	<!-- 모달 보이게 하기 위해서 class 'active' 추가 -->
	<div class="modal modal_login">
		<div class="button_close">
			<a onclick="loginExitBtn()"><i class="fas fa-times"></i></a>
		</div>
		<h2>로그인</h2>
		<form class="login">
			<div class="input">
				<label for="">id</label><br> <input type="text"
					placeholder="아이디 입력" name="id" id="login_id">
				<p class="msg id_msg login_id_msg">아이디를 입력해주세요</p>
			</div>
			<div class="input">
				<label for="">pw</label><br> <input type="password"
					placeholder="비밀번호 입력" name="pw" id="login_pw">
				<p class="msg pw_msg login_pw_msg">비밀번호를 입력해주세요</p>
			</div>
			<div class="button_group input">
				<input type="button" value="로그인" class="button btn1" id="loginCheck">
				<input type="button" value="회원가입" class="button btn2"
					onclick="joinModal()">
			</div>
		</form>
	</div>
	<div class="join_modal modal">
		<div class="button_close">
			<a onclick="joinExitBtn()"><i class="fas fa-times"></i></a>
		</div>
		<h2>회원가입</h2>
		<form action="${ctx}/memberJoin.do" class="form">
			<div class="input_name input">
				<label for="">이름</label><br> 
				<input type="text" placeholder="이름 입력" name="name" id="join_name">
				<p class="msg name_msg join_name_msg">이름을 입력해주세요</p>
			</div>
			<div class="input_id input">
				<label for="">id</label><br>
				<div>
					<input type="text" placeholder="아이디 입력" name="id" id="join_id">
					<input type="button" value="중복확인" class="button btn" id="join_idCheck">
				</div>
				<p class="msg id_msg join_id_msg">아이디를 입력해주세요</p>
			</div>
			<div class="input">
				<label for="">pw</label><br> <input type="password"
					placeholder="비밀번호 입력" name="pw" id="join_pw">
				<p class="msg pw_msg join_pw_msg">비밀번호를 입력해주세요</p>
			</div>
			<div class="input">
				<label for="">pw 확인</label><br> <input type="password"
					placeholder="비밀번호 확인" name="pwCheck" id="join_pwCheck">
				<p class="msg pwCheck_msg join_pwCheck_msg">비밀번호를 확인해주세요</p>
			</div>
			<div class="input">
				<label for="">email</label><br> <input type="email"
					placeholder="이메일 입력" name="email" id="join_email">
				<p class="msg email_msg join_email_msg">이메일을 입력해주세요</p>
			</div>

			<div class="input_terms input">
				<label for="join_terms">개인정보 이용약관 동의</label> <input type="checkbox"
					name="terms" id="join_terms" value="동의">
				<p class="msg terms_msg join_terms_msg">약관에 동의해주세요</p>
			</div>
			<div class="button_group">
				<input type="button" value="회원가입" class="button btn"
					onclick="joinCheck(form)">
			</div>
		</form>
	</div>
	<div class="modal modal_alert">
		<h2>
			<span><i class="fas fa-exclamation-triangle"></i></span>경고
		</h2>
		<p>
			삭제한 후에는 되돌리기가 불가능합니다.<br>정말 삭제하시겠습니까?
		</p>
		<div class="button_group">
			<button class="btn1">확인</button>
			<button class="btn2">취소</button>
		</div>
	</div>
	<div class="modal modal_warning">
		<h2>
			<span><i class="fas fa-exclamation-triangle"></i></span>경고
		</h2>
		<p>
			이 페이지는 현재 사용할 수 없는 페이지입니다.<br>자세한 내용은 관리자에게 문의 바랍니다.
		</p>
		<div class="button_group">
			<button class="btn">확인</button>
		</div>
	</div>
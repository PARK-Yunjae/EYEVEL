<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html
	style="background-image: linear-gradient(#00000033, #00000033), url('${ctx}/img/background.jpg')">
<head>
<meta charset="UTF-8">
<title>EYEVEL</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/header.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/modal.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/loginJoinModal.css">
<script src="${ctx}/js/header.js" defer></script>
<script src="${ctx}/js/modal.js" defer></script>
<script src="${ctx}/js/loginJoinModal.js" defer></script>
<!-- 네이버 외부 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 날씨 표시를 위한 라이브러리 -->
<!--
<script defer
	src="https://use.fontawesome.com/releases/v5.15.2/js/all.js"
	integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF"
	crossorigin="anonymous"></script>
<script defer src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script defer src="${ctx}/js/weather.js" defer></script>
  -->
</head>
<body>
	<div id="load">
	    <img src="${ctx}/img/Circles-menu-3.gif" alt="loading">
	</div>
	<header>
		<div class="innerBox">
			<ul class="top_nav">
				<li class="logo_img" onclick="location.href='${ctx}/main.do'"></li>
				<li>
					<div style="color: #fff">
						<div style="float: left;">
							<div class="weather_icon"></div>
						</div>
					</div>
				</li>
				<li>
					<div class="weather_description" style="font-size: 20pt"></div>
				</li>
				<li>
					<ul class="member">
						<li><c:if test="${empty loginId}">Guest 님</c:if> <c:if
								test="${!empty loginId}">${name} 님</c:if></li>
						<li><a
							onclick=<c:if test="${empty loginId}">"loginModal()"</c:if>
							<c:if test="${!empty loginId && loginId ne 'admin'}">"location.href='${ctx}/memberInfo.do'"</c:if>
							<c:if test="${!empty loginId && loginId eq 'admin'}">"location.href='${ctx}/adminMain.do'"</c:if>>
								<i class="fas fa-user-alt"></i>
						</a></li>
						<c:if test="${!empty loginId }">
							<li><a onclick="logoutCheck('${name}')"> <i
									class="fas fa-sign-out-alt"></i>
							</a></li>
						</c:if>
					</ul>
				</li>
			</ul>
			<input type="checkBox" id="dark_mode_check">
         	<label for="dark_mode_check" class="dark_mode_switch"></label>
			<div class="menuToggle">메뉴</div>
			<ul class="gnb">
				<li class="mobildeNone"<c:if test="${area eq 'all'}">class="on mobildeNone"</c:if>>
				<a href="${ctx}/areaEarth.do?area=all">전체</a></li>
				<li <c:if test="${area eq 'asia'}">class="on"</c:if>>
				<a href="${ctx}/areaContinent.do?area=asia">아시아</a></li>
				<li <c:if test="${area eq 'africa'}">class="on"</c:if>>
				<a href="${ctx}/areaContinent.do?area=africa">아프리카</a></li>
				<li <c:if test="${area eq 'northAmerica'}">class="on"</c:if>>
				<a href="${ctx}/areaContinent.do?area=northAmerica">북아메리카</a></li>
				<li <c:if test="${area eq 'southAmerica'}">class="on"</c:if>>
				<a href="${ctx}/areaContinent.do?area=southAmerica">남아메리카</a></li>
				<li <c:if test="${area eq 'europe'}">class="on"</c:if>>
				<a href="${ctx}/areaContinent.do?area=europe">유럽</a></li>
				<li <c:if test="${area eq 'oceania'}">class="on"</c:if>>
				<a href="${ctx}/areaContinent.do?area=oceania">오세아니아</a></li>
				<li <c:if test="${area eq 'antarctica'}">class="on"</c:if>>
				<a href="${ctx}/areaContinent.do?area=antarctica">남극</a></li>
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
  		<div id="naver_id_login"></div>
	</div>
	<div class="join_modal modal">
		<div class="button_close">
			<a onclick="joinExitBtn()"><i class="fas fa-times"></i></a>
		</div>
		<h2>회원가입</h2>
		<form action="${ctx}/memberJoin.do" class="form">
			<div class="input_name input">
				<label for="">이름</label><br> <input type="text"
					placeholder="이름 입력" name="name" id="join_name">
				<p class="msg name_msg join_name_msg">이름을 입력해주세요</p>
			</div>
			<div class="input_id input">
				<label for="">id</label><br>
				<div>
					<input type="text" placeholder="아이디 입력" name="id" id="join_id">
					<input type="button" value="중복확인" class="button btn"
						id="join_idCheck">
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
			<div class="input input_email">
				<label for="">email</label><br>
				<div>
					 <input type="email"
						placeholder="이메일 입력" name="email" id="join_email">
					<p class="msg email_msg join_email_msg">이메일을 입력해주세요</p>
					<input type="button" value="전송"  onclick="emailVerification()" class="button btn">
				</div>
			</div>
			<div class="input input_email_verification">
				<input type="number" id="join_email_verification" placeholder="인증 번호 입력" >
				<label class="email_time">시간</label>
				<p class="msg email_msg_verification join_email_msg_verification">인증번호가 틀렸습니다</p>
			</div>
			<div class="input_terms input">
				<input type="checkbox" name="terms" id="join_terms" value="동의">
				<label for="join_terms" class="label_terms">개인정보 이용약관 동의</label>
				<p class="msg terms_msg join_terms_msg">약관에 동의해주세요</p>
			</div>
			<div class="button_group">
				<input type="button" value="회원가입" class="button btn"
					onclick="joinCheck(form)">
			</div>
		</form>
	</div>
	<div class="modal modal_alert">
		<h2></h2>
		<p></p>
		<div class="button_group">
			<button class="btn1">확인</button>
			<button class="btn2">취소</button>
		</div>
	</div>
	<div class="modal modal_warning">
		<h2></h2>
		<p></p>
		<div class="button_group">
			<button class="btn">확인</button>
		</div>
	</div>
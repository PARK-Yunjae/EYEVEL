<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:if test="${empty loginId}">
	<script>
		location.href="${ctx}/main.do";
	</script>
</c:if>
<link rel="stylesheet" type="text/css" href="${ctx}/css/info.css">
<script src="${ctx}/js/info.js" defer></script>
<section class="info_section">
	<div class="innerBox">
		<form action="${ctx}/memberUpdate.do" method="post" enctype="multipart/form-data">
			<ul class="member_info">
				<li>
					<label for="img" class="image">
						<img src='http://localhost:8080//IMAGES/profile/${member.img}' id="profileImg" alt="이미지">
					</label>
					<input type="file" name="img" id="img" accept="image/*" onchange="readURL(this)">
				</li>
				<li class="input_name">
					<input type="text" name="name" id="name_input" value="${member.name}">
					<p id="name_p">${member.name}</p> 
					<a onclick="nameUpdate()">
					<i id="input_name_i"class="fas fa-pen"></i></a>
				</li>
				<li class="input">
					<label for="">아이디</label><br> 
					<input type="text" name="id" class="readonly" value="${member.id}" readonly></li>
				<li class="input">
					<label for="">비밀번호</label><br> 
					<input type="password" placeholder="비밀번호 입력" name="pw">
					<p class="msg info_pw_msg">비밀번호를 입력해주세요</p>
				</li>
				<li class="input"><label for="">이메일</label><br> 
					<input type="text" name="email" class="readonly" value="${member.email}" readonly></li>
				<li class="button_group">
					<input type="button" class="btn1 button" value="수정하기" onclick="memberUpdateCheck(form,'${member.pw}')" >
					<input type="button" class="btn2 button" value="회원탈퇴" onclick="location.href='${ctx}/main.do'">
				</li>
			</ul>
		</form>
		<ul class="zzim_list">
			<li>
				<h2>
					<span class="red" style="margin-right: 10px">
					<i class="fas fa-heart"></i></span> 내가 마음에 들어한 관광지
				</h2> <!-- slick 사용위치 -->
				<div id="zzim_list">
					<div>
						<div class="image">
							<img src="https://picsum.photos/310/310" alt="">
						</div>
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
						<div class="image">
							<img src="https://picsum.photos/320/320" alt="">
						</div>
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
						<div class="image">
							<img src="https://picsum.photos/330/330" alt="">
						</div>
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
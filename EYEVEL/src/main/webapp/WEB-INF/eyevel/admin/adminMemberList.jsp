<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:if test="${empty loginId || loginId ne 'admin'}">
	<script>
		location.href="${ctx}/main.do";
	</script>
</c:if>
<script>
	document.querySelector('header').classList.add('black');
	document.querySelector('html').style.background="none";
</script>
<section>
      <div class="innerBox">
         <h2 class="title">유저 관리</h2>
         <table class="less_padding">
            <tr>
               <th>No</th>
               <th>프로필</th>
               <th>이름</th>
               <th>아이디</th>
               <th>패스워드</th>
               <th>이메일</th>
               <th>관리</th>
            </tr>
			<c:forEach var="vo" items="${list}">
				<tr>
	               	<td><img src="http://localhost:8080//IMAGES/${vo.img}" alt="user profile image"></td>
					<td><a href="${ctx}/memberInfo.do?id=${vo.id}">${vo.id}</a></td>
					<td>${vo.pw}</td>
					<td>${vo.name}</td>
					<td>${vo.email}</td>
					<td>
	                  <a href=""><i class="fas fa-pen"></i></a>
	                  <a href="" class="remove_icon"><i class="fas fa-trash-alt"></i></a>
					</tr>
			</c:forEach>
         </table>
         <ul class="paging">
            <li onclick="location.href=''"><i class="fas fa-chevron-left"></i></li>
            <li onclick="location.href=''">1</li>
            <li onclick="location.href=''">2</li>
            <li onclick="location.href=''">3</li>
            <li onclick="location.href=''">4</li>
            <li onclick="location.href=''">5</li>
            <li onclick="location.href=''"><i class="fas fa-chevron-right"></i></li>
         </ul>
      </div>
</section>
<%@ include file="../parts/footer.jsp"%>
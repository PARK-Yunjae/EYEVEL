<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="../parts/header.jsp" %>
		<c:if test="${empty loginId || loginId ne 'admin'}">
			<script>
				location.href = "${ctx}/main.do";
			</script>
		</c:if>
		<script src="${ctx}/js/adminMemberList.js" defer></script>
		<section>
			<div class="innerBox">
				<h2 class="title">유저 관리</h2>
				<table class="less_padding">
					<tr>
						<th class="mobileNone">프로필</th>
						<th>이름</th>
						<th>아이디</th>
						<th>패스워드</th>
						<th>이메일</th>
						<th>관리</th>
					</tr>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td class="mobileNone"><img src="http://localhost:8080//IMAGES/profile/${vo.img}" alt="user profile image"></td>
							<td>${vo.name}</td>
							<td>${vo.id}</td>
							<td>${vo.pw}</td>
							<td>${vo.email}</td>
							<td>
								<a href="${ctx}/memberInfo.do?id=${vo.id}"><i class="fas fa-pen"></i></a>
                <c:if test="${vo.id ne 'admin' }">
								  <a onclick="memberDelteModal('${vo.id}')" class="remove_icon"><i class="fas fa-trash-alt"></i></a>
                </c:if>
              </td>
						</tr>
					</c:forEach>
				</table>
				<ul class="paging">
					<c:if test="${startPage>3}">
						<li class="start" onclick="location.href='${ctx}/memberList.do?page=${startPage-3}&start=${startPage-3}'"><i
								class="fas fa-chevron-left"></i></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li onclick="location.href='${ctx}/memberList.do?page=${i}&start=${startPage}'" <c:if test="${i == page}">
							class="on"</c:if>>${i}</li>
					</c:forEach>
					<c:if test="${totalPage>endPage}">
						<li class="end" onclick="location.href='${ctx}/memberList.do?page=${startPage+3}&start=${startPage+3}'"><i
								class="fas fa-chevron-right"></i></li>
					</c:if>
				</ul>
			</div>
		</section>
		<%@ include file="../parts/footer.jsp" %>
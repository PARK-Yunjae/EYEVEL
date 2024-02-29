<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<c:if test="${empty loginId || loginId ne 'admin'}">
	<script>
		location.href="${ctx}/main.do";
	</script>
</c:if>
<script src="${ctx}/js/adminAreaList.js" defer></script>
<section>
      <div class="innerBox">
         <h2 class="title">관광지 관리</h2>
         <button class="btn" style="align-self: flex-end;" onclick="location.href='${ctx}/adminAreaSelect.do'">관광지 추가</button>
         <table>
            <tr>
               <th>No</th>
               <th>대륙</th>
               <th>이름</th>
               <th>동영상 링크</th>
               <th>관리</th>
            </tr>
            <c:forEach var="vo" items="${list}">
            <tr>
               <td>${vo.no}</td>
               <td>${vo.continent}</td>
               <td>${vo.name}</td>
               <td>${vo.link_url}</td>
               <td>
                  <a href="${ctx}/adminAreaInfo.do?no=${vo.no}"><i class="fas fa-pen"></i></a>
                  <a onclick="areaDelteModal(${vo.no})" class="remove_icon"><i class="fas fa-trash-alt"></i></a>
               </td>
            </tr>
            </c:forEach>
         </table>
         <ul class="paging">
         	<c:if test="${startPage>3}">
            	<li class="start" onclick="location.href='${ctx}/adminAreaList.do?page=${startPage-3}&start=${startPage-3}'"><i class="fas fa-chevron-left"></i></li>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
            	<li onclick="location.href='${ctx}/adminAreaList.do?page=${i}&start=${startPage}'" <c:if test="${i == page}">class="on"</c:if>>${i}</li>
			</c:forEach>
			<c:if test="${totalPage>endPage}">
				<li class="end" onclick="location.href='${ctx}/adminAreaList.do?page=${startPage+3}&start=${startPage+3}'"><i class="fas fa-chevron-right"></i></li>
			</c:if>
         </ul>
      </div>
   </section>
<%@ include file="../parts/footer.jsp"%>
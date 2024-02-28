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
<%@ include file="../parts/footer.jsp"%>
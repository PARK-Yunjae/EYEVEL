<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<script>
	let contextPath = window.location.pathname.substring(0,
			window.location.pathname.indexOf("/", 2));
	location.href = contextPath + "/main.do";
</script>
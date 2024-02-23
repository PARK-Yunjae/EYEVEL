<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
   <c:set var="ctx" value="${ pageContext.request.contextPath }" />
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>

<h1 class="py-3">ȸ�� ���</h1>

<table class=" py-10 table table-bordered">
	<tr>
		<td>���̵�</td>
		<td>��й�ȣ</td>
		<td>�̸�</td>
		<td>�̸���</td>
		<td>�̹���</td>
		<td>����</td>
	</tr>
	<c:forEach var="vo" items="${list}">
		<tr>
			<td><a href="${ctx}/memberContent.do?num=${vo.id}">${vo.id}</a></td>
			<td>${vo.pw}</td>
			<td>${vo.name}</td>
			<td>${vo.email}</td>
			<td>${vo.img}</td>
			<td><input type="button" value="����" class="btn btn-outline-dark"
				onclick="deleteFn('${vo.id}')"
				<c:if test="${loginId!=vo.id and loginId!='admin'}"> 
    	              disabled="disabled"
          	      </c:if>/></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>
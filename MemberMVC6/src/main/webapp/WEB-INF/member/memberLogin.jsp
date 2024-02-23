<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../../header.jsp" %>


<h1 class="py-3"> 로그인 </h1>

<form action="${ctx}/memberLogin.do" method="post">
<table class="table table-bordered">
  <tr>
    <td>아이디</td>
    <td><input class="col-12" type="text" name="id" required/></td>
  </tr>
  <tr>
    <td>패스워드</td>
    <td><input class="col-12" type="password" name="pw" required/></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="submit" value="로그인" class="col-3 btn btn-primary"/>
    </td>
  </tr>
</table>
</form>
</body>
</html>
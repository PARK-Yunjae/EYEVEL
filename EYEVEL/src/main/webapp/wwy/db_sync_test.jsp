<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
   <c:set var="ctx" value="${ pageContext.request.contextPath }" />
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/header.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/modal.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/loginJoinModal.css">
</head>
<body>
<div class="w-50 py-3" onclick="location.href='${ctx}/memberList.do'"> 회원목록 </div>

<div class="modal modal_login active">
    <div class="button_close"><i class="fas fa-times"></i></div>
    <h2>�α���</h2>
      <form action="${ctx}/memberLogin.do" class="login" method="post">
         <div class="input">
            <label for="">id</label><br>
            <input type="text" placeholder="���̵� �Է�" name="id">
            <p class="msg id_msg">���̵� �Է����ּ���</p>
         </div>
         <div class="input">
            <label for="">pw</label><br>
            <input type="password" placeholder="��й�ȣ �Է�" name="pw">
            <p class="msg pw_msg">��й�ȣ�� �Է����ּ���</p>
         </div>
         <div class="button_group input">
            <input type="button" value="�α���" class="button btn1">
            <input type="button" value="ȸ������" class="button btn2 ">
         </div>
      </form>
</div>
<div class="join_modal modal">
      <div class="button_close"><i class="fas fa-times"></i></div>
      <h2>ȸ������</h2>
      <form action="" class="form">
         <div class="input_name input">
            <label for="">�̸�</label><br>
            <input type="text" placeholder="�̸� �Է�" name="name">
            <p class="msg name_msg">�̸��� �Է����ּ���</p>
         </div>
         <div class="input_id">
            <label for="">id</label><br>
            <div>
               <input type="text" placeholder="���̵� �Է�" name="id">
               <input type="button" value="�ߺ�Ȯ��" class="button btn">
            </div>
            <p class="msg id_msg">���̵� �Է����ּ���</p>
         </div>
         <div class="input">
            <label for="">pw</label><br>
            <input type="password" placeholder="��й�ȣ �Է�" name="pw">
            <p class="msg pw_msg">��й�ȣ�� �Է����ּ���</p>
         </div>
         <div class="input">
            <label for="">pw Ȯ��</label><br>
            <input type="password" placeholder="��й�ȣ Ȯ��" name="pwCheck">
            <p class="msg pw_msg">��й�ȣ�� Ȯ�����ּ���</p>
         </div>
         <div class="input">
            <label for="">email</label><br>
            <input type="email" placeholder="�̸��� �Է�" name="email">
            <p class="msg pw_msg">�̸����� �Է����ּ���</p>
         </div>
         <div class="input_terms">
            <label for="terms">�������� �̿��� ����</label>
            <input type="checkbox" id="terms" name="terms">
         </div>
         <div class="button_group">
            <input type="button" value="ȸ������" class="button btn">
         </div>
      </form>
</div>
<div class="modal modal_alert">
	<h2><span><i class="fas fa-exclamation-triangle"></span></i>���</h2>
      <p>������ �Ŀ��� �ǵ����Ⱑ �Ұ����մϴ�.<br>���� �����Ͻðڽ��ϱ�?</p>
      <div class="button_group">
         <button class="btn1">Ȯ��</button>
         <button class="btn2">���</button>
      </div>
</div>
<div class="modal modal_warning">
      <h2><span><i class="fas fa-exclamation-triangle"></span></i>���</h2>
      <p>�� �������� ���� ����� �� ���� �������Դϴ�.<br>�ڼ��� ������ �����ڿ��� ���� �ٶ��ϴ�.</p>
      <div class="button_group">
         <button class="btn">Ȯ��</button>
      </div>
</div>

</body>
</html>
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
<div class="w-50 py-3" onclick="location.href='${ctx}/memberList.do'"> М ▄Л⌡░К╙╘К║² </div>

<div class="modal modal_login active">
    <div class="button_close"><i class="fas fa-times"></i></div>
    <h2>╥н╠вюн</h2>
      <form action="${ctx}/memberLogin.do" class="login" method="post">
         <div class="input">
            <label for="">id</label><br>
            <input type="text" placeholder="╬фюл╣П ют╥б" name="id">
            <p class="msg id_msg">╬фюл╣П╦╕ ют╥бгьаж╪╪©Д</p>
         </div>
         <div class="input">
            <label for="">pw</label><br>
            <input type="password" placeholder="╨Я╧п╧Ьхё ют╥б" name="pw">
            <p class="msg pw_msg">╨Я╧п╧Ьхё╦╕ ют╥бгьаж╪╪©Д</p>
         </div>
         <div class="button_group input">
            <input type="button" value="╥н╠вюн" class="button btn1">
            <input type="button" value="х╦©Ь╟║ют" class="button btn2 ">
         </div>
      </form>
</div>
<div class="join_modal modal">
      <div class="button_close"><i class="fas fa-times"></i></div>
      <h2>х╦©Ь╟║ют</h2>
      <form action="" class="form">
         <div class="input_name input">
            <label for="">юл╦╖</label><br>
            <input type="text" placeholder="юл╦╖ ют╥б" name="name">
            <p class="msg name_msg">юл╦╖ю╩ ют╥бгьаж╪╪©Д</p>
         </div>
         <div class="input_id">
            <label for="">id</label><br>
            <div>
               <input type="text" placeholder="╬фюл╣П ют╥б" name="id">
               <input type="button" value="аъ╨╧х╝юн" class="button btn">
            </div>
            <p class="msg id_msg">╬фюл╣П╦╕ ют╥бгьаж╪╪©Д</p>
         </div>
         <div class="input">
            <label for="">pw</label><br>
            <input type="password" placeholder="╨Я╧п╧Ьхё ют╥б" name="pw">
            <p class="msg pw_msg">╨Я╧п╧Ьхё╦╕ ют╥бгьаж╪╪©Д</p>
         </div>
         <div class="input">
            <label for="">pw х╝юн</label><br>
            <input type="password" placeholder="╨Я╧п╧Ьхё х╝юн" name="pwCheck">
            <p class="msg pw_msg">╨Я╧п╧Ьхё╦╕ х╝юнгьаж╪╪©Д</p>
         </div>
         <div class="input">
            <label for="">email</label><br>
            <input type="email" placeholder="юл╦чюо ют╥б" name="email">
            <p class="msg pw_msg">юл╦чюою╩ ют╥бгьаж╪╪©Д</p>
         </div>
         <div class="input_terms">
            <label for="terms">╟Ёюна╓╨╦ юл©К╬Ю╟Э ╣©юг</label>
            <input type="checkbox" id="terms" name="terms">
         </div>
         <div class="button_group">
            <input type="button" value="х╦©Ь╟║ют" class="button btn">
         </div>
      </form>
</div>
<div class="modal modal_alert">
	<h2><span><i class="fas fa-exclamation-triangle"></span></i>╟Ф╟М</h2>
      <p>╩Ха╕гя хд©║╢б ╣г╣╧╦╝╠Б╟║ ╨р╟║╢игу╢о╢ы.<br>а╓╦╩ ╩Ха╕го╫ц╟з╫ю╢о╠Н?</p>
      <div class="button_group">
         <button class="btn1">х╝юн</button>
         <button class="btn2">цК╪р</button>
      </div>
</div>
<div class="modal modal_warning">
      <h2><span><i class="fas fa-exclamation-triangle"></span></i>╟Ф╟М</h2>
      <p>юл фДюлаЖ╢б гЖюГ ╩Г©Кгр ╪Ж ╬Ь╢б фДюлаЖют╢о╢ы.<br>юз╪╪гя Ё╩©Кю╨ ╟Э╦╝юз©║╟т ╧╝юг ╧ы╤Ь╢о╢ы.</p>
      <div class="button_group">
         <button class="btn">х╝юн</button>
      </div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
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
            <tr>
               <td>1</td>
               <td><img src="https://picsum.photos/100/100" alt="user profile image"></td>
               <td>이름</td>
               <td>아이디</td>
               <td>패스워드</td>
               <td>이메일</td>
               <td>
                  <a href=""><i class="fas fa-pen"></i></a>
                  <a href="" class="remove_icon"><i class="fas fa-trash-alt"></i></a>
               </td>
            </tr>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
      <div class="innerBox">
         <h2 class="title">관광지 관리</h2>
         <button class="btn" style="align-self: flex-end;">관광지 추가</button>
         <table>
            <tr>
               <th>No</th>
               <th>대륙</th>
               <th>이름</th>
               <th>동영상 링크</th>
               <th>관리</th>
            </tr>
            <tr>
               <td>1</td>
               <td>아시아</td>
               <td>서울</td>
               <td>https://www.youtube.com/watch?v=VTsGRGeBj98</td>
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
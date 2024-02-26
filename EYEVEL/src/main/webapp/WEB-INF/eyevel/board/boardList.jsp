<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/boardList.css">
   <section class="boardSection">
      <div class="innerBox">
         <h2 class="title">게시판</h2>
         <form action="" class="search">
         <input type="text" placeholder="검색">
         <a><i class="fas fa-search"></i></a>
         </form>
         <button class="btn" onclick="location.href='${ctx}/boardAdd.do'">글쓰기</button>
         <ul class="category">
            <li class="on">전체</li>
            <li>공지사항</li>
            <li>카테고리</li>
         </ul>
         <table>
            <tr>
               <th>No</th>
               <th>카테고리</th>
               <th style="width: 40%;">제목</th>
               <th>작성자</th>
               <th>작성일</th>
               <th>조회수</th>
               <th>좋아요</th>
            </tr>
            <tr>
               <td>1</td>
               <td>공지사항</td>
               <td><a href="">엄청나게 긴 제목 하나 넣어 놓으면 길이가 길어지니까 길게 유지할 수 있음</a></td>
               <td>작성자이름</td>
               <td>2024-02-21</td>
               <td>1</td>
               <td>2</td>
            </tr>
            <tr>
               <td>2</td>
               <td>북아메리카</td>
               <td>로스앤젤리스</td>
               <td>2024-02-23</td>
               <td>1</td>
               <td>2</td>
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
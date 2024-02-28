<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/adminSelectArea.css">
<script>
	document.querySelector('header').classList.add('black');
	document.querySelector('html').style.background="none";
</script>
   <section class="adminSelectSection">
      <div class="innerBox">
         <ul class="continent_nav gnb">
            <li onclick="">아시아</li>
            <li onclick="">아프리카</li>
            <li onclick="">북아메리카</li>
            <li onclick="">남아메리카</li>
            <li onclick="">유럽</li>
            <li onclick="">오세아니아</li>
            <li onclick="">남극</li>
         </ul>
         <div class="select_image">
            <img src="/img/worldmap1.png" alt="">
         </div>
      </div>
   </section>
<%@ include file="../parts/footer.jsp"%>
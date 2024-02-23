<%@page import="kr.basic.model.MemberVO"%>
<%@page import="kr.basic.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../../header.jsp" %>
<style>
   #photo{
      width:30%;
      height:30%;
      
   }
</style>
<body>
<c:if test="${vo==null}">
  <h1 class="py-3"> 일치하는 회원이 없습니다 </h1>
</c:if>
<c:if test="${vo ne null}">
<h1 class="py-3" > ${vo.name}  회원의 상세보기 </h1>
<form action="${ctx}/memberUpdate.do" method="post">
<input type="hidden" id="num" name="num" value="${vo.num}"/>
<table class='table table-bordered'>
  <tr>
    <td>번호</td>
    <td class="left"> ${vo.num}</td>
  </tr>
   <tr>
    <td>아이디</td>
    <td class="left">${vo.id}</td>
  </tr>
   <tr>
    <td>비밀번호</td>
    <td class="left">${vo.pass}</td>
  </tr>  
    <tr>
    <td>이름</td>
    <td class="left">${vo.name}</td>
  </tr> 
  <tr>
    <td>나이</td>
    <td><input class="col-12"  type="text" name="age" value="${vo.age}"/></td>
  </tr> 
     <tr>
    <td>이메일</td>
    <td><input class="col-12"  type="text" name="email" value="${vo.email}"/></td>
  </tr>
  <tr>
    <td>전화번호</td>
    <td><input class="col-12"  type="text" name="phone" value="${vo.phone}"/></td>
  </tr> 
  <tr>
    <td>프로필 이미지</td>
        <td>
    	      	   <c:if test="${vo.sFileName!=null}">
    	         <img src="/member/img/${vo.sFileName}" id="photo"/>
    	   </c:if>
    	      	   <c:if test="${vo.sFileName==null}">
    	         <img src="https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg" id="photo" class="defalut">
    	   </c:if>
    	      </td>
  </tr> 
  <tr>
    <td colspan="2" align="center">
       <input type="button" value="사진 업로드" class='col-3 btn btn-success' id="uploadBtn"  <c:if test="${loginId!=vo.id and loginId!='admin'}"> 
    	              disabled="disabled"
          	      </c:if>/> 
       <input type="submit" value="수정하기" class='col-3 btn btn-primary' <c:if test="${loginId!=vo.id and loginId!='admin'}"> 
    	              disabled="disabled"
          	      </c:if>/>
       <input type="button" value="사진 삭제" class='col-3 btn btn-warning' id="deleteBtn"   <c:if test="${loginId!=vo.id and loginId!='admin'}"> 
    	              disabled="disabled"
          	      </c:if>/> 
    </td>
  </tr>
</table>


</form>

<div id="upload">
<form id="imgForm" enctype="multipart/form-data"">
<input id="uploadFile" type="file" name="uploadFile" accept="image/*">
<input type="hidden" name="num" value="${vo.num}"/>
</form>
</div>
</c:if>
</body>
</html>

<script>
   let uploadDiv = document.querySelector("#upload");
   uploadDiv.style.display = "none";
   let uploadBtn = document.querySelector("#uploadBtn");
   let deleteBtn = document.querySelector("#deleteBtn");

   let input = document.querySelector("#uploadFile");
   //  input type ='file' =>> files => 리스트 안에 파일 객체들이 들어가있다 
   input.addEventListener("change" , ()=> {
	   let fName= input.files[0].name;
	   let fSize= input.files[0].size;
	   console.log("fileName =" + fName);
	   console.log("fileSize =" + fSize);
	   
	  
		let fileForm = /(.*?)\.(jpg|jpeg|png|gif|PNG)$/;
		let maxSize = 10 * 1024 * 1024;
		
		if(fName != "" && fName != null) {
		 
		    if(!fName.match(fileForm)) {
		    	alert("이미지 파일만 업로드 가능");
		        return false;
		    }
		    if(fSize >= maxSize) {
		    	alert("파일 사이즈는 5MB까지 가능");
		        return false;
		    }
		}else{
			return false;
		}
		
		let form = document.querySelector("#imgForm");
		  let formData = new FormData(form);
		
		  fetch('memberUploadImg.do', {
			    method: 'POST',
			    body: formData,
			  })
			    .then(response => response.text())
			    .then(data => {
			      if (data === 'fail') {
			        alert('이미지 업로드 실패');
			      } else {
			        alert('이미지 업로드 성공');
			        
			        let beforeName = document.querySelector('#photo').src;
			        beforeName = beforeName.substring(beforeName.lastIndexOf("/")+1);
			        let src = '/member/img/' + data;
			        document.querySelector('#photo').setAttribute('src', src);
			        document.querySelector('#photo').classList.remove("defalut");
			        
			        deleteBeforeImg(beforeName);
			      }
			    })
			    .catch(error => {
			      console.log('error=', error);
			    });
    
   })
   
   

   
   
   uploadBtn.addEventListener("click" , ()=> {
	   uploadDiv.style.display = "block";
   });
   
   deleteBtn.addEventListener("click" , ()=> {
	   if(document.querySelector('.defalut')){
		   alert('기본이미지는 삭제할 수 없습니다');
		   return;
	   }
	   
		  fetch('memberDeleteImg.do', {
			    method: "POST",
			    headers: {
			      "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
			    },
			    body: "num=" + document.querySelector('#num').value,
			  })
			    .then(response => response.text())
			    .then(data => {
			      if (data === 'fail') {
			        alert('이미지 삭제 실패');
			      } else {
			        alert('이미지 삭제 성공');
			
			        let src = 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg';
			        document.querySelector('#photo').setAttribute('src', src);
			        document.querySelector('#photo').classList.add("defalut");
			   
			      }
			    })
			    .catch(error => {
			      console.log('error=', error);
			    });
   });
   
   
   function deleteBeforeImg(savedFileName){
	   
	   let url ='memberUploadImg.do?sName='+ savedFileName;
		  fetch(url).then(response => console.log(response))
			  .catch(error => {
			      console.log('error=', error);
			});
   }
   
  

</script>
// 헤더 배경 변경 - 화이트
document.querySelector('header').classList.add('black');
document.querySelector('html').style.background = "none";

let boxClick = true;

// 옵션 보이기 & 감추기
function optionCheck(){
	if (boxClick) {
		document.querySelector(".edit_box").classList.add("on");
		boxClick = false;
	} else {
		document.querySelector(".edit_box").classList.remove("on");
		boxClick = true;
	}
}

// 좋아요 버튼 눌렀을 시 
function likeBtnCheck(no,loginId){
	// 로그인 안한 유저는 못함
	if(loginId == ""){
		return false;
	}
	let heart = document.querySelector("#heart");
	let heart_count = document.querySelector(".board_heart_count");
	let url;
	if(heart.classList.item(2) == "far"){
		url = "validAddBoardLike.do";
		heart.classList.remove("far");
		heart.classList.add("fa");
		heart_count.innerHTML = parseInt(heart_count.innerHTML) + 1;
	}
	else if(heart.classList.item(2) == "fa"){
		url = "validDeleteBoardLike.do";
		heart.classList.remove("fa");
		heart.classList.add("far");
		heart_count.innerHTML = parseInt(heart_count.innerHTML) - 1;
	}
	
	fetch(url, {
		method: "POST",
		headers:{
			"Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8"
		},
		body: "no="+no
	})
}

// 댓글 버튼 클릭 시 
function boardCommentCheck(){
	let loginId = document.getElementById("loginId");
	let board_no = document.getElementById("board_no");
	let comment = document.getElementById("board_info_comment");
	// 로그인 안한 유저는 못함
	if(loginId.value == ""){
		modalCheck("경고", "로그인이 필요합니다",loginModal);
		return false;
	}
	
	console.log(board_no.value);
	console.log(comment.value);
	// 내용이 없는 경우
	if(!comment.value.trim()){
		document.querySelector(".board_info_msg").style.display = "block";
		return false;
	}
	
	location.href = contextPath + "/boardCommentInsert.do?board_no="+board_no.value+"&comment="+comment.value; 

}

let enterPass = true;
// 댓글 입력란에서 엔터 시  
document.getElementById("board_info_comment").addEventListener("keyup", e =>{
	
	if (e.code == "Enter" && enterPass) {
		e.preventDefault(); // 엔터 키로 인한 폼 제출 기본 동작 방지
		enterPass = false;
		boardCommentCheck();
	}else {
		enterPass = true;
		document.querySelector(".board_info_msg").style.display = "none";
	}
		
})


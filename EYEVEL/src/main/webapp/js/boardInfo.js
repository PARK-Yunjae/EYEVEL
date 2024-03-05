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
function boardCommentCheck(form){
	// 로그인 안한 유저는 못함
	if(form.id.value == ""){
		modalCheck("경고", "로그인이 필요합니다",loginModal);
		return false;
	}
	console.log(form.id.value);
	console.log(form.board_info_comment.value);
	// 내용이 없는 경우
	if(form.board_info_comment.value.trim() == ""){
		document.querySelector(".board_info_msg").style.display = "block";
		return false;
	}
	form.submit();
}

// 댓글 입력란에서 엔터 시  
document.getElementById("board_info_comment").addEventListener("keyup", e =>{
	
	if (e.code == "Enter") {
		let form = document.getElementById("board_comment_form");
		boardCommentCheck(form);
	}else {
		document.querySelector(".board_info_msg").style.display = "none";
	}
		
})


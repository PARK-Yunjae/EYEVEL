// 헤더 배경 변경 - 화이트
document.querySelector('header').classList.add('black');
document.querySelector('html').style.background = "none";

let boxClick = true;

let option = document.getElementById("board_info_option");

// 옵션 보이기 & 감추기
option.addEventListener("click", () =>{
	if (boxClick) {
		document.querySelector(".edit_box").classList.add("on");
		boxClick = false;
	} else {
		document.querySelector(".edit_box").classList.remove("on");
		boxClick = true;
	}
})

let likeBtn = document.getElementById("like_btn");

likeBtn.addEventListener("click", e =>{
	
})
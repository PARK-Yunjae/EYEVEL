// 헤더 배경 변경 - 화이트
document.querySelector('header').classList.add('black');
document.querySelector('html').style.background = "none";

let checkClick = true;

// 글쓰기에서 등록 버튼 클릭 시
function boardAddCheck(form) {
	if (!form.title.value.trim()) {
		alert("제목을 입력해주세요");
		form.title.focus();
		return false;
	}
	if (!form.contents.value.trim()) {
		alert("내용을 입력해주세요");
		form.contents.focus();
		return false;
	}
	if (checkClick) {
		form.submit();
		checkClick = false;
	}
}

// 글쓰기에서 qna목록 선택 시 
document.querySelector(".category_select_option").addEventListener("change", () =>{
	let category = document.querySelector(".category_select_option");
	console.log(category.value)
	if(category.value === "qna"){
		document.querySelector(".qna_select").style.display = "flex";
	}else{
		document.querySelector(".qna_select").style.display = "none";
	}
})
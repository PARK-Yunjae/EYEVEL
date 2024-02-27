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

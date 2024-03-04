// 헤더 배경 변경 - 화이트
document.querySelector('header').classList.add('black');
document.querySelector('html').style.background = "none";

let boxClick = false;

function clickBox() {
	if (!boxClick) {
		document.querySelector(".edit_box").classList.remove("on");
		boxClick = true;
	} else {
		document.querySelector(".edit_box").classList.add("on");
		boxClick = false;
	}
}

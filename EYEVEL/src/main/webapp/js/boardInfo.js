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
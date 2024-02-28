let select_image = document.querySelector(".select_image");

// 대륙을 클릭 했을때 다른 이미지 띄워주기
function selectContinent(continent) {
	let removeArea = select_image.classList.item(1);
	select_image.classList.remove(removeArea);
	select_image.classList.add(continent);
	console.log(select_image.classList.item(1));
}

// 클릭 했을때 좌표 확인하는 이벤트
document.querySelector(".select_image").addEventListener("click", e => {
	// ctx
	let contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
	console.log("")
	let continentName = select_image.classList.item(1);
	location.href = contextPath + "/adminAreaAdd.do?x=" + e.offsetX + "&y=" + e.offsetY + "&continentName=" + continentName;
})

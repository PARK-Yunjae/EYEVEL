// 헤더 배경 변경 - 화이트
document.querySelector('header').classList.add('black');
document.querySelector('html').style.background = "none";

// 카테고리 변경
let categoryItems = document.querySelectorAll(".category li");

categoryItems.forEach(e => {
	e.addEventListener("click", () => {
		categoryItems.forEach(f => {
			if (f.classList.item(1) == "on") {
				f.classList.remove("on");
			}
		})
		e.classList.add("on");
	})
})

// 윈도우 로드시 카테고리 값이 있다면
function categoryChange(category) {
	categoryItems.forEach(f => {
		if (f.classList.item(1) == "on") {
			f.classList.remove("on");
		}
	})
	let thisCategory = document.querySelector("." + category);
	thisCategory.classList.add("on");
}

// 검색 시도 - 엔터

document.getElementById("searchText").addEventListener("keyup", (e) => {
	console.log("들어왔니1")
	console.log(e.code);
	if (e.code === 13) {
		console.log("들어왔니2");
		alert("멈춰2");
		boardSearchText();
	}
})

// 검색 시도 - 검색 버튼 클릭시 
function boardSearchText() {
	// ctx
	let contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

	// 카테고리 받아오기
	let categoryItems = document.querySelectorAll(".category li");
	let category;

	categoryItems.forEach(e => {
		if (e.classList.item(1) == "on") {
			category = e.classList.item(0);
		}
	})
	let searchText = document.getElementById("searchText").value.trim();
	console.log(searchText);
	console.log(category);
	alert("멈춰");
	location.href = contextPath + "/boardList.do?searchText=" + searchText + "&category=" + category;
}
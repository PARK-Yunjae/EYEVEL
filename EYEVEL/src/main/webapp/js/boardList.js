// 헤더 배경 변경 - 화이트
document.querySelector('header').classList.add('black');
document.querySelector('html').style.background = "none";

// 카테고리 변경
let categoryItems = document.querySelectorAll(".category li");

categoryItems.forEach(e => {
	e.addEventListener("click", () => {
		// ctx
		let contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

		// 타겟이 아닌건 on을 없앰
		categoryItems.forEach(f => {
			console.log(f.className);
			if (f.classList.item(1) == "on") {
				f.classList.remove("on");
			}
		})
		e.classList.add("on");
		location.href = contextPath + "/boardList.do?searchText=&category=" + e.classList.item(0);
	})
})

// 윈도우 로드시 카테고리 값이 있다면
function categoryChange(category) {
	let categoryItems = document.querySelectorAll(".category li");
	categoryItems.forEach(f => {
		if (f.classList.item(1) == "on") {
			f.classList.remove("on");
		}
	})
	let thisCategory = document.querySelector("." + category);
	console.log("thisCategory")
	thisCategory.classList.add("on");
}

// 검색 시도 - 엔터
document.getElementById("searchText").addEventListener("keypress", (e) => {	
	if (e.code === 'Enter') {
		boardSearchText();
	}
})

// 검색 시도 - 검색 버튼 클릭시 
function boardSearchText() {
	// 카테고리 받아오기
	let categoryItems = document.querySelectorAll(".category li");
	let category;

	categoryItems.forEach(e => {
		if (e.classList.item(1) == "on") {
			category = e.classList.item(0);
		}
	})
	let searchText = document.getElementById("searchText").value.trim();
	// ctx
	let contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

	location.href = contextPath + "/boardList.do?searchText=" + searchText + "&category=" + category;
}

// 글쓰기 버튼 클릭 시 
function boardAddCheck(loginId){	
	// ctx
	let contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
	if(loginId == ''){
		modalCheck("경고", "로그인이 필요합니다",loginModal);
	}else{
		location.href = contextPath +"/boardAdd.do";
	}
}

// 로그인 버튼 클릭 시
function loginModal(){
	console.log("로그인 모달 오픈 시도");
	document.querySelector(".modal_login").classList.add("active");
}

// 로그인 모달에서 닫기 버튼을 클릭 시 
function loginExitBtn(){
	document.querySelector(".modal_login").classList.remove("active");
}

function loginCheck(form){
	let id = form.id.value.trim();
	let pw = form.pw.value.trim();
	fetch("memberLogin.do", {
		method: "POST",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
		},
		body: "id=" + id + "&pw=" + pw
	})
	.then(response => response.text())
	.then(data =>{
		if(data === "아이디값 없음"){
			alert
		}
		if(data === "아이디값 없음"){
			alert
		}
		if(data === "아이디값 없음"){
			alert
		}
	})
}
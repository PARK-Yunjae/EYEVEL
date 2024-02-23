
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
	
}
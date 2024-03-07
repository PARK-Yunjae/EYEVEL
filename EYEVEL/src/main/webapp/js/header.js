window.onload = function() {
	document.querySelector('#load').style.display = 'none';
};

let menuToggle = document.querySelector('.menuToggle');
let gnb = document.querySelector('.gnb');
let menuCheck = true;

menuToggle.addEventListener('click', () => {
	if (menuCheck) {
		menuToggle.classList.add('on');
		gnb.classList.add('on');
		menuCheck = false;
	} else {
		menuToggle.classList.remove('on');
		gnb.classList.remove('on');
		menuCheck = true;
	}
})

let userTheme = localStorage.getItem('theme');
let dark_mode_check = document.querySelector('#dark_mode_check');
// 처음 이용객의 테마를 읽음
document.addEventListener('DOMContentLoaded', () => {
	if (userTheme === 'dark') {
		document.querySelector('html').classList.add('dark_mode');
		dark_mode_check.checked = true;
	} else if (userTheme === 'light') {
		document.querySelector('html').classList.remove('dark_mode');
		dark_mode_check.checked = false;
	}
})

//다크모드 
dark_mode_check.addEventListener('click', () => {
	if (dark_mode_check.checked) {
		document.querySelector('html').classList.add('dark_mode');
		localStorage.setItem("theme", "dark");
	} else {
		document.querySelector('html').classList.remove('dark_mode');
		localStorage.setItem("theme", "light");
	}
})

// 네이버 로그인 테스트
var naver_id_login = new naver_id_login("oGNX9QOxYIFOMWmA4o5u", "http://localhost:8080/EYEVEL/naverLoginCallBack.jsp");
var state = naver_id_login.getUniqState();
naver_id_login.setButton("white", 3, 40);
naver_id_login.setDomain("http://localhost:8080");
naver_id_login.setState(state);
naver_id_login.init_naver_id_login();
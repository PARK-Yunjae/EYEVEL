// 중복 id 체크 용
let idCheckPass = false;

// ctx
let contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
				

// 로그인 버튼 클릭 시 - 혹시 모르니 값 초기화
function loginModal() {
	console.log("로그인 모달 오픈 시도");
	document.getElementById("login_id").value = "";
	document.getElementById("login_pw").value = "";
	document.querySelector(".login_id_msg").style.display = "none";
	document.querySelector(".login_pw_msg").style.display = "none";
	document.querySelector(".modal_login").classList.add("active");
}

// 로그인 모달에서 닫기 버튼을 클릭 시 
function loginExitBtn() {
	document.querySelector(".modal_login").classList.remove("active");
}

// 로그인 id 값 변경시
document.getElementById("login_id").addEventListener("keyup", () => {
	document.querySelector(".login_id_msg").style.display = "none";
})

// 로그인 pw 값 변경시
document.getElementById("login_pw").addEventListener("keyup", () => {
	document.querySelector(".login_pw_msg").style.display = "none";
})

// 로그인 비동기 체크
document.getElementById("loginCheck").addEventListener("click", () => {

	let id = document.getElementById("login_id").value.trim();
	let pw = document.getElementById("login_pw").value.trim();
	// id값이 비어 있다면
	if (id === "") {
		document.querySelector(".login_id_msg").style.display = "block";
		return false;
	}

	// pw값이 비어 있다면
	if (pw === "") {
		document.querySelector(".login_pw_msg").style.display = "block";
		return false;
	}

	fetch("validLoginCheck.do", {
		method: "POST",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
		},
		body: "id=" + id + "&pw=" + pw
	})
		.then(response => response.text())
		.then(data => {
			if (data === "로그인 실패") {
				alert("로그인 실패");
				return false;
			}
			else if (data === "로그인 성공") {
				alert("로그인 성공");
				location.href = contextPath + "/memberLogin.do?id=" + id + "&pw=" + pw;
			}
		})
})

// 회원가입 모달 버튼 활성화 - 그리고 로그인 버튼 숨기기
function joinModal() {	
	document.getElementById("join_name").value = "";
	document.getElementById("join_id").value = "";
	document.getElementById("join_pw").value = "";
	document.getElementById("join_pwCheck").value = "";
	document.getElementById("join_email").value = "";
	document.getElementById("join_terms").checked = false;
	document.querySelector(".join_name_msg").style.display = "none";
	document.querySelector(".join_id_msg").style.display = "none";
	document.querySelector(".join_pw_msg").style.display = "none";
	document.querySelector(".join_pwCheck_msg").style.display = "none";
	document.querySelector(".join_email_msg").style.display = "none";
	document.querySelector(".join_terms_msg").style.display = "none";
	
	document.querySelector(".modal_login").classList.remove("active");
	document.querySelector(".join_modal").classList.add("active");
}

// 회원가입 모달에서 닫기 버튼을 클릭 시 
function joinExitBtn() {
	document.querySelector(".join_modal").classList.remove("active");
}

// 회원가입 버튼 클릭 시
function joinCheck(form){
	console.log("회원가입 체크");
	let name = form.join_name.value.trim();
	let id = form.join_id.value.trim();
	let pw = form.join_pw.value.trim();
	let pwCheck = form.join_pwCheck.value.trim();
	let email = form.join_email.value.trim();
	let terms = form.join_terms.checked;

	if (name === "") {
		document.querySelector(".join_name_msg").style.display = "block";
		return false;
	}
	if (id === "") {
		document.querySelector(".join_id_msg").style.display = "block";
		return false;
	}
	if (pw === "" || pwCheck === "") {
		document.querySelector(".join_pw_msg").style.display = "block";
		return false;
	}
	if (pwCheck === "") {
		document.querySelector(".join_pwCheck_msg").style.display = "block";
		return false;
	}
	if (email === "") {
		document.querySelector(".join_email_msg").innerHTML = "이메일을 입력해주세요";
		document.querySelector(".join_email_msg").style.display = "block";
		return false;
	}
	if(!form.email.value.match(/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/)){
		document.querySelector(".join_email_msg").innerHTML = "이메일 형식이 다릅니다";
		document.querySelector(".join_email_msg").style.display = "block";
		return false;
	}
	if (terms === false) {
		document.querySelector(".join_terms_msg").style.display = "block";
		return false;
	}
	if(!idCheckPass){
		alert("중복 ID 체크 해주세요");
		return false;
	}
	form.submit();
}

// 회원가입 name 값 변경시
document.getElementById("join_name").addEventListener("keyup", () => {
	document.querySelector(".join_name_msg").style.display = "none";
})

// 회원가입 id 값 변경시
document.getElementById("join_id").addEventListener("keyup", () => {
	idCheckPass = false;
	document.getElementById("join_id").style.border = "";
	document.querySelector(".join_id_msg").style.display = "none";
})

// 회원가입 name 값 변경시
document.getElementById("join_pw").addEventListener("keyup", () => {
	document.querySelector(".join_pw_msg").style.display = "none";
})

// 회원가입 name 값 변경시
document.getElementById("join_pwCheck").addEventListener("keyup", () => {
	document.querySelector(".join_pwCheck_msg").style.display = "none";
})

// 회원가입 name 값 변경시
document.getElementById("join_email").addEventListener("keyup", () => {
	document.querySelector(".join_email_msg").style.display = "none";
})

// 중복 id 체크 - 비동기
document.getElementById("join_idCheck").addEventListener("click", () =>{
	let id = document.getElementById("join_id").value.trim();
	// id값이 비어 있다면
	if (id === "") {
		document.querySelector(".join_id_msg").innerHTML= "아이디를 입력해주세요";
		document.querySelector(".join_id_msg").style.display = "block";
		return false;
	}

	fetch("validIdCheck.do", {
		method: "POST",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
		},
		body: "id=" + id
	})
		.then(response => response.text())
		.then(data => {
			if (data == '0') {
				idCheckPass = true;
				document.querySelector(".join_id_msg").innerHTML = "ID 사용 가능합니다";
				document.getElementById("join_id").style.border = "1px solid blue";
				document.querySelector(".join_id_msg").style.display = "block";
				return false;
			}
			else{
				document.querySelector(".join_id_msg").innerHTML = "중복 ID가 존재합니다";
				document.querySelector(".join_id_msg").style.display = "block";
				document.getElementById("join_id").style.border = "1px solid red";
				return false;
			}
		})
})

// 로그 아웃시 alert 창 띄워주기 위해 넘어옴
function logoutCheck(name){
	alert(name+"님 로그아웃 되었습니다.");
	location.href = contextPath + "/memberLogout.do";
}
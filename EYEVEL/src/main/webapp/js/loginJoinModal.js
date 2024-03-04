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

	// 검은배경
	overlay = document.createElement('div');
	overlay.setAttribute('class', 'overlay');
	document.body.appendChild(overlay);
}

// 로그인 모달에서 닫기 버튼을 클릭 시 
function loginExitBtn() {
	document.querySelector(".modal_login").classList.remove("active");
	document.body.removeChild(overlay);
}

// 로그인 id 값 변경시 - 거기에 엔터일땐 넘어가게
document.getElementById("login_id").addEventListener("keyup", (e) => {
	loginPass = true;
	document.querySelector(".login_id_msg").style.display = "none";
	if (e.code === 'Enter') {
		loginCheck();
		loginPass = false;
	}
})

// 로그인 pw 값 변경시
document.getElementById("login_pw").addEventListener("keyup", (e) => {
	if (e.code === 'Enter' && loginPass) {
		loginCheck();
		loginPass = false;
	}
	loginPass = true;
	document.querySelector(".login_pw_msg").style.display = "none";
})

let loginPass = true;
// 로그인 비동기 체크 - 클릭
document.getElementById("loginCheck").addEventListener("click", () => {
	if (loginPass) {
		loginCheck();
		loginPass = false;
	}
})

// 로그인 비동기 체크 함수
function loginCheck() {
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
				modalMsgWarning("로그인 실패", "로그인에 실패하였습니다.<br>다시 한 번 시도해주세요.");
				loginPass = true;
				return false;
			}
			else if (data === "로그인 성공") {
				alert('로그인 성공');
				document.body.removeChild(overlay);
				location.href = contextPath + "/memberLogin.do?id=" + id + "&pw=" + pw;
			}
		})
}

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
	document.body.removeChild(overlay);
}

let joinPass = true;
// 회원가입 버튼 클릭 시
function joinCheck(form) {
	if (!joinPass) {
		return false;
	}
	joinPass = false;

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
	if (pw === "") {
		document.querySelector(".join_pw_msg").innerHTML = "비밀번호를 입력해 주세요";
		document.querySelector(".join_pw_msg").style.color = "#ff6969";
		document.querySelector(".join_pw_msg").style.display = "block";
		return false;
	}
	if (pwCheck === "") {
		document.querySelector(".join_pwCheck_msg").innerHTML = "비밀번호를 입력해 주세요";
		document.querySelector(".join_pwCheck_msg").style.color = "#ff6969";
		document.querySelector(".join_pwCheck_msg").style.display = "block";
		return false;
	}
	if (pwCheck !== pw) {
		document.querySelector(".join_pwCheck_msg").innerHTML = "비밀번호가 일치해야 합니다";
		document.querySelector(".join_pwCheck_msg").style.color = "#ff6969";
		document.querySelector(".join_pw_msg").style.display = "none";
		document.querySelector(".join_pwCheck_msg").style.display = "block";
		return false;
	}
	if (pwCheck === pw) {
		console.log(pwCheck);
		if (!form.pw.value.match(/^(?=.*[a-zA-Z])(?=.*[0-9]).{4,25}$/)) {
			document.querySelector(".join_pwCheck_msg").innerHTML = "비밀번호에 영어,숫자가 포함되어야 합니다.";
			document.querySelector(".join_pwCheck_msg").style.color = "#ff6969";
			document.querySelector(".join_pw_msg").style.display = "none";
			document.querySelector(".join_pwCheck_msg").style.display = "block";
			return false;
		} else {
			document.querySelector(".join_pwCheck_msg").innerHTML = "사용 가능한 비밀번호 입니다.";
			document.querySelector(".join_pwCheck_msg").style.color = "skyblue";
			document.querySelector(".join_pw_msg").style.display = "none";
			document.querySelector(".join_pwCheck_msg").style.display = "block";
		}
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
	if (!form.email.value.match(/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/)) {
		document.querySelector(".join_email_msg").innerHTML = "이메일 형식이 다릅니다";
		document.querySelector(".join_email_msg").style.display = "block";
		return false;
	}
	if (terms === false) {
		document.querySelector(".join_terms_msg").style.display = "block";
		return false;
	}
	if (!idCheckPass) {
		console.log("들어옵니까");
		alert("중복 ID 체크 해주세요");
		return false;
	}
	alert("회원가입 완료");
	document.body.removeChild(overlay);
	form.submit();
}

// 회원가입 name 값 변경시
document.getElementById("join_name").addEventListener("keyup", () => {
	joinPass = true;
	document.querySelector(".join_name_msg").style.display = "none";
})

// 회원가입 id 값 변경시
document.getElementById("join_id").addEventListener("keyup", () => {
	joinPass = true;
	idCheckPass = false;
	document.getElementById("join_id").style.border = "";
	document.querySelector("#join_idCheck").classList.remove("on");
	document.querySelector(".join_id_msg").style.display = "none";
})

// 회원가입 pw 값 변경시
document.getElementById("join_pw").addEventListener("keyup", () => {
	joinPass = true;
	document.querySelector(".join_pw_msg").style.display = "none";
})

// 회원가입 pwCheck 값 변경시
document.getElementById("join_pwCheck").addEventListener("keyup", () => {
	joinPass = true;
	document.querySelector(".join_pwCheck_msg").style.display = "none";
})

// 회원가입 email 값 변경시
document.getElementById("join_email").addEventListener("keyup", () => {
	joinPass = true;
	document.querySelector(".join_email_msg").style.display = "none";
})

// 중복 id 체크 - 비동기
document.getElementById("join_idCheck").addEventListener("click", () => {
	let id = document.getElementById("join_id").value.trim();
	// id값이 비어 있다면
	if (id === "") {
		document.querySelector(".join_id_msg").innerHTML = "아이디를 입력해주세요";
		document.querySelector(".join_id_msg").style.color = "#ff6969";
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
				document.querySelector(".join_id_msg").style.color = "skyblue";
				document.querySelector("#join_idCheck").classList.add("on");
				document.getElementById("join_id").style.border = "1px solid blue";
				document.querySelector(".join_id_msg").style.display = "block";
				return false;
			}
			else {
				document.querySelector(".join_id_msg").innerHTML = "중복 ID가 존재합니다";
				document.querySelector(".join_id_msg").style.color = "#ff6969";
				document.querySelector(".join_id_msg").style.display = "block";
				document.querySelector("#join_idCheck").classList.remove("on");
				document.getElementById("join_id").style.border = "1px solid red";
				return false;
			}
		})
})

// 로그 아웃시 alert 창 띄워주기 위해 넘어옴
function logoutCheck(name) {
	alert(name + "님 로그아웃 되었습니다.");
	location.href = contextPath + "/memberLogout.do";
}
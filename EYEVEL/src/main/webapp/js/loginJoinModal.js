// 중복 id 체크 용
let idCheckPass = false;
// ctx
let contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

// 로그인 버튼 클릭 시 - 혹시 모르니 값 초기화
function loginModal() {
	document.getElementById("login_id").value = "";
	document.getElementById("login_pw").value = "";
	document.querySelector(".login_id_msg").style.display = "none";
	document.querySelector(".login_pw_msg").style.display = "none";
	document.querySelector(".modal_login").classList.add("active");

	if(overlay==null) createOverlay();
}

// 로그인 모달에서 닫기 버튼을 클릭 시 
function loginExitBtn() {
	document.querySelector(".modal_login").classList.remove("active");
	if(overlayCheck) {
		document.body.removeChild(overlay);
		overlay=null;
	}
	overlayCheck = false;
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
				modalMsgWarning("로그인 실패", "로그인에 실패하였습니다.<br>다시 한 번 시도해주세요.",true);
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
	document.getElementById("join_email_verification").value = "";
	document.getElementById("join_terms").checked = false;
	document.querySelector(".join_name_msg").style.display = "none";
	document.querySelector(".join_id_msg").style.display = "none";
	document.querySelector(".join_pw_msg").style.display = "none";
	document.querySelector(".join_pwCheck_msg").style.display = "none";
	document.querySelector(".join_email_msg").style.display = "none";
	document.querySelector(".input_email_verification").style.display = "none";
	document.querySelector(".join_terms_msg").style.display = "none";
	document.getElementById("join_id").style.border = "1px solid #a8a8a8";
	
	document.querySelector("#join_idCheck").classList.remove("on");
	document.querySelector("#join_idCheck").value="중복확인";
	document.querySelector(".modal_login").classList.remove("active");
	document.querySelector(".join_modal").classList.add("active");
}

// 회원가입 모달에서 닫기 버튼을 클릭 시 
function joinExitBtn() {
	document.querySelector(".join_modal").classList.remove("active");
	if(overlayCheck) {
		document.body.removeChild(overlay);
		overlay=null;
	}
	overlayCheck = false;
}

let joinPass = true;
let emailPass = true;
// 회원가입 버튼 클릭 시
function joinCheck(form) {
	if (!joinPass) {
		return false;
	}
	joinPass = false;

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
		if (!form.pw.value.match(/^(?=.*[a-zA-Z])(?=.*[0-9]).{4,25}$/)) {
			document.querySelector(".join_pwCheck_msg").innerHTML = "비밀번호에 영어,숫자가 포함되어야 합니다.";
			document.querySelector(".join_pwCheck_msg").style.color = "#ff6969";
			document.querySelector(".join_pw_msg").style.display = "none";
			document.querySelector(".join_pwCheck_msg").style.display = "block";
			return false;
		} else {
			document.querySelector(".join_pwCheck_msg").innerHTML = "사용 가능한 비밀번호 입니다.";
			document.querySelector(".join_pwCheck_msg").style.color = "#41CE82";
			document.querySelector(".join_pw_msg").style.display = "none";
			document.querySelector(".join_pwCheck_msg").style.display = "block";
		}
	}
	if (pwCheck === "") {
		document.querySelector(".join_pwCheck_msg").style.display = "block";
		return false;
	}
	if (email.value == "") {
		document.querySelector(".join_email_msg").innerHTML = "이메일을 입력해주세요";
		document.querySelector(".join_email_msg").style.display = "block";
		return false;
	}
	if (!form.email.value.match(/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/)) {
		document.querySelector(".join_email_msg").innerHTML = "이메일 형식이 다릅니다";
		document.querySelector(".join_email_msg").style.display = "block";
		return false;
	}
	if(emailPass){
		document.querySelector(".join_email_msg").innerHTML = "이메일 인증을 하셔야 합니다";
		document.querySelector(".join_email_msg").style.display = "block";
		return false;
	}
	if (terms === false) {
		document.querySelector(".join_terms_msg").style.display = "block";
		return false;
	}
	if (!idCheckPass) {
		document.querySelector(".join_id_msg").innerHTML = "중복 ID 체크 해주세요";
		document.querySelector(".join_id_msg").style.color = "#ff6969";
		document.querySelector(".join_id_msg").style.display = "block";
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
	document.querySelector("#join_idCheck").value="중복확인";
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

// 동의 버튼 체크 확인
document.getElementById("join_terms").addEventListener('change', e => {
	let terms = document.getElementById("join_terms");
    console.log(terms.checked);
    if (terms.checked == true) {
		joinPass = true;
        document.querySelector(".join_terms_msg").style.display = "block";
        document.querySelector(".join_terms_msg").innerHTML="동의 확인 되었습니다";
   		document.querySelector(".join_terms_msg").style.color = "#41CE82";
    } else {
		joinPass = true;
        document.querySelector(".join_terms_msg").style.display = "block";
        document.querySelector(".join_terms_msg").innerHTML="약관에 동의해주세요";
		document.querySelector(".join_terms_msg").style.color = "#ff6969";
		
    }
});
// 중복 id 체크 - 비동기
document.getElementById("join_idCheck").addEventListener("click", () => {
	joinPass = true;
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
				document.querySelector(".join_id_msg").style.color = "#41CE82";
				document.querySelector("#join_idCheck").classList.add("on");
				document.querySelector("#join_idCheck").value="확인완료";
				document.getElementById("join_id").style.border = "1px solid #2caf69";
				document.querySelector(".join_id_msg").style.display = "block";
				return false;
			}
			else {
				document.querySelector(".join_id_msg").innerHTML = "중복 ID가 존재합니다";
				document.querySelector(".join_id_msg").style.color = "#ff6969";
				document.querySelector(".join_id_msg").style.display = "block";
				document.querySelector("#join_idCheck").value="중복확인";
				document.querySelector("#join_idCheck").classList.remove("on");
				document.getElementById("join_id").style.border = "1px solid #ff6969";
				return false;
			}
		})
})

// 로그 아웃시 alert 창 띄워주기 위해 넘어옴
function logoutCheck(name) {
	alert(name + "님 로그아웃 되었습니다.");
	location.href = contextPath + "/memberLogout.do";
}
let emailCode;
let emailInteval;
let count = 180;
let countPass = true;
// 이메일 인증 테스트
function emailVerification(){
	let email = document.getElementById("join_email");
	
	if (!email.value.match(/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/)) {
		document.querySelector(".join_email_msg").innerHTML = "이메일 형식이 다릅니다";
		document.querySelector(".join_email_msg").style.display = "block";
		return false;
	}
	
	fetch("vaildEmailVerification.do", {
        method: 'POST',
        headers: {
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: "email=" + email.value
    })
    .then(response => response.text())
    .then(data => {
		emailCode = data;
        if(data) {
			countPass = true;
			document.querySelector(".input_email_verification").style.display = "block"
            document.querySelector(".email_msg_verification").innerHTML = "인증 메일이 발송되었습니다.";
			document.querySelector(".email_msg_verification").style.display = "block";  
        	// 이때 인터벌
        	let email_time = document.querySelector(".email_time");
        	emailInteval = setInterval( () =>{
				let minutes = parseInt(count / 60, 10);
                let seconds = parseInt(count % 60, 10);
        
                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;
				
				email_time.innerHTML = minutes + " : " + seconds;
				count -= 1;
				if(count <= 0){
					clearInterval(emailInteval);
            		document.querySelector(".email_msg_verification").innerHTML = "시간초과 되었습니다";
					document.querySelector(".email_msg_verification").style.display = "block";  
					countPass = false;
				}
			}, 1000);
        } else {
			document.querySelector(".join_email_msg").innerHTML = "이메일 발송에 실패했습니다.";
			document.querySelector(".join_email_msg").style.display = "block";
        }
    }).catch(error => console.error('Error:', error));
}

// 이메일 인증번호에 키 입력값이 있으면
document.getElementById("join_email_verification").addEventListener("keyup", () =>{
	let myEmailCode = document.getElementById("join_email_verification");
	if( myEmailCode.value == emailCode && countPass){
		emailPass = false;
		joinPass = true;
		clearInterval(emailInteval);
		document.querySelector(".email_time").innerHTML = "";
		document.querySelector(".email_msg_verification").innerHTML = "인증 되었습니다.";
		document.querySelector(".email_msg_verification").style.display = "block";
		document.querySelector(".email_msg_verification").style.color = "#41CE82";
	}else{
		emailPass = true;
		document.querySelector(".email_msg_verification").innerHTML = "인증번호가 맞지 않습니다";
		document.querySelector(".email_msg_verification").style.display = "block";
		document.querySelector(".email_msg_verification").style.color = "#ff6969";
	}
})
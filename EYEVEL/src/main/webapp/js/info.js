document.querySelector('header').classList.add('black');
document.querySelector('html').style.background = "none";

let nameClick = false;

// 수정하기 버튼 중복 방지?
let updatePass = true;

// 탈퇴하기 버튼 중복 방지
let deletePass = true;

// 테스트 용
window.onload = function() {
	let img = document.querySelector("#profileImg");
	console.log(img);
}

// 이름 변경 활성화 비활성화 함수
function nameOnOff() {
	updatePass = true;

	let input = document.getElementById("name_input");
	let p = document.getElementById("name_p");
	let i = document.getElementById("input_name_i");

	if (!nameClick) {
		i.classList.remove("fa-pen");
		i.classList.add("fa-check");
		input.style.display = "block";
		p.style.display = "none";
		nameClick = true;
	}
	else {
		i.classList.remove("fa-check");
		i.classList.add("fa-pen");
		input.style.display = "none";
		p.innerHTML = input.value;
		p.style.display = "block";
		nameClick = false;
	}
}

// 연필버튼 클릭시 마다 input -> p -> input 변경
function nameUpdate() {
	nameOnOff();
}

// 이름 변경시에 엔터를 누르면
document.getElementById("name_input").addEventListener("keyup", e => {
	if (e.code == "Enter") {
		nameOnOff();
	}
})

// 프로필 이미지 수정 시 미리보기
function readURL(input) {
	updatePass = true;
	if (input.files && input.files[0]) {
		let reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("profileImg").src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('profileImg').src = "";
	}
}

// 업데이트 전 체크
function memberUpdateCheck(form, pw) {
	if (!updatePass) {
		return false;
	}
	updatePass = false;

	if (form.pw.value.trim() == "") {
		console.log("비번입력 안함");
		document.querySelector(".info_pw_msg").innerHTML = "비밀번호를 입력해주세요";
		document.querySelector(".info_pw_msg").style.display = "block";
		updatePass = true;
		return false;
	}
	else if (form.pw.value != pw) {
		console.log("비번틀림");
		document.querySelector(".info_pw_msg").innerHTML = "비밀번호가 틀렸습니다";
		document.querySelector(".info_pw_msg").style.display = "block";
		updatePass = true;
		return false;
	}
	let sendForm = function() { form.submit() };
	modalCheck("잠깐", "정말 수정하시겠습니까?<br>수정 전 정보는 사라지게 됩니다.", sendForm);
	updatePass = true;
}

// pw 값 변경시
document.querySelector(".info_pw_msg").addEventListener("keyup", () => {
	updatePass = true;
	document.querySelector(".info_pw_msg").style.display = "none";
})

//회원 탈퇴 전 체크
function memberDeleteCheck(form, pw, id) {
	if (!deletePass) {
		return false;
	}
	deletePass = false;

	if (form.pw.value.trim() == "") {
		console.log("비번입력 안함");
		document.querySelector(".info_pw_msg").innerHTML = "비밀번호를 입력해주세요";
		document.querySelector(".info_pw_msg").style.display = "block";
		deletePass = true;
		return false;
	}
	else if (form.pw.value != pw) {
		console.log("비번틀림");
		document.querySelector(".info_pw_msg").innerHTML = "비밀번호가 틀렸습니다";
		document.querySelector(".info_pw_msg").style.display = "block";
		deletePass = true;
		return false;
	}
	let deleteFun = function() { location.href = contextPath + '/memberDelete.do?id=' + id; }
	modalCheck("잠깐", "정말 탈퇴하시겠습니까?<br>탈퇴 후 정보는 모두 사라지게 됩니다.", deleteFun);
	deletePass = true;
}

// 좋아요 버튼 눌렀을 시
function zzimBtnCheck(no) {
	let heart = document.querySelector("#heart");
	let url;
	if (heart.classList.item(2) == "fa") {
		url = "zzimDelete.do";
		heart.classList.remove("fa");
		heart.classList.add("far");
	}
	fetch(url, {
		method: "POST",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
		},
		body: "no=" + no
	})
		.then(response => response.text())
}
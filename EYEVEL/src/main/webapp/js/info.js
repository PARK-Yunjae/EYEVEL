let nameClick = false;

// 연필버튼 클릭시 마다 input -> p -> input 변경
function nameUpdate() {
	let input = document.getElementById("name_input");
	let p = document.getElementById("name_p");

	if (!nameClick) {
		input.style.display = "block";
		p.style.display = "none";
		nameClick = true;
	}
	else {
		input.style.display = "none";
		p.innerHTML = input.value;
		p.style.display = "block";
		nameClick = false;
	}
}

// 프로필 이미지 수정 시 미리보기

function readURL(input) {
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
function memberUpdateCheck(form,pw){
	if(form.pw.value.trim() == ""){
		console.log("비번입력 안함");
		document.querySelector(".info_pw_msg").innerHTML = "비밀번호를 입력해주세요";
		document.querySelector(".info_pw_msg").style.display = "block";
		return false;
	}
	else if(form.pw.value != pw){
		console.log("비번틀림");
		document.querySelector(".info_pw_msg").innerHTML = "비밀번호가 틀렸습니다";
		document.querySelector(".info_pw_msg").style.display = "block";
		return false;
	}
	form.submit();
}

// pw 값 변경시
document.querySelector(".info_pw_msg").addEventListener("keyup", () =>{
	document.querySelector(".info_pw_msg").style.display = "none";
})
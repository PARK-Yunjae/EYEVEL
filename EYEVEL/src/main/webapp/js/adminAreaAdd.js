// 관광지 이미지 수정 시 미리보기
let images = document.querySelectorAll('.weather_img');

function readURL(input) {
	updatePass = true;
	if (input.files && input.files[0]) {
		let reader = new FileReader();
		reader.onload = function(e) {
			document.querySelector("profileImg").src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		document.querySelector('profileImg').src = "";
	}
}
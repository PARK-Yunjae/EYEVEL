// 버튼 중복 방지?
let addPass = true;

// 관광지 이미지 수정 시 미리보기
let images = document.querySelectorAll('.weather_img');

// 이미지 미리보기
function readURL(input, idx) {
	let weather_img = document.querySelectorAll(".weather_img");
	if (input.files && input.files[0]) {
		let reader = new FileReader();
		reader.onload = function(e) {
			weather_img[idx].src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		weather_img[idx].src = "";
	}
}

// 관리자 관광지 등록 체크
function adminAreaAddCheck(form){
	if(!form.area_name.value.trim()){
		document.querySelector(".area_name_msg").style.display = "block";
		return false;
	}
	
	if(!form.area_id.value.trim()){
		document.querySelector(".area_id_msg").style.display = "block";
		return false;
	}
	
	if(!form.area_url.value.trim()){
		document.querySelector(".area_url_msg").style.display = "block";
		return false;
	}
	
	let am_weather = document.querySelectorAll(".am_weather");
	let amCheck = false;
	
	am_weather.forEach(e =>{
		console.log(e.value);
		if(!e.value.trim()){
			amCheck = true;
		}
	})
	
	if(amCheck){
		document.querySelector(".area_img_msg").style.display = "block";
		return false;
	}
	
	if(!form.area_contents.value.trim()){
		document.querySelector(".area_contents_msg").style.display = "block";
		return false;
	}
	
	if(addPass){
		console.log("여기 들어왔니");
		console.log(form.area_name.value);
		form.submit();
		addPass = false;
	}
}

// 관광지 이름 값 변경될 때
document.getElementById("area_name").addEventListener("keyup", () =>{
	document.querySelector(".area_name_msg").style.display = "none";	
})

// 관광지 아이디 값 변경될 때
document.getElementById("area_id").addEventListener("keyup", () =>{
	document.querySelector(".area_id_msg").style.display = "none";	
})

// 관광지 동영상 URL 값 변경될 때
document.getElementById("area_url").addEventListener("keyup", () =>{
	document.querySelector(".area_url_msg").style.display = "none";	
})

// 관광지 배경 이미지 값 변경될 때
let am_weather = document.querySelectorAll(".am_weather");
let amCheck = false;
	
am_weather.forEach(e =>{
	// 관광지 배경 이미지 값 변경될 때
	e.addEventListener("change", () =>{
		document.querySelector(".area_img_msg").style.display = "none";	
	})
})



// 관광지 설명 값 변경될 때
document.getElementById("area_contents").addEventListener("keyup", () =>{
	document.querySelector(".area_contents_msg").style.display = "none";	
})

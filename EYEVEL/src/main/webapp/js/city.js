
const API_KEY = 'ed670c939f8e6b9849a9eb86bf91bf21';

let lat = document.querySelector(".location").dataset.lat;
let lon = document.querySelector(".location").dataset.lon;
let name = document.querySelector(".location").dataset.name;
const desc = document.querySelector(".description");
let isDaytime; // 전역 변수로 선언


let getdesc = "";
// 날씨정보를 웹이서 받아옴 
const getWeather = (lat, lon) => {
	fetch(
		`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric&lang=en`
	).then((response) => {
		return response.json();
	}).then((json) => {
		getdesc = json.weather[0].main;
		desc.innerText = getdesc;
		let areaimgs = document.querySelectorAll('.areaimg');
		let selectedimg = '';
		let index = 0;
		var htmlTag = document.documentElement;
		areaimgs.forEach((img, i) => {
			if (index == 0) {
				selectedimg = img.dataset.img;
			}
			index++;
			/*			console.log(img.dataset.weather)*/
			if (getdesc == img.dataset.weather) {
				selectedimg = img.dataset.img;
				index = 0;
				console.log(selectedimg);
				// 배경 이미지 스타일 변경
				console.log(isDaytime ? '낮입니다' : ' 밤입니다');
				if (isDaytime) {
					htmlTag.style.backgroundImage = "linear-gradient(#00000033, #00000033), url('/EYEVEL/img/weather/" + name + "/" + selectedimg + ".jpg')";
				} else {
					htmlTag.style.backgroundImage = "linear-gradient(#00000033, #00000033), url('/EYEVEL/img/weather/" + name + "/" + selectedimg + "_night.jpg')";
				}
				return;
			}
			// 어떤 날씨도 해당하지 않을경우 배경이미지를 Clear일때로
			if (index == 4) {
				htmlTag.style.backgroundImage = "linear-gradient(#00000033, #00000033), url('/EYEVEL/img/weather/" + name + "/" + selectedimg + ".jpg')";
			}


		}
		)
	})
}

// 도시별 시간표시 기능
function fetchTimeZone(latitude, longitude) {
	// 구글에서 JSON 파일로 데이터를 받아와서 시간포맷으로 변경
	const timestamp = Math.floor(Date.now() / 1000); // Current timestamp in seconds
	const apiKey = 'AIzaSyCfsi8KnJIWbseOCy2kEuaFLeG7pNpr36Y'; //구글 API KEY
	const url = `https://maps.googleapis.com/maps/api/timezone/json?location=${latitude},${longitude}&timestamp=${timestamp}&key=${apiKey}`;
	fetch(url)
		.then(response => response.json())
		.then(data => {
			const localTimeOffset = data.dstOffset + data.rawOffset;
			const localTime = new Date((timestamp + localTimeOffset) * 1000);
			/*		            let suntimes = SunCalc.getTimes(localTime, latitude, longitude);
									isDaytime = Date.now() >= suntimes.sunrise && Date.now() <= suntimes.sunset;
									*/
			const hour = localTime.getUTCHours(); // UTC 시간을 기준으로 시간을 가져옵니다.
			// 오전 6시 이후 및 오후 6시 이후를 기준으로 낮/밤 결정
			isDaytime = hour >= 6 && hour < 18;
			console.log(isDaytime ? '낮입니다' : ' 밤입니다');
			document.getElementById("localTime").innerText = localTime.toISOString().substring(11, 16); // Display HH:MM:SS
		})
		.catch(error => console.error('Error fetching time zone information:', error));

	getWeather(lat, lon);
}


fetchTimeZone(lat, lon);


// 좋아요 버튼 클릭이벤트

let modal_panorama = document.querySelector('.modal_panorama');
let panorama_btn = document.querySelectorAll('.panorama_btn');

// 파노라마 모달창 띄우기
function openPanorama(){modal_panorama.classList.add('active');}

// 파노라마 모달창 닫기
function closePanorama(){modal_panorama.classList.remove('active');}

// 모달 창 밖을 눌렀을 때 꺼짐
document.querySelector("body").addEventListener("click", e=> {
	panorama_btn.forEach(en=>{
	    if (!modal_panorama.contains(e.target) && !en.contains(e.target)) {
	       modal_panorama.classList.remove('active');
	    }
	})
})


// 좋아요 버튼 눌렀을 시 
function likeBtnCheck(no) {
	let heart = document.querySelector("#Zzim");
	let url;
	console.log(heart.classList);
	if (heart.classList.item(1) == "far") {
		url = "zzimAdd.do";
		heart.classList.remove("far");
		heart.classList.add("fa");
	}
	else if (heart.classList.item(1) == "fa") {
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





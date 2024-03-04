/**
 * 
 */
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
		areaimgs.forEach((img, i) => {
			console.log(img.dataset.weather)
			if (getdesc == img.dataset.weather) {
				selectedimg = img.dataset.img;
				console.log(selectedimg);
				var htmlTag = document.documentElement;
				// 배경 이미지 스타일 변경
			console.log(isDaytime ? '낮입니다' : ' 밤입니다');
				if (isDaytime) {
					htmlTag.style.backgroundImage = "linear-gradient(#00000033, #00000033), url('/EYEVEL/img/weather/" + name + "/" + selectedimg + ".jpg')";
				} else {
					htmlTag.style.backgroundImage = "linear-gradient(#00000033, #00000033), url('/EYEVEL/img/weather/" + name + "/" + selectedimg + "_night.jpg')";
				}
				return;
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
			console.log(hour);
			// 오전 6시 이후 및 오후 6시 이후를 기준으로 낮/밤 결정
			isDaytime = hour >= 6 && hour < 18;
			console.log(isDaytime ? '낮입니다' : ' 밤입니다');
			document.getElementById("localTime").innerText = localTime.toISOString().substring(11, 16); // Display HH:MM:SS
		})
		.catch(error => console.error('Error fetching time zone information:', error));
		
		getWeather(lat, lon);
}

//0.5초마다 반복해서 시간표시기능 실행

	fetchTimeZone(lat, lon);








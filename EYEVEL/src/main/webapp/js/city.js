/**
 * 
 */
const API_KEY = 'ed670c939f8e6b9849a9eb86bf91bf21';

let lat = document.querySelector(".location").dataset.lat;
let lon = document.querySelector(".location").dataset.lon;
let name = document.querySelector(".location").dataset.name;
const desc = document.querySelector(".description");
let isDaytime; // 전역 변수로 선언

// 도시별 시간표시 기능
function fetchTimeZone(latitude, longitude) {
	const timestamp = Math.floor(Date.now() / 1000); // Current timestamp in seconds
    const apiKey = 'AIzaSyCfsi8KnJIWbseOCy2kEuaFLeG7pNpr36Y'; //구글 API KEY
    const url = `https://maps.googleapis.com/maps/api/timezone/json?location=${latitude},${longitude}&timestamp=${timestamp}&key=${apiKey}`;
	// 구글에서 JSON 파일로 데이터를 받아와서 시간포맷으로 변경
    fetch(url)
        .then(response => response.json())
        .then(data => {
            const localTimeOffset = data.dstOffset + data.rawOffset;
            const localTime = new Date((timestamp + localTimeOffset) * 1000);
            //console.log(localTime.toISOString().substring(11, 19)); // Converts to 24-hour format and prints HH:MM:SS
        	const sunTimes = SunCalc.getTimes(localTime, latitude, longitude);
            isDaytime = localTime >= sunTimes.sunrise && localTime <= sunTimes.sunset;

            console.log(isDaytime ? 'It is currently daytime' : 'It is currently nighttime');
        document.getElementById("localTime").innerText = localTime.toISOString().substring(11, 19); // Display HH:MM:SS
        })
        .catch(error => console.error('Error fetching time zone information:', error));
}

//0.5초마다 반복해서 시간표시기능 실행

setInterval(() => {
    fetchTimeZone(lat, lon);
}, 500); // 1000 milliseconds = 1 second



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
				if(isDaytime){
				htmlTag.style.backgroundImage = "linear-gradient(#00000033, #00000033), url('/EYEVEL/img/weather/"+name+"/"+selectedimg+".jpg')";					
				}else{
				htmlTag.style.backgroundImage = "linear-gradient(#00000033, #00000033), url('/EYEVEL/img/weather/"+name+"/"+selectedimg+"_nigth.jpg')";					
				}
				return;
			}
			
		}
		)
	})
}
getWeather(lat, lon);




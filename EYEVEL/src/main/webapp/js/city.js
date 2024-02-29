/**
 * 
 */
const API_KEY = 'ed670c939f8e6b9849a9eb86bf91bf21';

let lat = document.querySelector(".location").dataset.lat;
let lon = document.querySelector(".location").dataset.lon;
let name = document.querySelector(".location").dataset.name;
const desc = document.querySelector(".description");
console.log("날씨정보 불러오는중")


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
				htmlTag.style.backgroundImage = "linear-gradient(#00000033, #00000033), url('/EYEVEL/img/weather/"+name+"/"+selectedimg+".jpg')";
			}
		}
		)
	})
}
getWeather(lat, lon);


 


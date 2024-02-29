/**
 * 
 */
const API_KEY = 'ed670c939f8e6b9849a9eb86bf91bf21';

let lat = document.querySelector(".location").dataset.lat;
let lon = document.querySelector(".location").dataset.lon;
const desc = document.querySelector(".description");
console.log("날씨정보 불러오는중")


const getWeather = (lat, lon) => {
	fetch(
		`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric&lang=en`
	).then((response) => {
		return response.json();
	})
		.then((json) => {
			const getdesc = json.weather[0].main;
			desc.innerText = getdesc;
		})
}
getWeather(lat, lon);


let lat = 0;
let lon = 0;

let city = "";
let temp = 0;
let desc = "";
let imgUrl = ""



// navigator.geolocation
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        document.body.innerHTML = "이 브라우저에서는 위치 경로 지원 안함/ 위치 정보 공유 취소 ";
    }
    console.log("Test");
}

function showPosition(position) {
    console.log("Latitude(위도): " + position.coords.latitude);
    console.log("Longitude(경도): " + position.coords.longitude);
    
    lat = position.coords.latitude;  
    lon = position.coords.longitude;  
 
    // get api  
    let appkey="c5d4f8696c962a1755b95fa347e08496";
    
   let url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${appkey}`;
   console.log("url" + url)
    // 발급 : https://openweathermap.org 여기서 발급 받음 
   // fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=인증발급키`)
     fetch(url)
        .then(response => response.json())
        .then(data => {
            console.log(data);

            const city = data.name;
            const temp = Math.round((data.main.temp - 273.15) * 100) / 100; // K to C
            const desc = data.weather[0].description;
             imgUrl = `./img/SKY${(data.weather[0].icon).split('d')[0]}.png`;

            console.log(`${city} : ${temp}'C (${desc})`);
            console.log('imgUrl:', imgUrl);

            const result = `<div><img src=${imgUrl}><br><p>${city}<br>${temp}'C</p>${desc}<p></p></div>`;
            document.body.insertAdjacentHTML('beforeend', result);
        })
        .catch(error => console.error('Error:', error));

}

window.onload = function() {
    getLocation();
}
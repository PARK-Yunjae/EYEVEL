//api-key 
const apiKey = "ed670c939f8e6b9849a9eb86bf91bf21";
// city
let city = "Seoul";
let cityname = "서울";
//날씨 api - fontawesome 아이콘
var weatherIcon = {
    '01' : 'fas fa-sun',
    '02' : 'fas fa-cloud-sun',
    '03' : 'fas fa-cloud',
    '04' : 'fas fa-cloud-meatball',
    '09' : 'fas fa-cloud-sun-rain',
    '10' : 'fas fa-cloud-showers-heavy',
    '11' : 'fas fa-poo-storm',
    '13' : 'far fa-snowflake',
    '50' : 'fas fa-smog'
};
  
// 날씨 api
 var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+apiKey;
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {

        var $Icon = (resp.weather[0].icon).substr(0,2);
        var $weather_description = resp.weather[0].main;
        var $Temp = Math.floor(resp.main.temp- 273.15) + 'º';
        var $humidity = '습도&nbsp;&nbsp;&nbsp;&nbsp;' + resp.main.humidity+ ' %';
        var $wind = '바람&nbsp;&nbsp;&nbsp;&nbsp;' +resp.wind.speed + ' m/s';
        var $city = cityname;
        var $cloud = '구름&nbsp;&nbsp;&nbsp;&nbsp;' + resp.clouds.all +"%";
        var $temp_min = '최저 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_min- 273.15) + 'º';
        var $temp_max = '최고 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_max- 273.15) + 'º';
        

        $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="height : 150px; width : 150px;"></i>');
        $('.weather_description').prepend($weather_description);
        $('.current_temp').prepend($Temp);
        $('.humidity').prepend($humidity);
        $('.wind').prepend($wind);
        $('.city').append($city);
        $('.cloud').append($cloud);
        $('.temp_min').append($temp_min);
        $('.temp_max').append($temp_max);               
    }
}) 


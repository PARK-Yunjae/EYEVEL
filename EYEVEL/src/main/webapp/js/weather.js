//api-key 
const apiKey = "ed670c939f8e6b9849a9eb86bf91bf21";
// city
let city = "seoul";
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
        var $city = cityname;

        $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="height : 30px; width : 30px;"></i>');
        $('.weather_description').prepend($weather_description);
        $('.weather_description').prepend($Temp);
        $('.weather_description').prepend($city);
/*        $('.current_temp').prepend($Temp);
        $('.city').append($city);   */          
    }
}) 



function initMap() {
	var location = { lat: lat, lng: lon }; // 여기에 위도와 경도 값을 입력하세요
	var map = new google.maps.StreetViewPanorama(
		document.getElementById('panorama'), 
		{
      position: location,
      pov: {
        heading: 34,
        pitch: 10,
      },
	});
}



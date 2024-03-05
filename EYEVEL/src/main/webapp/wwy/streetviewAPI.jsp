<html>
  <head>
    <title>Street View split-map-panes</title>
    <style>
        /* 페이지에 맞게 스타일 조정 */
        #map {
            height: 100vh;
            width: 100%;
        }
    </style>
</head>
<body>
    <div id="map"></div>
    <script>
        function initMap() {
            var location = {lat: -34.397, lng: 150.644}; // 여기에 위도와 경도 값을 입력하세요
            var map = new google.maps.Map(document.getElementById('map'), {
                center: location,
                zoom: 18, // 줌 레벨을 조정하여 더 가까이 또는 멀리 볼 수 있습니다.
                mapTypeId: 'satellite' // 위성 이미지 타입 설정
            });
        }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfsi8KnJIWbseOCy2kEuaFLeG7pNpr36Y&callback=initMap">
    </script>
  </body>
</html>
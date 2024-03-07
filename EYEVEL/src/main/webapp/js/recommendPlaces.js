const placesNames = JSON.parse(sessionStorage.getItem('placesNames'));
console.log(placesNames); // ["장소1", "장소2", "장소3"]
const lat = parseFloat(sessionStorage.getItem('latitude'));
const lon = parseFloat(sessionStorage.getItem('longitude'));
console.log(`Loaded lat: ${lat}, lon: ${lon}`);

let map;
let directionsService;
let directionsRenderer;
let infowindow; // infowindow 객체를 전역 변수로 선언
let placeinfomations = [];
let selectedPlaceDetails = [];



function initMap() {
	directionsService = new google.maps.DirectionsService();
	directionsRenderer = new google.maps.DirectionsRenderer();
	map = new google.maps.Map(document.getElementById("map"), {
		center: { lat: lat, lng: lon },
		zoom: 12,
	});
	directionsRenderer.setMap(map);
	infowindow = new google.maps.InfoWindow(); // infowindow 객체 초기화
	// 마커를 추가하는 로직을 실행합니다.
	// 마커를 추가하고 경로를 그리는 함수 호출
	//addPlacesMarkersAndDrawRoute();

}



// Google Places 서비스를 초기화합니다.
function initGoogleMaps() {
	return new google.maps.places.PlacesService(map);
}

function populatePlacesSelection(placesNames) {
    const form = document.getElementById('places-form');
    placesNames.forEach((name, index) => {
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.id = 'place' + index;
        checkbox.value = name;
        const label = document.createElement('label');
        label.htmlFor = 'place' + index;
        label.textContent = name;
        form.appendChild(checkbox);
        form.appendChild(label);
        form.appendChild(document.createElement('br'));
    });
}

populatePlacesSelection(placesNames); // placesNames는 서버로부터 받은 장소 이름 배열

document.getElementById('calculate-route').addEventListener('click', () => {
    const selectedPlaces = [];
    const checkboxes = document.querySelectorAll('#places-form input[type="checkbox"]:checked');
    checkboxes.forEach((checkbox) => {
        selectedPlaces.push(checkbox.value);
    });

    if (selectedPlaces.length > 1) {
        // 선택된 장소를 기반으로 경로 계산 및 지도에 표시하는 로직
        addPlacesMarkersAndDrawRoute(selectedPlaces); // 선택된 장소만 포함하여 경로 계산 및 마커 추가
    } else {
        alert("적어도 두 개의 장소를 선택해야 경로를 계산할 수 있습니다.");
    }
});

// 각 장소에 마커를 추가합니다.
async function addPlacesMarkersAndDrawRoute(selectedPlaces) {
	const placesService = initGoogleMaps();
	let placesDetails = [];

	for (const placeName of selectedPlaces) {
		try {
			const placeDetail = await fetchPlaceDetails(placeName, placesService);
			if (placeDetail) {
				selectedPlaceDetails.push(placeDetail);
				const location = placeDetail.geometry.location;
				const latLng = {
					lat: location.lat(), // 실제 위도 값 얻기
					lng: location.lng() // 실제 경도 값 얻기
				};
				placesDetails.push(latLng);
				// google.maps.Marker로 마커 생성 및 지도에 추가
				const marker = new google.maps.Marker({
					position: placeDetail.geometry.location,
					map: map,
					title: placeName
				});

				// 마커에 클릭 이벤트 리스너 추가
				google.maps.event.addListener(marker, 'click', () => {
					const contentString = `
                        <div>
                            <h3>${placeDetail.name}</h3>
                            <p>${placeDetail.formatted_address ? placeDetail.formatted_address : ''}</p>
                            <p>Rating: ${placeDetail.rating ? placeDetail.rating : 'N/A'}</p>
                        </div>
                    `;
					infowindow.setContent(contentString);
					infowindow.open(map, marker);
				});
			}else {
            // 장소를 찾지 못한 경우, 이를 로그로 기록하거나 사용자에게 알림
            console.log(`${placeName} 장소 정보를 찾을 수 없습니다.`);
        }
		} catch (error) {
			console.error(`Error fetching details for ${placeName}:`, error);
		}
	}

	// 모든 장소의 상세 정보를 검색한 후, 경로를 그립니다.
	console.log(selectedPlaceDetails);
	drawRoute(placesDetails, 'DRIVING');
	document.getElementById('mode').addEventListener('change', function() {
	drawRoute(placesDetails, this.value);
	});

}

// 경로를 계산하고 지도에 표시하는 함수
function drawRoute(places, travelMode) {
	console.log(places);
	if (places.length < 2) {
		console.error("적어도 두개이상의 장소가 있어야만 경로를 그릴 수 있습니다.");
		return;
	}

	const waypoints = places.slice(1, -1).map(location => ({
		location: location,
		stopover: true,
	}));

	directionsService.route({
		origin: places[0],
		destination: places[places.length - 1],
		waypoints: waypoints,
		optimizeWaypoints: true,
		travelMode: google.maps.TravelMode[travelMode] // Or any other mode: 'WALKING', 'BICYCLING', 'TRANSIT'
	}, (response, status) => {
		if (status === google.maps.DirectionsStatus.OK) {
			directionsRenderer.setDirections(response);
			// 전체 경로에 대한 총 예상 이동 시간을 계산합니다.
			const route = response.routes[0];
			const legs = response.routes[0].legs;
			legs.forEach((leg, index) => {
				// 각 leg의 이동 시간을 placeinfomations에 저장
				if (selectedPlaceDetails[index]) {
					selectedPlaceDetails[index].duration = leg.duration.text;
				}
			});
			let totalDuration = 0;
			route.legs.forEach(leg => totalDuration += leg.duration.value);
			// 총 예상 이동 시간을 분 단위로 변환합니다.
			const totalDurationInMinutes = Math.round(totalDuration / 60);
			// 장소 상세 정보와 함께 updateInfoPanel 함수 호출
			updateInfoPanel(selectedPlaceDetails);
			// 첫 번째 마커에 이동 시간을 표시합니다.
			showDurationInfo(places[0], totalDurationInMinutes);
		} else {
			window.alert('Directions request failed due to ' + status);
		}
	});
}


function showDurationInfo(position, duration) {
	const contentString = `<div>전체 예상 이동 시간: ${duration} 분</div>`;
	infowindow.setContent(contentString);
	// 첫 번째 마커의 위치에 정보 창을 엽니다.
	infowindow.setPosition(position);
	infowindow.open(map);
}

// Google Places API를 사용하여 장소의 상세 정보를 검색합니다.
async function fetchPlaceDetails(placeName, placesService) {
	const request = {
		query: placeName,
		fields: ['name', 'geometry', 'formatted_address', 'rating', 'opening_hours', 'photos', 'price_level']
	};

	return new Promise((resolve, reject) => {
		placesService.findPlaceFromQuery(request, (results, status) => {
			if (status === google.maps.places.PlacesServiceStatus.OK && results && results.length > 0) {
				resolve(results[0]);
			} else {
				console.log(`장소를 찾지 못했습니다: ${placeName}`);
				resolve(null); // 장소를 찾지 못했다면 null을 반환
			}
		});
	});
}

function updateInfoPanel(placesDetails) {
	const infoPanel = document.getElementById('place-details');
	infoPanel.innerHTML = ''; // 정보창 초기화

	placesDetails.forEach((place, index) => {
     let photoUrl = place.photos && place.photos.length > 0
            ? place.photos[0].getUrl({'maxWidth': 100, 'maxHeight': 100})
            : '';
		// 각 장소의 정보를 HTML 요소로 추가
     let placeInfo = `
            <div class="place-info">
                <h3>${place.name}</h3>
                ${photoUrl ? `<img src="${photoUrl}" alt="${place.name}">` : ''}
                <p>주소: ${place.formatted_address}</p>
                <p>평점: ${place.rating ? place.rating : 'N/A'}</p>
                ${place.duration ? `<p>다음 장소까지 이동 시간: ${place.duration}</p>` : ''}
            </div>
        `;
		infoPanel.innerHTML += placeInfo;
	});
}

// 페이지 로드 시 지도를 초기화합니다.
window.onload = function() {
	initMap();
	showPlacesSelection();
	
};

function showPlacesSelection() {
    document.getElementById('overlay').style.display = 'block';
    document.getElementById('places-selection').style.display = 'block';
    document.getElementById("info-panel").classList.add("visible");
}

document.getElementById('calculate-route').addEventListener('click', () => {
    // 선택 로직 처리 후
    document.getElementById('overlay').style.display = 'none';
    document.getElementById('places-selection').style.display = 'none';
});
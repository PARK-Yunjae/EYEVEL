/**
 * 
 */

// 유튜브 API를 불러오기

// 윤재 API키 : 'AIzaSyB7zkEXbvS3IHoi2ApQWWbNMfJj4UEDXrU'
// 우연 API키 : 'AIzaSyCfsi8KnJIWbseOCy2kEuaFLeG7pNpr36Y'

let word = document.querySelector(".location").dataset.word;
console.log(word);
function loadYoutubeApi() {
	gapi.load('client', () => {
		gapi.client.init({
			'apiKey': 'AIzaSyB7zkEXbvS3IHoi2ApQWWbNMfJj4UEDXrU'
			// Add other init parameters here as needed.
		}).then(function() {
			return gapi.client.load('youtube', 'v3'); // Load the YouTube Data API v3 client library.
		}).then(function() {
			searchYoutube(word); // 검색어를 이곳에 넣는다
		});
	});
}
// 유튜브 검색
function searchYoutube(searchTerm) {
	var request = gapi.client.youtube.search.list({
		part: 'snippet',
		type: 'video',
		q: searchTerm,
		maxResults: 1 // 검색 결과 표시 갯수 // 시연할때는 5개정도로 설정해줄 것 
	});

	request.execute(function(response) {
		if (!response || !response.result) {
			console.log("API 호출에 실패했거나 응답 형식이 올바르지 않습니다.");
			return;
		}
		var items = response.result.items;
		if (items.length > 0) {
			// 결과 목록에서 랜덤한 비디오를 선택합니다.
			var randomIndex = Math.floor(Math.random() * items.length);
			var searchResult = items[randomIndex];
			var videoId = searchResult.id.videoId;
			displayVideo(videoId);
			console.log(videoId);
		} else {
			console.log("No videos found for search term: " + searchTerm);
		}
	});
}
// 비디오 링크 생성 및 웹페이지에 표시
function displayVideo(videoId) {
	var videoSrc = "https://www.youtube.com/embed/" + videoId;
	console.log("비디오 표시중")
	document.getElementById('youtube-video').src = videoSrc;
}
// 웹페이지가 로드되고 나면 실행
window.onload = loadYoutubeApi;
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer src="https://apis.google.com/js/api.js"></script>

</head>
<body>
<iframe id="youtube-video" width="560" height="315" src="" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</body>
</html>

<script>
// 유튜브 API를 불러오기
function loadYoutubeApi() {
    gapi.load('client', () => {
        gapi.client.init({
            'apiKey': 'AIzaSyCfsi8KnJIWbseOCy2kEuaFLeG7pNpr36Y'
            // Add other init parameters here as needed.
        }).then(function() {
            return gapi.client.load('youtube', 'v3'); // Load the YouTube Data API v3 client library.
        }).then(function() {
            console.log("YouTube Data API v3 is loaded");
            searchYoutube('바르샤바'); // 검색어를 이곳에 넣는다
        });
    });
}
// 유튜브 검색
function searchYoutube(searchTerm) {
    var request = gapi.client.youtube.search.list({
        part: 'snippet',
        type: 'video',
        q: searchTerm,
        maxResults: 5 // 검색 결과 표시 갯수
    });

    request.execute(function(response) {
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
</script>

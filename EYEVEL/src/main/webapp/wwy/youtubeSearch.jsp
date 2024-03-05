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
function loadYoutubeApi() {
    gapi.load('client', () => {
        gapi.client.init({
            'apiKey': 'AIzaSyCfsi8KnJIWbseOCy2kEuaFLeG7pNpr36Y'
            // Add other init parameters here as needed.
        }).then(function() {
            return gapi.client.load('youtube', 'v3'); // Load the YouTube Data API v3 client library.
        }).then(function() {
            console.log("YouTube Data API v3 is loaded");
            searchYoutube('서울여행');
        });
    });
}

function searchYoutube(searchTerm) {
    var request = gapi.client.youtube.search.list({
        part: 'snippet',
        type: 'video',
        q: searchTerm,
        maxResults: 1
    });

    request.execute(function(response) {
        if (response.result.items.length > 0) {
            var searchResult = response.result.items[0];
            var videoId = searchResult.id.videoId;
            displayVideo(videoId);
            console.log(videoId);
        } else {
            console.log("No videos found for search term: " + searchTerm);
        }
    });
}

function displayVideo(videoId) {
    var videoSrc = "https://www.youtube.com/embed/" + videoId;
    console.log("비디오 표시중")
    document.getElementById('youtube-video').src = videoSrc;
}

window.onload = loadYoutubeApi;
</script>

// 생성형 AI 
import { GoogleGenerativeAI } from "@google/generative-ai";

// Fetch your API_KEY
const API_KEY = "AIzaSyCji7sq-fO9k9QdwJvLtN6a5GwyYyQ9_o0";

// Access your API key (see "Set up your API key" above)
const genAI = new GoogleGenerativeAI(API_KEY);
const generationConfig = {
	stopSequences: ["red"],
	maxOutputTokens: 1024,

	temperature: 1,
	topP: 1,
	topK: 16,
};


// Markdown 변환 함수 정의
function markdownToHtml(text) {
	// Markdown 볼드(**)를 HTML 볼드(<b>)로 변환
	let html = text.replace(/\*\*(.*?)\*\*/g, '<b>$1</b>');
	// 줄바꿈(\n)을 <br> 태그로 변환
	html = html.replace(/\n/g, '<br>');
	return html;
};

// AI 응답으로부터 장소 이름 추출
function extractPlaceNamesFromHtml(htmlText) {
	const placeNamess = [];
	const regex = /<b>(.*?)<\/b>/g; // <b> 태그로 둘러싸인 텍스트를 찾는 정규식
	let match;

	while ((match = regex.exec(htmlText)) !== null) {
		placeNamess.push(match[1]); // <b>와 </b> 사이의 텍스트 추출
	}

	return placeNamess;
}

async function run() {
	console.log("AI테스트중");
	// For text-only input, use the gemini-pro model
	const model = genAI.getGenerativeModel({ model: "gemini-pro", generationConfig });

	const prompt = name +"에서 방문하기 좋은 인기 명소 3곳을 추천해주세요. 각 장소는 도보나 대중교통으로 쉽게 접근할 수 있어야 하며, 구글 지도에서 검색할 때 정확한 위치를 찾을 수 있는 명확한 이름을 가지고 있어야 합니다. 각 추천 장소에는 방문자들에게 유용할 수 있는 간단한 설명과 함께, 왜 이 장소가 "+ name+" 방문 시 꼭 가봐야 하는지에 대한 정보를 포함해주세요. 출력 형식 예시: [장소 이름]: [장소에 대한 간단한 설명 및 특징]";


	const result = await model.generateContent([prompt]); // 이 부분은 실제 API에 따라 달라질 수 있습니다.
	const response = await result.response;
	// 가정된 함수가 직접적인 결과를 반환한다고 가정할 때
	const completeText = response.text(); // 가정된 처리 방식, 실제 API의 응답 구조에 맞게 조정 필요


	// Markdown 변환 실행
	const convertedText = markdownToHtml(completeText);
	document.getElementById("output").innerHTML = convertedText;
	console.log(convertedText);

	// ai의 답 중에서 장소이름만 가져오는 답을 다시 생성
    const prompt2 = "다음은 "+name+"지역을 방문할 때 추천되는 장소들에 대한 설명입니다: " + completeText + " 이 설명을 바탕으로, 추천 장소의 이름만을 쉼표(,)로 구분하여 나열해주세요. 예를 들어, '장소1, 장소2, 장소3'과 같이 작성해주십시오. 장소 이름은 가능한 한 구글 지도에서 정확히 찾을 수 있는 형태로 제공해주세요."
    // 두 번째 AI 요청에서는 더 명확한 지침을 제공
    
 
	const result2 = await model.generateContent([prompt2]); // 이 부분은 실제 API에 따라 달라질 수 있습니다.
	const response2 = await result2.response;

	// 가정된 함수가 직접적인 결과를 반환한다고 가정할 때
	const completeText2 = response2.text(); // 가정된 처리 방식, 실제 API의 응답 구조에 맞게 조정 필요

	// 후처리 로직을 통해 장소 이름 추출
    // 여기서는 응답에서 구분자(예: 콤마)를 기준으로 장소 이름을 분리
    const placesNames = completeText2.split(',').map(name => name.trim());
	//placesNames = extractPlaceNamesFromHtml(completeText2);
	sessionStorage.setItem('placesNames', JSON.stringify(placesNames));
	console.log(placesNames); // 콘솔에 추출된 장소 이름 출력
	// Google Maps 및 Places Service 초기화

}


window.run = run;
run();
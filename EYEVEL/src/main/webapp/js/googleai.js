// 생성형 AI 
import { GoogleGenerativeAI } from "@google/generative-ai";

// Fetch your API_KEY
const API_KEY = "AIzaSyCji7sq-fO9k9QdwJvLtN6a5GwyYyQ9_o0";

// Access your API key (see "Set up your API key" above)
const genAI = new GoogleGenerativeAI(API_KEY);
const generationConfig = {
	stopSequences: ["red"],
	maxOutputTokens: 1024,

	temperature: 0.5,
	topP: 0.9,
	topK: 15,
};


// Markdown 변환 함수 정의
function markdownToHtml(text) {
	// Markdown 볼드(**)를 HTML 볼드(<b>)로 변환
	let html = text.replace(/\*\*(.*?)\*\*/g, '<b>$1</b>');
	// 줄바꿈(\n)을 <br> 태그로 변환
	html = html.replace(/\n/g, '<br>');
	return html;
};

async function run() {
	// For text-only input, use the gemini-pro model
	const model = genAI.getGenerativeModel({ model: "gemini-pro", generationConfig });

	const prompt = `${name}에서 관광객들이 방문하기에 가장 좋은 인기 명소 4곳을 추천해주세요. 각 장소는 다음 조건을 충족해야 합니다:

1. 도보 또는 대중교통으로 접근이 용이해야 합니다.
2. 구글 지도에서 정확한 위치를 검색할 수 있는 명확한 이름을 가지고 있어야 합니다.
3. 관광객들에게 인기 있는 명소이며, 방문할 가치가 있어야 합니다.

각 추천 장소에 대해 다음 정보를 포함해주세요:

1. 장소 이름
2. 간단한 장소 설명 (100자 이내)
3. 이 장소를 ${name} 방문 시 꼭 가봐야 하는 이유

응답 형식 예시:

[장소 이름 1]: [간단한 설명] 이 장소를 방문해야 하는 이유...
[장소 이름 2]: [간단한 설명] 이 장소를 방문해야 하는 이유...
...`;

	const result = await model.generateContent([prompt]); // 이 부분은 실제 API에 따라 달라질 수 있습니다.
	const response = await result.response;
	// 가정된 함수가 직접적인 결과를 반환한다고 가정할 때
	const completeText = response.text(); // 가정된 처리 방식, 실제 API의 응답 구조에 맞게 조정 필요


	// Markdown 변환 실행
	const convertedText = markdownToHtml(completeText);
	document.getElementById("output").innerHTML = convertedText;
	console.log(convertedText);

	// ai의 답 중에서 장소이름만 가져오는 답을 다시 생성
	const prompt2 = `다음은 ${name} 지역을 방문할 때 추천되는 장소들에 대한 설명입니다:

${completeText}

위 설명을 바탕으로, 추천 장소의 이름만을 쉼표(,)로 구분하여 나열해주세요. 예를 들어 ' ${name} 장소1,${name} 장소2,${name} 장소3'와 같이 작성해주십시오.

주의사항:
1. 장소 이름은 가능한 한 구글 지도에서 정확히 찾을 수 있는 형태로 제공해주세요.
2. ${name} 지역에서 10km 이상 떨어진 곳은 제외하고 작성해주세요.
3. 중복된 장소 이름은 포함하지 마세요.`;

	const result2 = await model.generateContent([prompt2]); // 이 부분은 실제 API에 따라 달라질 수 있습니다.	
	const placeNames = (await result2.response.text()).split(',').map(name => name.trim());
	sessionStorage.setItem('cityName',name);
	sessionStorage.setItem('placesNames', JSON.stringify(placeNames));
	console.log(placeNames); // 콘솔에 추출된 장소 이름 출력


};


window.run = run;
run();
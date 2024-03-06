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
async function run() {
	console.log("AI테스트중");
	// For text-only input, use the gemini-pro model
	const model = genAI.getGenerativeModel({ model: "gemini-pro", generationConfig });

	const prompt = name + "색다른 관광명소 3개 추천. 관광지를 볼 수 있는 웹사이트 링크도 함께. 웹사이트 링크는 다음 예시처럼 작성해줘 예시는 포함하지 말고. 예시: **1. 팀랩 보더리스** : 몰입적이고 상호 작용적인 디지털 아트 박물관 <br><a href='https://www.google.com/search?q=팀랩+보더리스' target='blank'>구글검색결과 바로가기</a> ";
	/*	const result = await model.generateContentStream([prompt]);
	
		let completeText = '';
		for await (const chunk of result.stream) {
			const chunkText = chunk.text();
			console.log(chunkText);
			completeText += chunkText;
		}
	
		// 모든 텍스트가 수집된 후 Markdown 변환을 실행
		const convertedText = markdownToHtml(completeText);
		document.getElementById("output").innerHTML = convertedText;
		*/
	const result = await model.generateContent([prompt]); // 이 부분은 실제 API에 따라 달라질 수 있습니다.
	const response = await result.response;
	// 가정된 함수가 직접적인 결과를 반환한다고 가정할 때
	const completeText = response.text(); // 가정된 처리 방식, 실제 API의 응답 구조에 맞게 조정 필요
	console.log(completeText);
	// Markdown 변환 실행
	const convertedText = markdownToHtml(completeText);
	document.getElementById("output").innerHTML = convertedText;
}
window.run = run;
run();
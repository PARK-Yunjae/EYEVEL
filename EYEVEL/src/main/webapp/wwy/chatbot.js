  import {GoogleGenerativeAI} from "@google/generative-ai";

  // DOM 요소
  const chatMessages = document.querySelector('#chat-messages');
  const userInput = document.querySelector('#user-input input');
  const sendButton = document.querySelector('#user-input button');
  const outputElement = document.getElementById("output"); // 결과를 표시할 요소

  // Google API 설정
  const API_KEY = "AIzaSyCji7sq-fO9k9QdwJvLtN6a5GwyYyQ9_o0";
  const genAI = new GoogleGenerativeAI(API_KEY);
  const generationConfig = {
    stopSequences: ["Human"], // 종료 구문 설정
    maxOutputTokens: 1024,
    temperature: 0.8,
    topP: 1,
    topK: 16,
  };

  // 메시지 추가 함수
  function addMessage(sender, message) {
    const messageElement = document.createElement('div');
    messageElement.className = 'message';
    messageElement.textContent = `${sender}: ${message}`;
    chatMessages.prepend(messageElement);
  };

  // Google AI API 요청 함수
  async function fetchAIResponse(prompt) {
    try {
      const model = genAI.getGenerativeModel({model: "gemini-pro", generationConfig});
      const result = await model.generateContentStream([prompt]);

      let aiResponse = '';
      for await (const chunk of result.stream) {
        const chunkText = await chunk.text();
        aiResponse += chunkText;
      }

      return aiResponse;
    } catch (error) {
      console.error('Google Generative AI API 호출 중 오류 발생:', error);
      return 'Google Generative AI API 호출 중 오류 발생';
    }
  }

  // 전송 버튼 클릭 이벤트 처리
  sendButton.addEventListener('click', async () => {
    const message = userInput.value.trim();
    if (message.length === 0) return;
    addMessage('나', message);
    userInput.value = '';
    const aiResponse = await fetchAIResponse(message);
    addMessage('챗봇', aiResponse);
  });

  // 사용자 입력 필드에서 Enter 키 이벤트를 처리
  userInput.addEventListener('keydown', (event) => {
    if (event.key === 'Enter') {
      sendButton.click();
    }
  });
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

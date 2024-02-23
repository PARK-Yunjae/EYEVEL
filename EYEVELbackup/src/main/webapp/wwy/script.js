document.getElementById('send-btn').addEventListener('click', function() {
    const userInput = document.getElementById('user-input');
    const chatBox = document.getElementById('chat-box');
    const message = userInput.value.trim();

    if (message) {
        // 사용자 메시지 표시
        const userMsgElement = document.createElement('div');
        userMsgElement.textContent = `나: ${message}`;
        chatBox.appendChild(userMsgElement);

        // ChatGPT API 요청 로직 추가 위치
        // 예제로는 직접적인 ChatGPT API 호출 대신 텍스트를 반영해서 답변을 생성하는 예시 코드입니다.
        const botMsgElement = document.createElement('div');
        botMsgElement.textContent = `ChatGPT: 이 메시지는 예시 응답입니다.`; // 실제 API 응답으로 대체 필요
        chatBox.appendChild(botMsgElement);

        // 스크롤 최하단으로 이동
        chatBox.scrollTop = chatBox.scrollHeight;
    }

    userInput.value = ''; // 입력 필드 초기화
    
     document.getElementById('send-btn').addEventListener('click', function() {
            const userInput = document.getElementById('user-input').value.trim();
            if (userInput) {
                // AJAX 요청을 서버로 보냄
                fetch('ChatServlet', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ message: userInput })
                })
                .then(response => response.json())
                .then(data => {
                    // 서버로부터 받은 응답을 채팅 박스에 추가
                    const chatBox = document.getElementById('chat-box');
                    const botMsgElement = document.createElement('div');
                    botMsgElement.textContent = `ChatGPT: ${data.response}`;
                    chatBox.appendChild(botMsgElement);
                    chatBox.scrollTop = chatBox.scrollHeight;
                })
                .catch(error => console.error('Error:', error));
            }
            document.getElementById('user-input').value = ''; // 입력 필드 초기화
        });
});
/**
 * 
 */
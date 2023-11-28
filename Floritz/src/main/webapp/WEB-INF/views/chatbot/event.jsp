<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>ChatBot</title>
<!-- bootstrap-icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Simple line icons-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/main.css" />
<link href="/static/css/styles.css" rel="stylesheet" />
<link href="/static/css/chatbot.css" rel="stylesheet" />
    <link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/app.js" charset="UTF-8"></script>
<style>
    .company {
    background-color: #ddd; 
    color: #000; 
    border: none;
    float: left;
    padding: 15px;
    border-radius: 15px;
    width: 680px !important;
  }
  

</style>

</head>
<body>
<jsp:include page="/WEB-INF/resources/sidebar.jsp" />
   <div id="chat-container">
    <h2>플로리츠 챗봇</h2>
    
    <div id="chat-box">
      <br>
      <div class="company" >
      <h5>등록된 이벤트가 없습니다.</h5>
      <br>
      </div>

      
        <div id="result"></div>
    </div>
    <form action="/send" method="post" onsubmit="return false;">
        <a href="/chat">
         <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#5AAF4B" class="bi bi-house-door-fill" viewBox="0 0 16 16">
           <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5Z"/>
         </svg>
      </a>
        <input class="answer" type="text" id="keywords" onkeydown="handleKeyDown(event)" />
        <input type="button" value="전송" onclick="chatGPT()" />
    </form>
    <div id="loading">로딩 중...</div>
</div>
 <script>
    $(document).ready(function () {
        $('#loading').hide();
    });

    function chatGPT() {
        const api_key = "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";
        const keywords = document.getElementById('keywords').value;
        $('#loading').show();

        const messages = [
            { role: 'system', content: 'You are a helpful assistant.' },
            { role: 'user', content: keywords }, // 키워드 추가
        ]

        const data = {
            model: 'gpt-3.5-turbo',
            temperature: 0.5,
            n: 1,
            messages: messages,
        }

        $.ajax({
            url: "https://api.openai.com/v1/chat/completions",
            method: 'POST',
            headers: {
                Authorization: "Bearer " + api_key,
                'Content-Type': 'application/json',
            },
            data: JSON.stringify(data),
        }).then(function (response) {
            $('#loading').hide();
            console.log(response);
            let result = document.getElementById('result');
            
            // 사용자의 입력 메시지를 오른쪽에 표시
            let userMessage = document.createElement('div');
            userMessage.className = 'message user-message';
            userMessage.innerHTML = keywords;
            result.appendChild(userMessage);

            let pre = document.createElement('pre');
            pre.innerHTML = "\n\n" + response.choices[0].message.content;

          
         // 챗봇 응답 메시지를 표시하는 JavaScript 코드에서 변경
            let botMessage = document.createElement('div');
            botMessage.className = 'message bot-message';
            botMessage.appendChild(pre);
            result.appendChild(botMessage);
            
            // 자동으로 스크롤을 아래로 이동
            result.scrollTop = result.scrollHeight;
         
            // chat-box가 꽉 찼을 때 스크롤을 표시하도록 조절
            let chatBox = document.getElementById('chat-box');
            if (chatBox.scrollHeight > chatBox.clientHeight) {
                chatBox.style.overflowY = 'scroll';
            }
            
            document.getElementById('keywords').value = '';
        });
    }

    function handleKeyDown(event) {
        if (event.key === "Enter") {
            event.preventDefault();
            chatGPT();
        }
    }
</script>
</body>
</html>
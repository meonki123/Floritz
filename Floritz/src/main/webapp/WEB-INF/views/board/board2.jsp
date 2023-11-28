<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
   작성자<input type="text" id="writer" value = "글쓴이"/>
   <input type="button" id="btnFind" value="찾기" />
   <div id="result"></div>
   
   <script>
     const  btnFindEl = document.querySelector('#btnFind')
     btnFindEl.addEventListener('click', () => {
    	 // 서버조회 : ajax
    	// 지정된 ID를 가진 유저에 대한 요청
    	 axios.get('/writer?writer=글쓴이')
    	   .then(function (response) {
    	     // 성공 핸들링
    	     //console.log(response);
    	     console.log(response.data);
    	     let results =  response.data;
    	     let tag     = '';
    	     for(let result of results) {
    	    	 console.log(result);
    	    	 tag += '<ul>';
    	    	 tag += '<li>' +  result.bno  + '</li>';
    	    	 tag += '<li>' +  result.title  + '</li>';
    	    	 tag += '<li>' +  result.writer  + '</li>';    	    	 
    	    	 tag += '</ul>';
    	     }
    	     
    	     const  resultEl = document.querySelector('#result');
    	     resultEl.innerHTML = tag;
    	   })
    	   .catch(function (error) {
    	     // 에러 핸들링
    	     console.log(error);
    	   })
    	   .finally(function () {
    	     // 항상 실행되는 영역
    	   });
     })
   
   </script>
</body>
</html>






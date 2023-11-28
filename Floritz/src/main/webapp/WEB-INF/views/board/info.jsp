<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>정보 등록/수정</h1>
    
    <form action="/info" method="post">
        <label for="announcement">공지사항:</label>
        <input type="text" id="announcement" name="announcement" th:value="${boardDTO.announcement}" /><br><br>
        
        <label for="repnumber">대표번호:</label>
        <input type="text" id="repnumber" name="repnumber" th:value="${boardDTO.repnumber}" /><br><br>
        
        <label for="dayoff">휴무일:</label>
        <input type="text" id="dayoff" name="dayoff" th:value="${boardDTO.dayoff}" /><br><br>
        
        <label for="breaktime">휴게시간:</label>
        <input type="text" id="breaktime" name="breaktime" th:value="${boardDTO.breaktime}" /><br><br>
        
        <button type="submit" th:text="${buttonText}"></button>
    </form>
</body>
</html>
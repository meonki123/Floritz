<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form action="/writerlist" method="get">
   작성자<input type="text" id="writer" name="writer" />
   <input type="submit" value="찾기">
  </form> 
   <hr />
   결과
   <div id="result">
   <c:forEach var="brd" items="${ wList }">
   <ul>
     <li>${ brd.bno }</li>
     <li>${ brd.title }</li>
     <li>${ brd.writer }</li>
     <li>${ brd.content }</li>
     <li>${ brd.regdate }</li>
     <li>${ brd.hit }</li>
   </ul>
   </c:forEach>
   </div>
</body>
</html>







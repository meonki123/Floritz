<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Profile</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    // 페이지 로드 시 전화번호 포맷팅
    window.onload = function() {
        let phoneField = document.getElementById('formattedPhone');
        formatAsPhoneNumber(phoneField);
    }

    // 전화번호 포맷팅 함수
    function formatAsPhoneNumber(input) {
        var cleaned = ('' + input.value).replace(/\D/g, '');
        var match = cleaned.match(/^(\d{3})(\d{4})(\d{4})$/);
        if (match) {
            input.value = '' + match[1] + '-' + match[2] + '-' + match[3];
            document.getElementById('phone').value = cleaned; // 원본 전화번호를 동기화합니다.
        }
        if(cleaned.length > 11) {
            input.value = input.value.slice(0, 13); 
        }
    }
</script>
</head>
<body>
<div id="sidebar">
	<jsp:include page="/WEB-INF/resources/header.jsp" />
    <jsp:include page="/WEB-INF/resources/sideLeft.jsp" />
</div>
   <div class="container mt-5">
      <h1 class="text-center">내 정보 수정</h1>
      <div class="row">
         <div class="col-md-6 offset-md-3">
            <c:if test="${user != null}">
            <form action="/updateprofile" method="post">
               <div class="form-group">
                  <label for="id">ID</label> <input type="text" class="form-control"
                     id="id" name="id" value="${user.id}" readonly>
               </div>
               <div class="form-group">
                  <label for="name">이름</label> <input type="text"
                     class="form-control" id="name" name="name" value="${user.name}"
                     readonly>
               </div>
               <div class="form-group">
                  <label for="password">새 비밀번호</label> <input type="password"
                     class="form-control" id="password" name="password"  placeholder="비밀번호를 입력하세요.">
               </div>
               <div class="form-group">
                  <label for="passwordConfirm">비밀번호 확인</label> <input
                     type="password" class="form-control" id="passwordConfirm" placeholder="비밀번호를 입력하세요.">
               </div>
               <div class="form-group">
                  <label for="email">Email</label> <input type="email"
                     class="form-control" id="email" name="email"
                     value="${user.email}">
               </div>
<%--                <div class="form-group">
                  <label for="phone">전화번호</label> <input type="text"
                     class="form-control" id="phone" name="phone"
                     value="${user.phone}">
               </div> --%>
               <div class="form-group">
				    <label for="phone">전화번호</label> 
				    <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" readonly style="display:none;">
				    <input type="text" class="form-control" id="formattedPhone" oninput="formatAsPhoneNumber(this)" maxlength="13" value="${user.phone}"  placeholder="전화번호를 입력하세요.">
				</div>
               <button type="submit" class="btn btn-primary" id="submit">수정하기</button>
            </form>
			</c:if>
  		            <c:if test="${user == null}">
	                    <p>로그인이 필요합니다.</p>
	                    <a href="/Login" class="btn btn-primary">로그인</a>
	                </c:if>
         </div>
      </div>
   </div>

   <script>
      $(document).ready(function() {
         $("#submit").click(function(event) {
            var password = $("#password").val();
            var passwordConfirm = $("#passwordConfirm").val();
            if (password != passwordConfirm) {
               alert("비밀번호가 일치하지 않습니다.");
               event.preventDefault();
            }
         });
      });
   </script>
</body>
</html>
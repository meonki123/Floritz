<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/mypage.css">
<style>

</style>
<script>
window.onload = function() {
    let phone = document.getElementById('phone').value; // 원본 전화번호 값을 가져옵니다.
    phone = phone.replace(/(\d{3})(\d{4})(\d{4})/, "$1-$2-$3"); // 전화번호 형식을 변경합니다.
    document.getElementById('formattedPhone').value = phone; // 변경된 전화번호를 화면에 표시합니다.
}
</script>
</head>
<body>
<div id="sidebar">
	<jsp:include page="/WEB-INF/resources/header.jsp" />
    <jsp:include page="/WEB-INF/resources/sideLeft.jsp" />
</div>

    <div class="container mt-5">
	    <!-- <div class="row justify-content-center"> 이 부분 추가
	    <div class="col-md-6"> -->
	        <h1 class="text-center">내 정보</h1>
	        <c:if test="${not empty message}">
	            <div class="alert alert-success" role="alert">
	                ${message}
	            </div>
	        </c:if>
	        <div class="row">
	            <div class="col-md-6 offset-md-3">
	            <c:if test="${user != null}">
	                <!-- <table class="table table-bordered"> -->
	                <form method="post" class="form">
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
                  		<label for="email">Email</label> <input type="email"
                     	class="form-control" id="email" name="email"
                     	value="${user.email}"  readonly>
               		</div>
<%-- 	                <div class="form-group">
                  		<label for="phone">전화번호</label> <input type="text"
                     	class="form-control" id="phone" name="phone"
                     	value="${user.phone}"  readonly>
               		</div> --%>
               		<div class="form-group">
					    <label for="phone">전화번호</label> 
					    <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" readonly style="display:none;">
					    <input type="text" class="form-control" id="formattedPhone" disabled>
					</div>
	                <a href="/editprofile" class="btn btn-primary">프로필 수정</a>
	                </form>
	           </c:if>
	                <c:if test="${user == null}">
	                    <p>로그인이 필요합니다.</p>
	                    <a href="/Login" class="btn btn-primary">로그인</a>
	                </c:if>
	            </div>
        	</div>
        </div>
<!--     </div>
    </div> -->
</body>
</html>
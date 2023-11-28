<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Stylish Portfolio - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Simple line icons-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->


<link rel="stylesheet" href="/static/css/main.css" />
<link href="/static/css/styles.css" rel="stylesheet" />
<style>
body {
	font-family: 'NanumSquareNeo-Variable';
}
</style>
    </head>
<body>
	<div class="d-flex" id="wrap	per">
		<!-- Navigation-->
		<a class="menu-toggle rounded" href="#"><i class="fas fa-bars"></i></a>
		<nav id="sidebar-wrapper">
		    <ul class="sidebar-nav">
			    
			<c:choose>
		        <c:when test="${sessionScope.user != null}">
		            <li class="sidebar-brand"><a href="/Logout" style="font-size: 30px; padding-right: 180px; ">로그아웃</a>
		            <li class="sidebar-brand">로그인한 유저: ${sessionScope.user.id}</li>
		        </c:when>
		        <c:otherwise>
		             <li class="sidebar-brand"><a href="/Login" style="font-size: 30px; padding-right: 180px; ">로그인》</a>
		             <a href="/Terms">회원가입</a></li>
		        </c:otherwise>
	        </c:choose>
		        <li class="sidebar-nav-item"><a href="/List">단체 예약</a></li>
		        <li class="sidebar-nav-item"><a href="/Mung/insert">업체 등록</a></li>
		        <li class="sidebar-nav-item"><a href="/WriteForm">업체등록2</a></li>
		      <c:choose>
		         <c:when test="${sessionScope.user.id == 'floritz' }">
		        <li class="sidebar-nav-item"><a href="/room">정보등록</a></li>
		         </c:when>
		         <c:otherwise>
		             <li class="sidebar-nav-item"><a href="/chat">채팅</a></li>
		        </c:otherwise>
		       </c:choose>
		            
		    </ul>
		</nav>
		
		  <div class="logo">
		    <a class="navbar-brand" href="/">
		       Floritz
		    </a>
		  </div>
		
	</div>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/static/js/scripts.js"></script>
</body>
</html>




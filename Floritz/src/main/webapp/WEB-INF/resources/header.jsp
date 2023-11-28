<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Stylish Portfolio - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Simple line icons-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->


<link rel="stylesheet" href="/static/css/main.css" />
<link href="/static/css/styles.css" rel="stylesheet" />
<style>
body {
	font-family: 'NanumSquareNeo-Variable';
}

.sidebar-item {
	color: #fff;
	text-decoration: none;
}

#loginst {
	position: absolute;
	right: 0;
	padding-right: 8px;
}
</style>
</head>
<body>
	<div class="d-flex" id="wrap   per">
		<!-- Navigation-->
		<a class="menu-toggle rounded" href="#"><i class="fas fa-bars"></i></a>
		<nav id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<c:if test="${sessionScope.user != null}">
					<li class="sidebar-brand"><a class="sidebar-item"
						href="${sessionScope.user.userType == 'personal' ? '/MyPage' : '/MyPage'}"
						style="font-size: 30px;">${sessionScope.user.userType == 'personal' ? '개인' : '사업자'}
							${sessionScope.user.id} 님》</a> <a class="sidebar-item float-right"
						id="loginst" href="/Logout">로그아웃</a></li>
				</c:if>
				<c:if test="${sessionScope.company != null}">
					<li class="sidebar-brand"><a class="sidebar-item"
						href="${sessionScope.company.userType == 'company' ? '/MyPage' : '/MyPage'}"
						style="font-size: 30px;">사업자 ${sessionScope.company.id} 님》</a> <a
						class="sidebar-item float-right" id="loginst" href="/Logout">로그아웃</a></li>
				</c:if>
				<c:if
					test="${sessionScope.user == null && sessionScope.company == null}">
					<li class="sidebar-brand"><a href="/Login"
						style="font-size: 30px; padding-right: 180px;">로그인》</a> <a
						href="/Join">회원가입</a></li>
				</c:if>
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
			<a class="navbar-brand" href="/"> Floritz </a>
		</div>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/static/js/scripts.js"></script>
	<!-- chatbot -->
	<a href="/chat" class="chatbot-button"> <svg
			xmlns="http://www.w3.org/2000/svg" width="50" height="50"
			fill="black" class="bi bi-chat-text" viewBox="0 0 16 16">
  <path
				d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
  <path
				d="M4 5.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zM4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8zm0 2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z" />
</svg></a>
</body>
</html>



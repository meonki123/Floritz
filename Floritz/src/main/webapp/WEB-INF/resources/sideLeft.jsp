<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.od-LeftNav-navContent {
	position: fixed;
	left: 0;
	width: 200px;
	height: 100vh;
	overflow-y: auto;
	border-right: 1px solid #ced4da;
	border-top: 1px solid #ced4da;
	display: block;
	font-size: large;
}

.od-LeftNav-navContent ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

.od-LeftNav-navContent ul li {
	padding: 10px;
}

.od-LeftNav-navContent ul li:hover {
	background-color: skyblue;
}

.od-LeftNav-navContent ul li a {
	text-decoration: none;
	color: black;
	padding-left: 10px;
}

.od-LeftNav-navContent ul li a:hover {
	color: white;
}

.od-LeftNav-navContent ul li a[href="/MyPage"]:visited,
.od-LeftNav-navContent ul li a[href="/MyPage"] {
    font-weight: bold;
}

.od-LeftNav-navContent ul li a[href=""]:visited,
.od-LeftNav-navContent ul li a[href=""] {
    font-weight: bold;
}

</style>
</head>
<body>
	<div class="od-LeftNav-navContent">
		<nav role="navigation" class="ms-Nav root-99">
			<ul role="list" class="ms-Nav-navItems navItems-106">
				<li role="listitem" class="ms-Nav-navItem navItem-105"><a
					class="ms-Button ms-Button--action ms-Button--command ms-Nav-link link-114"
					href="#" title="내 파일"
					data-is-focusable="true" tabindex="0"><span
						class="iconWrapper_f881cca4">예약 조회</span></a></li>
				<li role="listitem" class="ms-Nav-navItem navItem-105"><a
					class="ms-Button ms-Button--action ms-Button--command ms-Nav-link link-114"
					href="/MyPage" title="최근" data-is-focusable="true" tabindex="-1"><span
						class="iconWrapper_f881cca4">내 정보 수정</span></a></li>
			</ul>
		</nav>
	</div>
</body>
</html>
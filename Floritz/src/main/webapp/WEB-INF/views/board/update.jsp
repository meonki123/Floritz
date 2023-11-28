<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css" />

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="main">
		<h2>내용보기</h2>

		<form action="/Update" method="POST">
			<div class="mb-3">
				<label for="formBno" class="form-label"><b
					style="color: red"></b>글번호</label>
			   <input type="text" class="form-control"
					readonly name="bno" id="formBno" value="${ vo.bno }">
			</div>
			<div class="mb-3">
				<label for="formTitle" class="form-label"><b
					style="color: red"></b>제목</label>
				 <input type="text" class="form-control"
					name="title" id="formTitle" value="${ vo.title }">
			</div>
			<div class="mb-3">
				<label for="formWriter" class="form-label">글쓴이</label>
				<input type="text" class="form-control"
					readonly  id="formWriter" value="${ vo.writer }">
			</div>
			<div class="mb-3">
				<label for="formRegdate" class="form-label">날짜</label>
				<input type="text" class="form-control"
					readonly id="formRegdate" value="${ vo.regdate }">
			</div>
			<div class="mb-3">
				<label for="formHit" class="form-label">조회수</label>
				<input type="text" class="form-control"
					readonly  id="formHit" value="${ vo.hit }">
			</div>
			<div class="mb-3">
				<label for="formContent" class="form-label">내용</label>
				<textarea class="form-control" id="formContent" name="content"
					rows="5">${ vo.content }</textarea>
			</div>
			<div class="mb-3">
				<input type="submit" class="btn btn-dark" id="formSubmit" value="수정하기">
				<input type="button" class="btn btn-dark" id="formHome" value="Home">
			</div>

		</form>
	</div>
	<!-- div main end -->

	<script>
	 var  isChanged = false;
	 
	 const titleEl      = document.querySelector('#formTitle');
	 titleEl.onchange   = () => { isChanged=true; }
	 const contentEl    = document.querySelector('#formContent');
	 contentEl.onchange = () => { isChanged=true; }
	
	 const formEl = document.querySelector('form')
	 formEl.addEventListener('submit', ( e ) => {      // arrow function
		 // 필수입력체크 전송여부판단
		 alert(isChanged)
		 if( isChanged ) {
			 alert('수정ㅇㅋ')
		 } else {			 
			 e.preventDefault();
		 }
	 })
	 
	 const homeEl =  document.querySelector('#formHome')
	 homeEl.onclick = function() {
		 location.href = "/";
	 }
    </script>

</body>
</html>






























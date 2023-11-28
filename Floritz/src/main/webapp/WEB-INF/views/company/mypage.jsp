<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Business My Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/static/css/mypage.css">
<style>
</style>
</head>
<body>
	<div id="sidebar">
		<jsp:include page="/WEB-INF/resources/header.jsp" />
		<jsp:include page="/WEB-INF/resources/sideLeft.jsp" />
	</div>

	<div class="container mt-5">
		<h1 class="text-center">내 사업 정보</h1>
		<c:if test="${not empty message}">
			<div class="alert alert-success" role="alert">${message}</div>
		</c:if>
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<c:if test="${sessionScope.company != null}">
					<form method="post" class="form">
						<div class="form-group">
							<label for="id">사업자 ID</label> <input type="text"
								class="form-control" id="id" name="id" value="${company.id}"
								readonly>
						</div>
						<div class="form-group">
							<label for="name">상호명</label> <input type="text"
								class="form-control" id="name" name="name"
								value="${company.companyName}" readonly>
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email" name="email"
								value="${company.email}" readonly>
						</div>
						<div class="form-group">
							<label for="companyNumber">사업자 등록번호</label> <input type="text"
								class="form-control" id="companyNumber" name="companyNumber"
								value="${company.companyNumber}" readonly>
						</div>
						<div class="form-group">
							<label for="companyAddress">사업장 주소</label> <input type="text"
								class="form-control" id="companyAddress" name="companyAddress"
								value="${company.companyAddress}" readonly>
						</div>
						<div class="form-group">
							<label for="phone">사업장 전화번호</label> <input type="text"
								class="form-control" id="phone" name="phone"
								value="${company.phone}" readonly>
						</div>
						<!-- 사업자 추가 정보 -->
						<div class="form-group">
							<label for="exteriorImage">외관 이미지</label> <img id="exteriorImage"
								name="exteriorImage" src="${company.exteriorImagePath}"
								alt="외관 이미지" style="max-width: 100%;">
						</div>
						<div class="form-group">
							<label for="interiorImage">내관 이미지</label> <img id="interiorImage"
								name="interiorImage" src="${company.interiorImagePath}"
								alt="내관 이미지" style="max-width: 100%;">
						</div>
						<div class="form-group">
							<label for="description">사업장 설명</label>
							<textarea class="form-control" id="description"
								name="description" readonly>${company.description}</textarea>
						</div>
						<div class="form-group">
							<label for="closedDays">휴무일</label> <input type="text"
								class="form-control" id="closedDays" name="closedDays"
								value="${company.closedDays}" readonly>
						</div>
						<div class="form-group">
							<label for="breakTime">브레이크 타임</label> <input type="text"
								class="form-control" id="breakTime" name="breakTime"
								value="${company.breakTime}" readonly>
						</div>

						<a href="/EditCompany" class="btn btn-primary">프로필 수정 및 추가</a>
					</form>
				</c:if>
				<c:if test="${sessionScope.company == null}">
					<p>로그인이 필요합니다.</p>
					<a href="/Login" class="btn btn-primary">로그인</a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>

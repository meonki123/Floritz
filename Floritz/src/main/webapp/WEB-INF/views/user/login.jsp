<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 여기에 필요한 CSS 혹은 JS 파일을 추가하세요 -->
<link rel="stylesheet" href="static/css/login.css" />
<style>
    .error-message {
        color: red;
    }
</style>
</head>
<body>
	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-dark text-white" style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">

							<div class="mb-md-5 mt-md-4 pb-5">
								<h2 class="fw-bold mb-2 text-uppercase">로그인</h2>
								<p class="text-white-50 mb-5">아이디와 비밀번호를 입력해주세요</p>

								<!-- 개인 / 사업자 가입 탭 -->
								<ul class="nav nav-tabs mb-3" id="joinTab" role="tablist">
									<li class="nav-item">
										<a class="nav-link active" id="personal-tab" data-bs-toggle="tab" href="#personal" role="tab" aria-controls="personal" aria-selected="true">개인</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="business-tab" data-bs-toggle="tab" href="#business" role="tab" aria-controls="business" aria-selected="false">사업자</a>
									</li>
								</ul>

								<!-- 개인 로그인 폼 -->
								<div class="tab-content">
									<div class="tab-pane fade show active" id="personal" role="tabpanel" aria-labelledby="personal-tab">
										<form id="personalForm" action="/userLogin" method="post">
											<div class="form-outline form-white mb-4">
												<input type="text" id="id" class="form-control form-control-lg" name="id" placeholder="아이디" />
												<label class="form-label" for="userid">아이디</label>
											</div>

											<div class="form-outline form-white mb-4">
												<input type="password" id="typePasswordX" class="form-control form-control-lg" name="password" placeholder="*****" />
												<label class="form-label" for="typePasswordX">비밀번호</label>
											</div>

											<p class="small mb-5 pb-lg-2">
												<a class="text-white-50" href="#!">비밀번호를 잊으셨나요?</a>
											</p>
											<c:if test="${not empty message}">
									            <div class="error-message">${message}</div>
									        </c:if>
											<button class="btn btn-outline-light btn-lg px-5" type="submit">로그인</button>
										</form>
									</div>

									<!-- 사업자 로그인 폼 -->
									<div class="tab-pane fade" id="business" role="tabpanel" aria-labelledby="business-tab">
										<form id="businessForm" action="/companyLogin" method="post">
											<div class="form-outline form-white mb-4">
												<input type="text" id="id" class="form-control form-control-lg" name="id" placeholder="아이디" />
												<label class="form-label" for="companyid">사업자 아이디</label>
											</div>

											<div class="form-outline form-white mb-4">
												<input type="password" id="companyPassword" class="form-control form-control-lg" name="companyPassword" placeholder="*****" />
												<label class="form-label" for="companyPassword">비밀번호</label>
											</div>

											<p class="small mb-5 pb-lg-2">
												<a class="text-white-50" href="#!">비밀번호를 잊으셨나요?</a>
											</p>
									        <c:if test="${not empty message}">
									            <div class="error-message">${message}</div>
									        </c:if>
											<button class="btn btn-outline-light btn-lg px-5" type="submit">로그인</button>
										</form>
									</div>
								</div>

								<div class="d-flex justify-content-center text-center mt-4 pt-1">
									<a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
									<a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
									<a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
								</div>

								<div>
									<p class="mb-0">계정이 없으신가요? <a href="/Join" class="text-white-50 fw-bold">가입하기</a></p>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<script>
$(document).ready(function() { 
	// 사업자 회원가입 탭 클릭 이벤트 핸들러 
	$('#business-tab').on('click', function(e) { 
		e.preventDefault(); 
		$(this).tab('show'); 
	}); 
});

$(document).ready(function() {
    // 개인 회원가입 탭 클릭 이벤트 핸들러
    $('#personal-tab').on('click', function(e) {
       e.preventDefault();
       $(this).tab('show');
    });
 });
</script>
</body>
</html>

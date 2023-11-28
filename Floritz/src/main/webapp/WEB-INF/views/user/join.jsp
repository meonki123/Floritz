<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- join.css 파일 연결 -->
<link rel="stylesheet" href="static/css/join.css">
<style>
</style>
</head>
<body class="gradient-custom">
	<div class="container py-5 h-100">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5">
				<div class="card bg-dark text-white" style="border-radius: 1rem;">
					<div class="card-body p-5 text-center">
						<div class="mb-md-4 mt-md-3 pb-5">
							<h2 class="fw-bold mb-2 text-uppercase">회원가입</h2>
							<p class="text-white-50 mb-5">아래의 정보를 입력해주세요</p>

							<!-- 개인 / 사업자 가입 탭 -->
							<ul class="nav nav-tabs mb-3" id="joinTab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="personal-tab" data-bs-toggle="tab" href="#personal"
									role="tab" aria-controls="personal" aria-selected="true">개인</a>
								</li>
								<li class="nav-item"><a class="nav-link" id="business-tab"
									data-bs-toggle="tab" href="#business" role="tab"
									aria-controls="business" aria-selected="false">사업자</a></li>
							</ul>

							<!-- 개인 회원가입 폼 -->
							<div class="tab-content" id="joinTabContent">
								<div class="tab-pane fade show active" id="personal"
									role="tabpanel" aria-labelledby="personal-tab">
									<form id="personalForm" action="/userInsert" method="post">
										<div class="form-outline form-white mb-4">
											<input type="text" id="id"
												class="form-control form-control-lg" name="id"
												placeholder="아이디" required /> <label class="form-label"
												for="userid">아이디</label>
										</div>
										<div class="form-outline form-white mb-4">
											<input type="password" id="password"
												class="form-control form-control-lg" name="password"
												placeholder="*****" required /> <label class="form-label"
												for="password">비밀번호</label>
										</div>
										<div class="form-outline form-white mb-4">
											<input type="password" id="passwordConfirm"
												class="form-control form-control-lg" placeholder="*****"
												name="passwordConfirm" required /> <label
												class="form-label" for="passwordConfirm">비밀번호 확인</label>
										</div>
										<div class="form-outline form-white mb-4">
											<input type="text" id="name"
												class="form-control form-control-lg" placeholder="성명"
												name="name" required /> <label class="form-label"
												for="name">성명</label>
										</div>
										<div class="form-outline form-white mb-4" id="mail_input"
				                           name="mail_input">
				                           <input type="text" name="mail" id="mail" placeholder="이메일 입력"
				                              class="form-control form-control-lg">
				                           <button type="button" id="sendBtn" name="sendBtn"
				                              onclick="sendNumber()">인증번호 발송</button>
				                        </div>
				                        <div class="form-outline form-white mb-4" id="mail_number"
				                           name="mail_number" style="display: none">
				                           <input type="text" name="number" id="number"
				                              placeholder="인증번호 입력" class="form-control form-control-lg">
				                           <button type="button" name="confirmBtn" id="confirmBtn"
				                              onclick="confirmNumber()">이메일 인증</button>
				                        </div>
<!-- 										<div class="form-outline form-white mb-4">
											<input type="email" id="email"
												class="form-control form-control-lg"
												placeholder="이메일을 입력하세요" name="email" required /> <label
												class="form-label" for="email">이메일</label>
										</div> -->
										<div class="form-outline form-white mb-4">
											<input type="text" id="phone"
												class="form-control form-control-lg"
												placeholder="010-1234-5678" name="phone" required /> <label
												class="form-label" for="phone">연락처</label>
										</div>
										<div class="form-outline form-white mb-4">
											<input type="checkbox" id="agreeTerms" name="agreeTerms"
												required /> <label class="form-label">서비스 이용 <span
												id="viewTerms">약관</span>에 동의합니다.
											</label>
										</div>

										<div id="termsContent" style="display: none;">
											<h3>제 1 조 (서비스 이용약관)</h3>
											<p>본 서비스는 사용자가 본 사이트에 접속함으로써 이용약관에 동의한 것으로 간주합니다. 사용자는 본
												사이트의 서비스를 이용함에 있어서 이 약관을 준수해야 합니다.</p>
											<h3>제 2 조 (개인정보 처리방침)</h3>
											<p>본 사이트는 사용자의 개인정보를 중요시하며, 이에 대한 보호와 관리에 최선을 다합니다. 사용자의
												개인정보는 서비스 제공을 위한 목적 외에는 사용되지 않습니다.</p>
											<h3>제 3 조 (위치정보 이용약관)</h3>
											<p>본 사이트의 일부 서비스는 사용자의 위치 정보를 필요로 합니다. 사용자는 위치 정보 제공에
												동의함으로써 해당 서비스를 이용할 수 있습니다. 위치 정보는 서비스 제공 외의 다른 목적으로는 사용되지
												않습니다.</p>
											<h3>제 4 조 (프로모션 이용약관)</h3>
											<p>본 사이트는 사용자에게 다양한 프로모션을 제공합니다. 프로모션 참여 시 해당 프로모션의 이용약관을
												따라야 합니다. 프로모션의 내용과 조건은 사전 공지 없이 변경될 수 있습니다.</p>
											<button type="button" id="closeTerms">X</button>
										</div>

										<button type="submit"
											class="btn btn-outline-light btn-lg px-5">가입하기</button>
									</form>
								</div>

								<!-- 사업자 회원가입 폼 -->
								<div class="tab-pane fade" id="business" role="tabpanel"
									aria-labelledby="business-tab">
									<form id="businessForm" action="/companyInsert" method="post">
										<div class="form-outline form-white mb-4">
											<input type="text" id="id"
												class="form-control form-control-lg" placeholder="아이디"
												name="id" required /> <label class="form-label"
												for="id">아이디</label>
										</div>
										<div class="form-outline form-white mb-4">
											<input type="password" id="companyPassword"
												class="form-control form-control-lg" placeholder="*****"
												name="companyPassword" required /> <label
												class="form-label" for="companyPassword">비밀번호</label>
										</div>
										<div class="form-outline form-white mb-4">
											<input type="password" id="passwordConfirm1"
												class="form-control form-control-lg" placeholder="*****"
												name="passwordConfirm1" required /> <label
												class="form-label" for="passwordConfirm1">비밀번호 확인</label>
										</div>
										<div class="form-outline form-white mb-4">
											<input type="text" id="companyName"
												class="form-control form-control-lg" placeholder="상호명"
												name="companyName" required /> <label class="form-label"
												for="companyName">상호명</label>
										</div>
										<div class="form-outline form-white mb-4">
											<input type="text" id="companyNumber"
												class="form-control form-control-lg" placeholder="사업자번호"
												name="companyNumber" required /> <label class="form-label"
												for="companyNumber">사업자번호</label>
										</div>
										<div class="form-outline form-white mb-4">
											<input type="text" id="companyAddress"
												class="form-control form-control-lg" placeholder="사업장 주소"
												name="companyAddress" required /> <label class="form-label"
												for="companyAddress">사업장 주소</label>
										</div>
										<div class="form-outline form-white mb-4">
											<input type="text" id="email"
												class="form-control form-control-lg" placeholder="이메일"
												name="email" required /> <label class="form-label"
												for="email">이메일</label>
										</div>
										<div class="form-outline form-white mb-4">
											<input type="text" id="phone"
												class="form-control form-control-lg" placeholder="사업장 전화번호"
												name="phone" required /> <label class="form-label"
												for="phone">사업장 전화번호</label>
										</div>
										<div class="form-outline form-white mb-4">
											<input type="checkbox" id="agreeTermsBusiness"
												name="agreeTermsBusiness" required /> <label
												class="form-label">서비스 이용 <span
												id="viewTermsBusiness" class="viewTermsStyle">약관</span>에
												동의합니다.
											</label>
										</div>
										<div id="termsContentBusiness" style="display: none;">
											<!-- 사업자 가입 약관 내용 -->
											<h3>제 1 조 (서비스 이용약관)</h3>
											<p>본 서비스는 사용자가 본 사이트에 접속함으로써 이용약관에 동의한 것으로 간주합니다. 사용자는 본
												사이트의 서비스를 이용함에 있어서 이 약관을 준수해야 합니다.</p>
											<h3>제 2 조 (개인정보 처리방침)</h3>
											<p>본 사이트는 사용자의 개인정보를 중요시하며, 이에 대한 보호와 관리에 최선을 다합니다. 사용자의
												개인정보는 서비스 제공을 위한 목적 외에는 사용되지 않습니다.</p>
											<h3>제 3 조 (위치정보 이용약관)</h3>
											<p>본 사이트의 일부 서비스는 사용자의 위치 정보를 필요로 합니다. 사용자는 위치 정보 제공에
												동의함으로써 해당 서비스를 이용할 수 있습니다. 위치 정보는 서비스 제공 외의 다른 목적으로는 사용되지
												않습니다.</p>
											<h3>제 4 조 (프로모션 이용약관)</h3>
											<p>본 사이트는 사용자에게 다양한 프로모션을 제공합니다. 프로모션 참여 시 해당 프로모션의 이용약관을
												따라야 합니다. 프로모션의 내용과 조건은 사전 공지 없이 변경될 수 있습니다.</p>
											<button type="button" id="closeTermsBusiness"
												class="closeTermsStyle">X</button>
										</div>
										<button type="submit"
											class="btn btn-outline-light btn-lg px-5">가입하기</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	$(document).ready(function() {
		// 사업자 가입 '약관' 텍스트 클릭 이벤트 핸들러
		$('#viewTermsBusiness').on('click', function(e) {
			e.preventDefault();
			$('#termsContentBusiness').toggle();
		});

		// 사업자 가입 약관 닫기 버튼 클릭 이벤트 핸들러
		$('#closeTermsBusiness').on('click', function() {
			$('#termsContentBusiness').hide();
		});

	});
 
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

$(document).ready(
		function() {
			// 개인 가입자 비밀번호 일치 확인
			$('#passwordConfirm').on(
					'input',
					function() {
						var password = $('#password').val();
						var passwordConfirm = $(this).val();
						if (password === passwordConfirm) {
							$('label[for="passwordConfirm"]').text(
									'비밀번호가 일치합니다.').css('color',
									'white');
						} else {
							$('label[for="passwordConfirm"]').text(
									'비밀번호가 일치하지 않습니다.').css('color',
									'red');
						}
					});

			// 사업자 가입자 비밀번호 일치 확인
			$('#passwordConfirm1').on(
					'input',
					function() {
						var password = $('#companyPassword').val();
						var passwordConfirm = $(this).val();
						if (password === passwordConfirm) {
							$('label[for="passwordConfirm1"]').text(
									'비밀번호가 일치합니다.').css('color',
									'white');
						} else {
							$('label[for="passwordConfirm1"]').text(
									'비밀번호가 일치하지 않습니다.').css('color',
									'red');
						}
					});

			// 회원가입 폼 제출
			$('#personalForm').on('submit', function(e) {
				e.preventDefault();
				var formData = new FormData(this);
				$.ajax({
					url : $(this).attr('action'),
					type : 'post',
					data : formData,
					processData : false,
					contentType : false,
					success : function(data) {
						alert('개인회원 가입에 성공했습니다.');
						window.location.href = '/Login';
					},
					error : function() {
						alert('개인회원 가입에 실패했습니다.');
					}
				});
			});

			// 회원가입 폼 제출
			$('#businessForm').on('submit', function(e) {
				e.preventDefault();
				var formData = new FormData(this);
				$.ajax({
					url : $(this).attr('action'),
					type : 'post',
					data : formData,
					processData : false,
					contentType : false,
					success : function(data) {
						alert('사업자회원 가입에 성공했습니다.');
						window.location.href = '/Login';
					},
					error : function() {
						alert('사업자회원 가입에 실패했습니다.');
					}
				});
			});
		});
</script>
</body>
</html>


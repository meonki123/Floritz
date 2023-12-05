<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Floritz 예약하기</title>
<link rel="stylesheet" href="static/css/main.css" />
<style>

.count-and-fee{
    display: flex;
    align-items: center;
    flex-direction: column;
    margin-bottom: 20px;
}

.count-and-fee button, .fee-and-reservation button {
    border: thin;
    background: #ddd;
    cursor: pointer;
}


.fee-and-reservation input {
    border: none;
    border-radius: 0.25rem;
    padding: 0.375rem 0.75rem;
    text-align: right;
    font-weight: bold;
    color: red;
}

/* 기존 스타일 코드 */
.fee-and-reservation {
    margin-top: 50px;
    display: flex;
    align-items: center;
}

.fee-and-reservation label {
    position: relative;
    top: 3px;
    margin-right: 10px;
    font-weight: bold;
    font-size: 20px;
}

.count-and-fee label, .fee-and-reservation label {
    width: 100%;
    margin-bottom: 0.5rem;
}

#reservation-fee {
	width: 471px;
	font-size: 23px;
}

.count-and-fee input {
    border: 1px solid #ced4da;
    padding: 0.375rem 0.75rem;
    width: 180px;
    text-align: center;
}

#count {
	width: 410px;
    border: none; /* 모든 테두리를 제거 */
    border-top: 1px solid #ced4da; /* 위쪽 테두리를 추가 */
    border-bottom: 1px solid #ced4da; /* 아래쪽 테두리를 추가 */
	margin-left: 0; /* 왼쪽 여백을 제거 */
    margin-right: 0; /* 오른쪽 여백을 제거 */
}

.count-and-fee button {
    height: 38px;
    border-top: 1px solid #ced4da; /* 위쪽 테두리를 추가 */
    border-bottom: 1px solid #ced4da; /* 아래쪽 테두리를 추가 */
    justify-content: space-between; 
    width: 30px;
}

#count-and-fee-left{
	border-top-left-radius: 0.25rem;
	border-bottom-left-radius: 0.25rem;
}
#count-and-fee-ri{
	border-top-right-radius: 0.25rem;
	border-bottom-right-radius: 0.25rem;
}

.container {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

.left, .flow {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    text-align: left;
    flex: 1 0 480px;
    box-sizing: border-box;
}

.flow {
    align-items: flex-start;
}

.payment-button {
    border: none;
    background-color: transparent;
    margin: 10px;
}

/* 첫 번째 이미지 크기 변경 */
.button-container button:first-child img {
  width: 120px; /* 원하는 가로 크기로 조정 */
  height: auto; /* 세로 크기는 가로 크기에 맞추어 자동 조정 */
}

/* 두 번째 이미지 크기 변경 */
.button-container button:nth-child(2) img {
  width: 85px; /* 원하는 가로 크기로 조정 */
  height: auto; /* 세로 크기는 가로 크기에 맞추어 자동 조정 */
}

.payment-button + .payment-button {
    margin-left: 0;
}

.button-container {
    display: flex;
    justify-content: center;
    gap: 20px;
}

input[type="text"], input[type="date"] {
    width: 200%;
    max-width: 500px;
}

input[type="date"] {
        width: 278%;
    max-width: 470px;
    box-sizing: border-box !important;
}

@media (max-width: 768px) {
    .container {
        flex-direction: column;
    }
}

.box__inner {
	border: thick;
	margin-top: 20px;
	border: 1px solid #ced4da;
	padding-top: 20px;
    padding-right: 250px;
    border-radius: 0.25rem;
}

.list__term {
    list-style-type: none;  /* 리스트의 점을 없애는 속성 */
    
}

.button__term {
	border: none;
	background-color: transparent; 
	color: #808080;
	margin-left: 10px;
}

.text__deco {
	color: blue;
	margin-right: 5px;
	margin-left: 5px;
	font-style: normal;
	
}

</style>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init(""); 
        
        function requestPay() {
            IMP.request_pay({
            	pg : 'tosspay',
                pay_method: "card",
                merchant_uid: "ORD20180131-0000012",   // 주문번호
                name: "노르웨이 회전 의자",
                amount: 100,                         // 숫자 타입
                buyer_email: "gildong@gmail.com",
                buyer_name: "홍길동",
                buyer_tel: "010-4242-4242",
                buyer_addr: "서울특별시 강남구 신사동",
                buyer_postcode: "01181"
            }, function (rsp) { // callback
                if (rsp.success) {
                    $.ajax({
                        type: 'POST',
                        url: '/verify/' + rsp.imp_uid
                    }).done(function(data) {
                        if (rsp.paid_amount === data.response.amount) {
                            alert("결제 성공");
                        } else {
                            alert("결제 실패");
                        }
                    });
                } else {
                    alert("결제에 실패하였습니다. 오류 메시지: " + rsp.error_msg);
                }
            });
        }
    </script>

<script>
function formatTime(input) {
    var time = input.value;
    if (time.length === 4) {
        var formatted = time.slice(0, 2) + ":" + time.slice(2);
        input.value = formatted;
    }
}

function isNumber(event) {
    var keyCode = event.keyCode;
    if (keyCode < 48 || keyCode > 57) {
        return false;
    }
    return true;
}
</script>
<script>
function validateName(input) {
    var name = input.value;
    var regex = /[ㄱ-ㅎㅏ-ㅣ]/;
    
    if (regex.test(name)) {
        alert("성함을 확인해주세요.");
        input.value = "";
        input.focus();
    }
}
</script>
<script>
function increaseCountAndFee() {
    var countInput = document.getElementById('count');
    var feeInput = document.getElementById('reservation-fee');
    var currentCount = Number(countInput.value);
    var currentFee = Number(feeInput.value.replace(/,/g, ''));
    countInput.value = currentCount + 1;
    feeInput.value = (currentFee + 10000).toLocaleString('en-US');
}

function decreaseCountAndFee() {
    var countInput = document.getElementById('count');
    var feeInput = document.getElementById('reservation-fee');
    var currentCount = Number(countInput.value);
    var currentFee = Number(feeInput.value.replace(/,/g, ''));
    if (currentCount > 0) {
        countInput.value = currentCount - 1;
        feeInput.value = (currentFee - 10000).toLocaleString('en-US');
    }
}

function adjustFee() {
    var countInput = document.getElementById('count');
    var feeInput = document.getElementById('reservation-fee');
    var currentCount = Number(countInput.value);
    feeInput.value = (currentCount * 10000).toLocaleString('en-US');
}
</script>
<script>
function formatPhoneNumber(input) {
    var number = input.value.replace(/[^0-9]/g, '');
    var phone = '';
    
    if (number.length < 4) {
        phone = number;
    } else if (number.length < 7) {
        phone += number.substr(0, 3);
        phone += '-';
        phone += number.substr(3);
    } else {
        phone += number.substr(0, 3);
        phone += '-';
        phone += number.substr(3, 4);
        phone += '-';
        phone += number.substr(7);
    }
    return phone;
}

function handleInput(event) {
    var input = event.target;
    var formatted = formatPhoneNumber(input);
    if (formatted !== input.value) {
        event.preventDefault();
        input.value = formatted;
    }
    if (input.value.length > 13) {
        input.value = input.value.slice(0, 13);
    }
}
</script>

</head>
<body>

	<jsp:include page="/WEB-INF/resources/header.jsp" />
	<div class="container">
		<form class="left">
		    <div class="mb-3">
			  <label for="date" class="form-label"> 예약 업체</label>
			  <input type="text" class="form-control" id="company" name="company" value="상호명" readonly style="font-weight: bold;">
			</div>
		    <div class="mb-3">
			  <label for="date" class="form-label"><b style="color:red">*</b>예약 날짜</label>
			  <input type="date" class="form-control" id="date" name="date">
			</div>
			<div class="mb-3">
			    <label for="time" class="form-label"><b style="color:red">*</b>예약 시간</label>
			    <input type="text" class="form-control" id="time" name="time" oninput="formatTime(this)" placeholder="00:00"  maxlength="4" >
			</div>
			<div class="mb-3">
			    <label for="text" class="form-label"><b style="color:red">*</b>예약자명</label>
			    <input type="text" class="form-control" id="name" name="name" onblur="validateName(this)" placeholder="성함을 적어주세요." >
			</div>
			<div class="mb-3">
			    <label for="text" class="form-label"><b style="color:red">*</b>연락처</label>
			    <input type="text" class="form-control" id="fone" name="fone" onkeyup="handleInput(event);" placeholder="연락처를 적어주세요." >
			</div>
			<div class="count-and-fee">
			    <label for="count"><b style="color:red">*</b>인원 수</label>
			    <div style="display: flex;">
			        <button type="button" id="count-and-fee-left" onclick="decreaseCountAndFee()">-</button>
			        <input id="count" type="number" value="0" onkeypress="return isNumberKey(event)" onchange="adjustFee()">
			        <button type="button" id="count-and-fee-ri" onclick="increaseCountAndFee()">+</button>
			    </div>
			</div>
			<div class="fee-and-reservation">
			    <label for="reservation-fee">예약금</label>
			    <input id="reservation-fee" type="text" value="0" readonly>
			    <label for="reservation-fee">원</label>
			</div>

		</form>
	
		<!-- 2열 -->
		<div class="flow">
			<div class="mb-3">
			    <label for="text" class="form-label">공지사항</label>
			    <textarea rows="10" cols="55" class="form-control" id="" name="" onkeyup="" readonly>
			     업체 공지사항이 들어갈 예정입니다.
			    </textarea>
			</div>
		
			<p style="border-bottom: 1px solid #333;">결제수단</p>
			<hr style="color: black;">
			<div class="button-container">
				<button class="payment-button" onclick="requestPay()">
				<img src="static/img/logo-toss-pay-blue.png" alt="결제하기">
				<span class="apitext">토스페이</span>
				</button>
				
				<button class="payment-button" onclick="">
				<img src="static/img/payment_icon_yellow_small.png" alt="결제하기">
				<span class="apitext">카카오페이</span>
				</button>
			</div>
			<!--  <p style="border-bottom: 1px solid #333;">일반결제</p> -->
			
			
			<div class="surac">
				<div class="box__inner">
					<ul class="list__term">
						<li class="list-item list__term-allagree"><div
								class="box__custom-form">
								<input type="checkbox" id="agreeInfoAllTop" name="agreeInfoAll"
									class="input__checkbox" data-montelena-acode="200007079"
									data-montelena-is_select="true"><label
									for="agreeInfoAllTop" class="text__label"><em
									class="text__deco">전체동의</em><span class="text__explain">서비스
										약관에 동의합니다.</span></label>
							</div></li>
					</ul>
					<ul class="list__term">
						<li class="list-item sprite__checkout--after list__term-essential"><div
								class="box__custom-form">
								<input type="checkbox" id="xo_id_agreements_over_14_years_old"
									name="agreeInfo" class="input__checkbox"
									data-montelena-is_select="true"
									data-montelena-agreement_type="Over14YearsOld"><label
									for="xo_id_agreements_over_14_years_old" class="text__label"><em
									class="text__deco">필수</em> 만 14세 이상입니다.</label>
							</div></li>
						<li
							class="list-item sprite__checkout--after list__term-essential js-active"><div
								class="box__custom-form">
								<input type="checkbox"
									id="xo_id_agreements_collecting_personal_info" name="agreeInfo"
									class="input__checkbox" data-montelena-acode="200007080"
									data-montelena-is_select="true"
									data-montelena-agreement_type="CollectingPersonalInfo"><label
									for="xo_id_agreements_collecting_personal_info" class="text__label"><em
									class="text__deco">필수</em> 개인정보 수집 및 이용동의</label>
							</div>
							<button class="button__term button__detail sprite__checkout--after"
								aria-expanded="true">자세히</button>
							<div class="box__detail-term">
								<p class="text__detail-term">만 14세 이상만 구매가능합니다.</p>
								<ul class="list__detail-term">
									<li class="list-item">목적: 주문, 결제 및 배송서비스</li>
									<li class="list-item">항목: 구매자정보(이름, 연락처, 메일주소), 주문비밀번호, 상품
										구매/취소/반품/교환/환불 정보, 수령인정보(이름, 주소, 연락처), 결제번호, 송장정보, 은행계좌정보,
										휴대폰번호(휴대폰결제시)</li>
									<li class="list-item">보유기간: <strong class="text__highlight">관련
											법률에 따라 5년간 보존</strong></li>
								</ul>
								<ul class="list__detail-term">
									<li class="list-item">목적: 본인여부확인</li>
									<li class="list-item">항목: 이름, 주문비밀번호, 휴대폰번호, 이메일주소</li>
									<li class="list-item">보유기간: <strong class="text__highlight">법령에
											따른 보존기간</strong></li>
								</ul>
								<ul class="list__detail-term">
									<li class="list-item">목적: 계약이행 및 약관변경 등의 고지를 위한 연락, 본인의사 확인 및
										민원 등의 고객불만처리</li>
									<li class="list-item">항목: 이름, 휴대폰번호, 이메일주소, 전화번호, 주소</li>
									<li class="list-item">보유기간: <strong class="text__highlight">법령에
											따른 보존기간</strong></li>
								</ul>
								<ul class="list__detail-term">
									<li class="list-item">목적: 부정이용방지, 비인가사용방지, 서비스 제공 및 계약의 이행</li>
									<li class="list-item">항목: 방문일시, 서비스 이용 기록 및 기기정보</li>
									<li class="list-item">보유기간: <strong class="text__highlight">법령에
											따른 보존기간</strong></li>
								</ul>
								<ul class="list__detail-term">
									<li class="list-item">목적: 부정거래의 배제 (구매 후 부정거래가 확인된 경우로 한정)</li>
									<li class="list-item">항목: 휴대폰번호, 이메일주소, 전화번호, 부정거래사유</li>
									<li class="list-item">보유기간: <strong class="text__highlight">법령에
											따른 보존기간</strong></li>
								</ul>
								<p class="text__detail-term">이용동의: 주식회사 지마켓은 고객님께서 구매하신 서비스 및
									상품의 원활한 제공을 위해 최소한의 범위 내에서 아래와 같이 개인정보를 수집·이용 합니다. 고객님께서는 수집 및 이용에
									동의하지 않으실 수 있으며 동의하지 않으실 경우, 일부 구매가 제한될 수 있습니다.</p>
							</div></li>
						<li
							class="list-item sprite__checkout--after list__term-essential js-active"><div
								class="box__custom-form">
								<input type="checkbox" id="xo_id_agreements_providing_personal_info"
									name="agreeInfo" class="input__checkbox"
									data-montelena-acode="200007080" data-montelena-is_select="true"
									data-montelena-agreement_type="ProvidingPersonalInfo"><label
									for="xo_id_agreements_providing_personal_info" class="text__label"><em
									class="text__deco">필수</em> 개인정보 제3자 제공동의</label>
							</div>
							<button class="button__term button__detail sprite__checkout--after"
								aria-expanded="true">간단히</button>
							<div class="box__detail-term">
								<p class="text__detail-term">
									제공받는자: <strong class="text__highlight">다원스토어</strong>
								</p>
								<p class="text__detail-term">
									목적: <strong class="text__highlight">판매자와 구매자의 거래의 원활한 진행,
										본인 의사의 확인, 고객 상담 및 불만처리, 상품과 경품배송을 위한 배송지 확인 등</strong>
								</p>
								<p class="text__detail-term">항목: 성명, 연락처, 배송지주소, 이메일주소, 통관고유부호,
									생년월일(선택시)</p>
								<p class="text__detail-term">
									보유기간: <strong class="text__highlight">구매 서비스 종료 후 1개월</strong>
								</p>
								<p class="text__detail-term">이용동의: 주식회사 지마켓은 고객님께서 구매하신 서비스 및
									상품의 원활한 제공을 위해 최소한의 범위 내에서 아래와 같이 개인정보를 수집·이용 합니다. 고객님께서는 수집 및 이용에
									동의하지 않으실 수 있으며 동의하지 않으실 경우, 일부 구매가 제한될 수 있습니다.</p>
							</div></li>
						<li
							class="list-item sprite__checkout--after list__term-essential js-active"><div
								class="box__custom-form">
								<input type="checkbox" id="xo_id_agreements_ebay_buyer"
									name="agreeInfo" class="input__checkbox"
									data-montelena-acode="200007080" data-montelena-is_select="true"
									data-montelena-agreement_type="EbayBuyerAgreement"><label
									for="xo_id_agreements_ebay_buyer" class="text__label"><em
									class="text__deco">필수</em> Floritz 구매회원 약관 동의</label>
							</div>
							<button class="button__term button__detail sprite__checkout--after"
								aria-expanded="true">간단히</button>
							<div class="box__detail-term">
								<p class="text__detail-term">1. 회원에 대한 통지는 회원정보에 기재된 주소 또는
									e-mail 주소에 도달함으로써 통지된 것으로 보며, 정보 수정 / 미수정으로 인한 책임은 회원이 부담함. (제12조)</p>
								<p class="text__detail-term">2. 회원자격이 정지되거나 경매서비스(일반경매, 즉시구매,
									고정가판매 및 공동경매 포함)의 이용 등이 제한될 수 있음. (제15조)</p>
								<p class="text__detail-term">3. 구매자는 물품 수령 후 7일 이내 물품의 반품 또는 교환
									요청 가능. (제 26조 마항)</p>
								<p class="text__detail-term">4. 판매예치금에서 회사에 대한 채무금을 우선 출금 및 구매자의
									정당한 요청에 판매예치금에서 출금하여 구매자에게 환불 가능. (제27조의2)</p>
								<p class="text__detail-term">5. 서비스 제공 대가로 등록서비스이용료, 유료부가서비스이용료,
									판매서비스이용료 등을 부과할 수 있음. (제30조)</p>
								<p class="text__detail-term">6. Floritz은 통신판매중개자로서 회원 상호간의 거래에 관여하지
									않으며 어떠한 보증 및 책임도 부담하지 않음. (제16조, 제31조)</p>
								<a href="http://member2.gmarket.co.kr/TermsPolicy/BuyerTermsPolicy"
									target="_blank" class="sprite__checkout--after link__term-more">전체보기</a>
							</div></li>
						<li
							class="list-item sprite__checkout--after list__term-essential js-active"><div
								class="box__custom-form">
								<input type="checkbox" id="xo_id_agreements_e_trade"
									name="agreeInfo" class="input__checkbox"
									data-montelena-acode="200007080" data-montelena-is_select="true"
									data-montelena-agreement_type="ETradeAgreement"><label
									for="xo_id_agreements_e_trade" class="text__label"><em
									class="text__deco">필수</em> 전자금융거래 약관 동의</label>
							</div>
							<button class="button__term button__detail sprite__checkout--after"
								aria-expanded="true">간단히</button>
							<div class="box__detail-term">
								<p class="text__detail-term">접근매체의 양도∙양수, 대여∙사용위임, 질권설정 기타 담보 제공
									및 이의 알선과 접근매체를 제3자에게 누설∙노출, 방치하는 것은 금지됨. (제17조, 제21조, 제23조)</p>
								<p class="text__detail-term">소비자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한
									사유의 제시 없이 그 공급받은 사실을 통보하지 않는 경우 소비자의 동의 없이 판매자에게 결제대금을 지급할 수 있으며,
									회사가 결제대금을 지급하기 전에 소비자가 그 결제대금을 환급 받을 사유가 발생한 경우 이를 소비자에게 환급함.
									(제19조)</p>
								<p class="text__detail-term">이용자의 선불전자지급수단 잔액이 구매 취소 등의 사유 발생으로
									회사가 이용자로부터 환수해야 하는 환수대상액보다 작을 경우 회사는 당해 이용자의 선불전자지급수단을 마이너스로 처리할 수
									있음. (제27조)</p>
								<a
									href="http://member2.gmarket.co.kr/TermsPolicy/FinanceTermsPolicy"
									target="_blank" class="sprite__checkout--after link__term-more">전체보기</a>
							</div></li>
					</ul>
				</div>
			</div>
		</div>

	</div>

<script>
//"전체동의" 체크박스를 가져옵니다.
var checkAll = document.getElementById('agreeInfoAllTop');

// "agreeInfo"이라는 이름을 가진 모든 체크박스를 가져옵니다.
var checkboxes = document.querySelectorAll('input[name="agreeInfo"]');

// "전체동의" 체크박스를 클릭했을 때의 이벤트 핸들러를 추가합니다.
checkAll.addEventListener('click', function() {
    for (var checkbox of checkboxes) {
        checkbox.checked = this.checked;
    }
});

// 각 개별 체크박스를 클릭했을 때의 이벤트 핸들러를 추가합니다.
for (var checkbox of checkboxes) {
    checkbox.addEventListener('click', function() {
        checkAll.checked = Array.from(checkboxes).every(x => x.checked);
    });
}
</script>
	<script>
//모든 버튼과 세부사항에 대한 참조 가져오기
var buttons = document.querySelectorAll('.button__term');
var details = document.querySelectorAll('.box__detail-term');

// 처음에는 모든 세부사항을 숨김
details.forEach(function(detail) {
    detail.style.display = 'none';
});

// 각 버튼에 클릭 이벤트 리스너 추가
buttons.forEach(function(button, index) {
    // 처음에는 모든 버튼의 텍스트를 '자세히'로 설정
    button.textContent = '자세히';

    button.addEventListener('click', function() {
        // 현재 버튼의 세부사항 토글
        var detail = details[index];
        detail.style.display = detail.style.display === 'none' ? 'block' : 'none';

        // 현재 텍스트를 가져오기
        var currentText = button.textContent || button.innerText;

        // 텍스트에 따라 새로운 텍스트 설정
        var newText = currentText === '간단히' ? '자세히' : '간단히';

        // 버튼의 텍스트 변경
        button.textContent = newText;
    });
});
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>이메일 인증 구현하기</title>

<style>

    #mail_input, #mail_number {
      text-align: center;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    input {
      padding: 10px;
      margin: 5px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    button {
      padding: 10px 20px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #0056b3;
    }
  </style>

<link rel="shortcut icon" href="/img/head.png">
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="/css/main.css" />
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>

</head>
<jsp:include page="/WEB-INF/resources/header.jsp" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function sendNumber() {
		$("#mail_number").css("display", "block");
		$.ajax({
			url : "/mail",
			type : "post",
			dataType : "json",
			data : {
				"mail" : $("#mail").val()
			},
			success : function(data) {
				alert("인증번호 발송");
				$("#Confirm").attr("value", data);
			}
		});
	}

	function confirmNumber() {
		var number1 = $("#number").val();
		var number2 = $("#Confirm").val();

		if (number1 == number2) {
			alert("인증되었습니다.");
		} else {
			alert("번호가 다릅니다.");
		}
	}
</script>
<body>
	<div id="mail_input" name="mail_input">
		<input type="text" name="mail" id="mail" placeholder="이메일 입력">
		<button type="button" id="sendBtn" name="sendBtn"
			onclick="sendNumber()">인증번호</button>
	</div>
	<br>
	<div id="mail_number" name="mail_number" style="display: none">
		<input type="text" name="number" id="number" placeholder="인증번호 입력">
		<button type="button" name="confirmBtn" id="confirmBtn"
			onclick="confirmNumber()">이메일 인증</button>
	</div>
	<br>
	<input type="text" id="Confirm" name="Confirm" style="display: none"
		value="">
</body>
</html>




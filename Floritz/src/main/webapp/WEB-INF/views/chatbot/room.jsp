<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Chatbot</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="static/css/styles.css" rel="stylesheet" />
    <link href="static/css/chatbot.css" rel="stylesheet" />
    <style>

	  body {
		font-family: Arial, sans-serif;
		background-color: #f4f4f4;
		}
		.chat-container{
		padding-top: 50px;
	    width: 700px;
	    height: 1000px; 
	    margin: 0 auto;
		}

		.roomContainer{
			width: 100%;
		    height: 700px; /* 최대 높이 설정 */
		    border: 1px solid #ddd;
		    padding: 10px;
		    background-color: #fff;
		    margin-bottom: 10px;
				}
		.roomList{
		width: 100%;
			border: none;
		}
		.roomList th{
			border: 1px solid #ddd;
			background-color: #A0A0A0;
		}
		.roomList td{
			border: 1px solid #ddd;
			text-align: left;
			
		}
		.roomList .num{
			width: 75px;
			text-align: center;
		}
		.roomList .room{
			width: 350px;
		}
		.roomList .go{
			width: 71px;
			text-align: center;
			background-color: #A0A0A0;
		}
		.Btngo {
			border: 1px solid #A0A0A0;
			background-color: #A0A0A0;
		}
		.Btngo:hover {
			color: white;
		}
		input[type="text"] {
		    
		    margin-left: 20px;
		    width: 520px;
		    padding: 8px;
		}
		#createRoom {
			margin-left: 10px;
		    padding: 8px 15px;
		    background-color: #5AAF4B;
		    color: #fff;
		    border: none;
		    cursor: pointer;
		}

		
.reBtn { background-color: #ddd; 
    	color: #000; 
    	border: none;
    	float: left;
	    padding: 15px;
	    border-radius: 15px;
	    width: 100%;
	    text-decoration: none;
	    }
.reBtn:hover {
		background-color: #555; /* 짙은 회색으로 변경 */
		text-decoration: none;
		color: #fff;
}	    
	</style>
  <script type="text/javascript">
	var ws;
	window.onload = function(){
		getRoom();
		createRoom();
	}

	function getRoom(){
		commonAjax('/getRoom', "", 'post', function(result){
			createChatingRoom(result);
		});
	}
	
	 function createRoom() {
		    $("#createRoom").click(function () {
		      var msg = { roomName: $('#roomName').val() };

		      commonAjax('/createRoom', msg, 'post', function (result) {
		        createChatingRoom(result);
		        // 방을 만들고 나서 해당 방으로 이동
		        var roomNumber = result[result.length - 1].roomNumber;
		        var roomName = result[result.length - 1].roomName.trim();
		        goRoom(roomNumber, roomName);
		      });

		      $("#roomName").val("");
		    });
		  }


	function goRoom(number, name){
		location.href="/moveChating?roomName="+name+"&"+"roomNumber="+number;
	}

	function createChatingRoom(res){
		if(res != null){
			var tag = "<tr><th class='num'>순서</th><th class='room'>아이디</th><th class='go'></th></tr>";
			res.forEach(function(d, idx){
				var rn = d.roomName.trim();
				var roomNumber = d.roomNumber;
				tag += "<tr>"+
							"<td class='num'>"+(idx+1)+"</td>"+
							"<td class='room'>"+ rn +"</td>"+
							"<td class='go'><button type='button' class='Btngo' onclick='goRoom(\""+roomNumber+"\", \""+rn+"\")'>상담</button></td>" +
						"</tr>";	
			});
			$("#roomList").empty().append(tag);
		}
	}

		function commonAjax(url, parameter, type, calbak, contentType){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function (res) {
				calbak(res);
			},
			error : function(err){
				console.log('error');
				calbak(err);
			}
		});
	}
</script>
<body>
<jsp:include page="/WEB-INF/resources/sidebar.jsp" />
	<div class="chat-container">
		<h2>채팅 상담</h2>
		<div id="roomContainer" class="roomContainer">
		 <c:choose>
		         <c:when test="${sessionScope.user.id == 'floritz' }">
		        <table id="roomList" class="roomList"></table>
		         </c:when>
		         <c:otherwise>
		         <a class="reBtn" href="/chat">처음으로 돌아가기</a>
		        </c:otherwise>
		       </c:choose>
			
		</div>
		<div>
			<table class="inputTable">
				<tr>
					<th>아이디</th>
					<th><input type="text" name="roomName" id="roomName"></th>
					<th><button id="createRoom">상담하기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>

 



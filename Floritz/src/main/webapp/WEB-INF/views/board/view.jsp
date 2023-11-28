<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Floritz 상세보기</title>

<style>
body {
   width: auto;  /* 원하는 크기로 설정 */
   margin: 0 auto;  /* 페이지를 화면 중앙에 정렬 */
   font-family: 'NanumSquareNeo-Variable';
}
.container {
    display: flex;
    flex-direction: row;
}

.image-container img {
   width: 400px;
    max-height: 500px;
    margin: 0 auto;
    margin-left: 70px;
}

.image-container {
    flex: 1;
    /* 추가적인 스타일 설정 */
}
.text-container {
    flex: 1;
    /* 추가적인 스타일 설정 */
}

#comadress {
    font-size: 28px;  /* 폰트 크기를 16px로 설정 */
    font-weight: bold;  /* 폰트 굵기를 bold로 설정 */
}

#comside {
    font-size: 20px;  /* 폰트 크기를 16px로 설정 */ 
    font-weight: bold;  /* 폰트 굵기를 bold로 설정 */
    line-height: 2;
}

.imagebon img {
   width: 100%;
}

#formWrite {
    width: 100%;  /* 버튼의 가로 크기를 200px로 설정 */
    height: 50px; 
    font-weight: bold;
    font-size: 24px;
   margin-top: 70px;
}

#mapicon img{
   width: 70%;
}

#mapicon{
   position: relative;  /* 이미지의 위치 유형을 상대 위치로 설정 */
    top: -6px;  /* 이미지를 상단으로 10px 올림 */
}


/* 탭 스타일 */
/* Style the tab */
.tab {
  display: flex;
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  flex: 1;
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border-top: none;
}

@media screen and (max-width: 780px) {
    .container {
        flex-direction: column;
        
    }
}

#address {
   font-weight: bold;
   font-size: 20px;
} 

.info-label {
    display: inline-block;
    width: 100px;
    text-align: left;
    color: #555;
    font-weight: bold;
    margin-bottom: 10px;
}

hr {

  margin-top: 20px; /* hr 요소의 위쪽 마진을 20px로 설정 */
}

.cont {
   color: #555;
}
.text-container{
   margin-top: 40px;
}
</style>
<script>
   function openTab(evt, tabName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
          tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
          tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
      }
</script>
<script>
   window.onload = function() {
        document.getElementById("defaultOpen").click();
      }
</script>
</head>
<body>
   <jsp:include page="/WEB-INF/resources/header.jsp" />
   <div id="main">
      <div class="container">
         <div class="image-container">
             <img src="static/companyimg/head.png">
         </div>
         <div class="text-container">
             <h1 id="comtitle"><span class="info-value">${ vo.companyName }</span></h1><br/>
             <div> 
             <div class="info-line">
             <span class="info-value" id="address">${ vo.companyAddress }</span>
             <img id="mapicon" src="static/img/icons8-지도-30.png">
             </div>
             </div>
             <br>
             <div class="cont">
            <div class="info-line">
                  <span class="info-label">전화번호 </span>
                  <span class="info-value">| ${ vo.phone }</span>
              </div>
              <div class="info-line">
                  <span class="info-label">휴무일 </span>
                  <span class="info-value">| 매주 월요일</span>
              </div>
              <div class="info-line">
                  <span class="info-label">브레이크타임 </span>
                  <span class="info-value">| 15시 ~ 17시</span>
              </div>
            </div>
             <div class="formWrite">
               <input type="button" class="btn btn-dark" id="formWrite" value="예약하기">
            </div>
         </div>
      </div>
      <hr>
      <br>
      
      <div class="tab">
        <button class="tablinks" onclick="openTab(event, '상품설명')" id="defaultOpen">상품설명</button>
        <button class="tablinks" onclick="openTab(event, '구매정보')">리뷰</button>
      </div>
      
      <div id="상품설명" class="tabcontent">
        <h3>상품설명</h3>
        <p class="imagebon"><img src="static/img/qc14_20230829132303.jpg"></p>
      </div>
      <div id="구매정보" class="tabcontent">
        <h3>리뷰</h3>
        <p>리뷰 내용...</p>
         <div id="commentList">      
           <hr>
      <!-- 댓글 작성 -->

         </div>
      </div>
      <hr>
      

      <br>
      <br>


   </div>
   <!-- div main end -->

   <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
   <script>
     const  btnEls = document.querySelectorAll('input[type="button"]');
      let    url    = '';
      btnEls.forEach( ( btn ) => {       // Array.from(tag).forEach()
       //  alert(btn.id);
         btn.addEventListener('click', () => {         
            switch(btn.id) {
            case "formWrite":  url='/Order?id=${ vo.id }';         break;
            }
            location.href = url;            
         } )         
      } );
    </script>

</body>
</html>



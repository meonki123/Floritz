<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Floritz 단체 예약</title>
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Simple line icons-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/main.css" />
<link href="/static/css/styles.css" rel="stylesheet" />
<style>

.col-md-3 {
	margin-bottom: 30px;
}
.btn-secondary {
    width: 100%;  /* 버튼 가로 크기를 100%로 설정 */
}
.card-img-top {
   height: 10rem;  /* 이미지 높이 조절 */
   object-fit: cover;  /* 이미지 비율 유지 */ 
}

.card-title {
    white-space: nowrap;  /* 텍스트를 한 줄로 제한 */
    overflow: hidden;  /* 텍스트가 박스를 벗어나면 숨김 */
    text-overflow: ellipsis;  /* 텍스트가 박스를 벗어나면 '...'로 표시 */
}

.card-text {
    margin-bottom: 0;  /* 아래쪽 마진 제거 */
    white-space: nowrap;  /* 텍스트를 한 줄로 제한 */
    overflow: hidden;  /* 텍스트가 박스를 벗어나면 숨김 */
    text-overflow: ellipsis;  /* 텍스트가 박스를 벗어나면 '...'로 표시 */
    cursor: default;
}

.btn-outline-success {
    color: black !important;
    background-color: #ecb807 !important;
    border-color: #ecb807 !important;
    transition: background-color 0.3s ease-in-out;
}

.btn-outline-success:hover {
    background-color: rgba(236, 184, 7, 0.8) !important;
}
.btn-outline-success:focus,
.btn-outline-success:active {
    color: white !important;
    background-color: gray !important;
    border-color: gray !important;
}



</style>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body >
  <jsp:include page="/WEB-INF/resources/header.jsp" />
  <div id="main">
    <table class="table">
  <tbody>
      <div class="container">
      <br>
      <h6>내 주변 추천  <span class="badge bg-danger">Best</span></h6>
      <br>

      <hr>
      <br>
<div style="display: flex; flex-wrap: nowrap;margin-bottom: 20px;">
    <!-- 검색 폼 -->
    <form action="/Search" method="get" style="display: flex;">
	  <div style="width: 180px;">
        <select class="form-select" name="searchType" style="flex: 1;">
	            <option selected>검색 유형 선택</option>
	            <option value="keyword">회사 이름</option>
	            <option value="keyword">회사 주소</option>
        </select>
	   </div>
       
       <div style="width: 1000px;">
        <input class="form-control mr-sm-2" type="text" placeholder="검색어 입력" aria-label="Search" name="keyword" style="flex: 1;">
       </div> 
       
       <div style="width: 180px;">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="flex: 1;width: 180px;">검색</button>
       </div>
    </form>
    <br>
</div>
<div class="row">    
    <c:choose>
        <c:when test="${empty searchResult}">
            <!-- 검색이 수행되지 않았을 때 -->
            <c:forEach var="board" items="${brdList}">
                <div class="col-md-3">
                    <div class="card p-3 p-3" style="width: 100%;">
                        <img src="static/companyimg/head.png" alt="회사 로고">
                        <div class="card-body">
                            <h5 class="card-title">
                                <a href="/View?id=${ board.id }" style="text-decoration: none;color: black;font-weight: bold;">
                                    ${ board.companyName }
                                </a>
                            </h5>
                            <p class="card-text"  data-toggle="tooltip" title="${ board.companyAddress }">${ board.companyAddress }</p>
                            <p class="card-text">${ board.phone }</p>
                            <p class="card-text"  data-toggle="tooltip" title="${ board.phone }">${ board.phone }</p>
                            <a href="/View?id=${ board.id }" class="btn btn-secondary">예약하기</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <!-- 검색이 수행되었을 때 -->
            <c:choose>
                <c:when test="${not empty searchResult}">
                    <!-- 검색 결과가 있을 때 -->
                    <c:forEach var="board" items="${searchResult}">
                        <div class="col-md-3">
                            <div class="card p-3 p-3" style="width: 100%;">
                                <img src="static/companyimg/head.png" alt="회사 로고">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <a href="/View?bno=${ board.id }" style="text-decoration: none;color: black;font-weight: bold;">
                                            ${ board.companyName }
                                        </a>
                                    </h5>
                                    <p class="card-text">${ board.companyAddress }</p>
                                    <p class="card-text">${ board.phone }</p>
                                    <p class="card-text">휴무일 올 예정${ board.phone }</p>
                                    <a href="/View?id=${ board.id }" class="btn btn-secondary">예약하기</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <!-- 검색 결과가 없을 때 -->
                    <p>검색 결과가 없습니다.</p>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</div>

      </div> 
  </tbody>
</table>

    
  </div>
  
  <script>
    const btnWriteEl = document.querySelector('#btnWrite');
    btnWriteEl.addEventListener('click', function() {
    	location.href = '/WriteForm'
    });
  
  </script>
 
</body>
</html>


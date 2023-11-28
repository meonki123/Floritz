<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Floritz 업체 등록</title>
<link rel="stylesheet" href="/css/main.css" />
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


</head>
<body>
	<jsp:include page="/WEB-INF/resources/header.jsp" />
	어어 업체 등록 / 수정 어어
	<!-- 결제하기 버튼 생성 -->

	<!-- 
    <h1>Write</h1>
    <form action="/Write" method="post">
        <input type="hidden" name="companyname" value="${boardDTO.companyname}" />

        <label for="announcement">Announcement:</label>
        <input type="text" id="announcement" name="announcement" value="${boardDTO.announcement}" /><br>

        <label for="repnumber">Rep Number:</label>
        <input type="text" id="repnumber" name="repnumber" value="${boardDTO.repnumber}" /><br>

        <label for="dayoff">Day Off:</label>
        <input type="text" id="dayoff" name="dayoff" value="${boardDTO.dayoff}" /><br>

        <label for="breaktime">Break Time:</label>
        <input type="text" id="breaktime" name="breaktime" value="${boardDTO.breaktime}" /><br>

        <input type="submit" value="Submit" />
    </form>
 -->

</body>
</html>


<!-- 
단일파일 업로드 
<form action="upload_ok" method="post" enctype="multipart/form-data">
	<input type="file" name="file"/><br/>
	<input type="submit" value="업로드"/><br/>
</form>
다중파일 업로드 
<form action="upload_ok2" method="post" enctype="multipart/form-data">
	<input type="file" name="file" multiple="multiple"/><br/>
	<input type="submit" value="업로드"/><br/>
</form>
 -->

<div class="od-LeftNav-navContent">
	<div class="pane_34d56aaf">
		<div class="ms-FocusZone css-97" data-focuszone-id="FocusZone1">
			<div class="ms-FocusZone css-97" data-focuszone-id="FocusZone2">
				<nav role="navigation" class="ms-Nav root-99">
					<div class="ms-Nav-group is-expanded">
						<div class="groupHeader_d3fb4b60" title="이 화정" role="heading"
							aria-level="2">이 화정</div>
						<div class="ms-Nav-groupContent groupContent-107">
							<ul role="list" class="ms-Nav-navItems navItems-106">
								<li role="listitem" class="ms-Nav-navItem navItem-105"><div
										name="내 파일" class="ms-Nav-compositeLink compositeLink-101">
										<div role="presentation" class="root_f67c6556 inline_f67c6556"
											data-drop-target-key="[&quot;driveItem_742&quot;,&quot;https://api.onedrive.com/v1.0&quot;,&quot;74d5733339903704&quot;,&quot;root&quot;]"
											data-is-dropping="false">
											<a
												class="ms-Button ms-Button--action ms-Button--command ms-Nav-link link-114"
												href="https://onedrive.live.com/?cid=74d5733339903704"
												title="내 파일" data-is-focusable="true" tabindex="0"><span
												class="ms-Button-flexContainer flexContainer-115"
												data-automationid="splitbuttonprimary"><span
													class="iconWrapper_f881cca4"><i
														data-icon-name="FabricFolder" aria-hidden="true"
														class="root-124"></i></span>내 파일</span></a>
										</div>
									</div></li>
								<li role="listitem" class="ms-Nav-navItem navItem-105"><div
										name="최근" class="ms-Nav-compositeLink compositeLink-101">
										<div role="presentation" class="root_f67c6556 inline_f67c6556"
											data-drop-target-key="[&quot;recentRootItem_781&quot;,&quot;https://api.onedrive.com/v1.0&quot;]"
											data-is-dropping="false">
											<a
												class="ms-Button ms-Button--action ms-Button--command ms-Nav-link link-114"
												href="#" title="최근" data-is-focusable="true" tabindex="-1"><span
												class="ms-Button-flexContainer flexContainer-115"
												data-automationid="splitbuttonprimary"><span
													class="iconWrapper_f881cca4"><i
														data-icon-name="History" aria-hidden="true"
														class="root-124"></i></span>최근</span></a>
										</div>
									</div></li>
								<li role="listitem" class="ms-Nav-navItem navItem-105"><div
										name="사진" class="ms-Nav-compositeLink compositeLink-101">
										<div role="presentation" class="root_f67c6556 inline_f67c6556"
											data-drop-target-key="[&quot;photosRootKey_952&quot;,&quot;74d5733339903704&quot;,&quot;https://api.onedrive.com/v1.0&quot;]"
											data-is-dropping="false">
											<a
												class="ms-Button ms-Button--action ms-Button--command ms-Nav-link link-114"
												href="#" title="사진" data-is-focusable="true" tabindex="-1"><span
												class="ms-Button-flexContainer flexContainer-115"
												data-automationid="splitbuttonprimary"><span
													class="iconWrapper_f881cca4"><i
														data-icon-name="Photo2" aria-hidden="true"
														class="root-124"></i></span>사진</span></a>
										</div>
									</div></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>


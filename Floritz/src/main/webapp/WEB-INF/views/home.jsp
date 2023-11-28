<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Group Reservation Service Floritz</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/static/img/head.png" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Simple line icons-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
    <jsp:include page="/WEB-INF/resources/header.jsp" />
       
            <div class="px-lg-5 text-center">
                <br><br>
               <!-- slide screen -->
               <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                 <div class="carousel-inner">
                   <div class="carousel-item active">
				      <img src="/static/img/main1.png" class="d-block w-100" alt="...">
				       <div class="carousel-caption slide-write" 
				       style="text-align: center; position: absolute; left: 50%;">
						   	<br><br><br>
						    <h5 style="font-size: 70px;">Floritz 단체 예약</h5>
						    <p style="font-size: 50px;">식당 프로모션</p>
						</div>
				    </div>
                   <div class="carousel-item">
                     <img src="/static/img/main4.png" class="d-block w-100" alt="...">
                     <div class="carousel-caption slide-write" 
				       style="text-align: center; position: absolute; left: 50%;">
						   	<br><br><br>
						    <h5 style="font-size: 70px;">사업장 등록</h5>
						    <p style="font-size: 50px;">단체 예약 가능 식당/리조트</p>
						</div>
                   </div>
                   <div class="carousel-item">
                     <img src="/static/img/main3.png" class="d-block w-100" alt="...">
                     <div class="carousel-caption slide-write" 
				       style="text-align: center; position: absolute; left: 50%;">
						   	<br><br><br>
						    <h5 style="font-size: 70px;">단체예약 문의</h5>
						    <p style="font-size: 50px;">숙박/항공 예약</p>
						</div>
                   </div>
                 </div>
                 <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                   <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                   <span class="visually-hidden">Previous</span>
                 </button>
                 <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                   <span class="carousel-control-next-icon" aria-hidden="true"></span>
                   <span class="visually-hidden">Next</span>
                 </button>
                     <hr>
               </div>
            </div>
        
               
            <div class="px-lg-5 ">
        
                <!-- Portfolio Section Heading-->
                <h2 class="logo">단체예약 추천</h2>
                <!-- Portfolio Grid Items-->
                <div class="row justify-content-center">
                    <!-- Portfolio Item 1-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <a href="/List"><img class="img-fluid" src="static/img/park1.jpg" alt="..." /></a>
                        </div>
                    </div>
                    <!-- Portfolio Item 2-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal2">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <a href="/List"><img class="img-fluid" src="static/img/리조트.png" alt="..." /></a>
                        </div>
                    </div>
                    <!-- Portfolio Item 3-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal3">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <a href="/List"><img class="img-fluid" src="static/img/단체식당1.png" alt="..." /></a>
                        </div>
                    </div>
                    <!-- Portfolio Item 4-->
                    <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal4">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <a href="/List"><img class="img-fluid" src="static/img/단체식당2.png" alt="..." /></a>
                        </div>
                    </div>
                    <!-- Portfolio Item 5-->
                    <div class="col-md-6 col-lg-4 mb-5 mb-md-0">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal5">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <a href="/List"><img class="img-fluid" src="static/img/단체식당3.png" alt="..." /></a>
                        </div>
                    </div>
                    <!-- Portfolio Item 6-->
                    <div class="col-md-6 col-lg-4">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal6">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <a href="/List"><img class="img-fluid" src="static/img/관광버스.png" alt="..." /></a>
                        </div>
                    </div>
                </div>
            </div>

        
        
        <!-- Map-->
        <div class="px-lg-5 text-center">
        <hr>
        <div class="map" id="contact">
        <br><br>
		    <iframe src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=부산+부산진구+중앙대로+749&amp;aq=0&amp;oq=부산+부산진구+중앙대로+749&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=부산+부산진구+중앙대로+749&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
		    <br />
		    <small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=부산+부산진구+중앙대로+749&amp;aq=0&amp;oq=부산+부산진구+중앙대로+749&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=부산+부산진구+중앙대로+749&amp;t=m&amp;z=15&amp;iwloc=A"></a></small>
		</div>
		</div>
        <!-- Footer-->
        <footer class="footer text-center">
            <div class="container px-4 px-lg-5">
                <ul class="list-inline mb-5">
                    <li class="list-inline-item">
                        <a class="social-link rounded-circle text-white mr-3" href="https://instagram.com/bs_gitacademy?igshid=OGQ5ZDc2ODk2ZA==">
                        <i class="bi bi-instagram"></i></a>
                    </li>
                    <li class="list-inline-item">
                        <a class="social-link rounded-circle text-white mr-3" href="https://youtube.com/@user-wh2gx4gp2j?si=6XBnyYWhuUni_mfH">
                        <i class="bi bi-youtube"></i></a>
                    </li>
                    <li class="list-inline-item">
                        <a class="social-link rounded-circle text-white" href="https://github.com/LeeJordy/Floritz.git">
                        <i class="icon-social-github"></i></a>
                    </li>
                </ul>
                <p class="text-muted small mb-0">Copyright &copy; Floritz Website 2023</p>
            </div>
        </footer>
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i></a>
        <!-- Bootstrap core JS-->
	<a href="/chat" class="chatbot-button">
	<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="black" class="bi bi-chat-text" viewBox="0 0 16 16">
  <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
  <path d="M4 5.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zM4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8zm0 2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
</svg></a> 
    </body>
</html>




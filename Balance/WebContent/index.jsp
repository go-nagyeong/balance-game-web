<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Balance Game</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">

<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<div class="page">
		<nav id="colorlib-main-nav" role="navigation">
			<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle active"><i></i></a>
			<div class="js-fullheight colorlib-table">
				<div class="img" style="background-image: url(images/bg_2.jpg);"></div>
				<div class="colorlib-table-cell js-fullheight">
					<div class="row no-gutters">
						<div class="col-md-12 text-center">
							<h1 class="mb-4">
								<a href="index.html" class="logo"></a>
							</h1>
							
							<ul>
								<!-- 로그인 상태 -->
								<% if (session.getAttribute("id") != null) { %>
									<li>
										<a href="#" style="font-size: 16px"><%=session.getAttribute("id")%>님 안녕하세요.</a>
									</li>
									<li class="active"><a href="index.jsp"><span>Home</span></a></li>
									<li> <a href="updateMember.jsp"><span>Modify</span></a> </li>
									<li> <a href="logout.jsp"><span>LogOut</span></a> </li>
									<li> <a href="voteResult.jsp"><span>Record</span></a> </li>

								<!-- 비 로그인 상태 -->
								<% } else { %>
									<li class="active"><a href="index.jsp"><span>Home</span></a></li>
									<li> <a href="login.jsp"><span>LogIn</span></a> </li>
									<li> <a href="join.jsp"><span>Join</span></a> </li>
									<li> <a href="voteResult.jsp"><span>Record</span></a> </li>
								<% } %>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>

		<div id="colorlib-page">
			<header>
				<div class="container">
					<div class="colorlib-navbar-brand">
						<a class="colorlib-logo" href="index.jsp">MINI PROJECT</a>
					</div>
					<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
				</div>
			</header>

			<section class="hero-wrap js-fullheight">
				<div class="container-fluid px-0">
					<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
						<div class="col-md-12 ftco-animate text-center">
							<div class="desc">
								<span class="subheading">2021 혁신성장 청년인재 집중양성</span>
								<h1 style="background-image: url(images/bg_1.jpg); font-size: 130px;">Balance Game</h1>
								<span class="subheading-2">인공지능 개발자 양성과정</span>
							</div>
							
							<div>
								<%
								if (session.getAttribute("id") != null) {
								%>
									<a class="btn-primary btn-xl" href="game.jsp" style="text-align: center">Start</a>
								<%
								} %>
							</div>
						</div>
					</div>
				</div>
			</section>
			
			<footer class="ftco-footer ftco-section img">
				<div class="overlay"></div>
				<div class="container">
					<div class="row mb-5">
						<div class="col-lg-5">
							<div class="ftco-footer-widget mb-4 ml-md-5">
								<h2 class="ftco-heading-2 logo"><a href="index.html">Erase</a></h2>
								<p>Far far away, behind the word mountains, far from the countries Vokalia and
									Consonantia, there live the blind texts.</p>
							</div>
						</div>
						
						<div class="col-lg-3">
							<div class="ftco-footer-widget mb-4 ml-md-5">
								<h2 class="ftco-heading-2">Site Links</h2>
								<ul class="list-unstyled">
									<li><a href="#" class="py-2 d-block">Home</a></li>
									<li><a href="voteResult.jsp" class="py-2 d-block">Record</a></li>
									<li><a href="game.jsp" class="py-2 d-block">Game</a></li>
								</ul>
							</div>
						</div>
						
						<div class="col-lg-4">
							<div class="ftco-footer-widget mb-4">
								<h2 class="ftco-heading-2">This is made by</h2>
								<div class="block-21 mb-4 d-flex">
									<a href="https://github.com/BeomSu-Lim" class="mr-3 mt-0-1">
										<span class="icon-github"></span>
									</a>
									<div class="text">
										<a href="https://github.com/BeomSu-Lim">
											<span>BeomSu-Lim</span>
										</a>
										<div class="meta">
											<div><a><span class="icon-person"></span> 임범수</a></div>
											<div><a><span class="icon-google"></span> </a></div>
										</div>
									</div>
								</div>
								
								<div class="block-21 mb-4 d-flex">
									<a href="https://github.com/ropering" class="mr-3 mt-0-1">
										<span class="icon-github"></span>
									</a>
									<div class="text">
										<a href="https://github.com/ropering">
											<span>ropering</span>
										</a>
										<div class="meta">
											<div><a><span class="icon-person"></span> 오명균</a></div>
											<div><a><span class="icon-google"></span> bonoboss1028@gmail.com</a></div>
										</div>
									</div>
								</div>
								
								<div class="block-21 mb-4 d-flex">
									<a href="https://github.com/go-nagyeong" class="mr-3 mt-0-1">
										<span class="icon-github"></span>
									</a>
									<div class="text">
										<a href="https://github.com/go-nagyeong">
											<span>go-nagyeong</span>
										</a>
										<div class="meta">
											<div><a><span class="icon-person"></span> 김나경</a></div>
											<div><a><span class="icon-google"></span> ngkim.dev@gmail.com</a></div>
										</div>
									</div>
								</div>
								
								<div class="block-21 mb-4 d-flex">
									<a href="https://github.com/wjs1324" class="mr-3 mt-0-1">
										<span class="icon-github"></span>
									</a>
									<div class="text">
										<a href="https://github.com/wjs1324">
											<span>wjs1324</span>
										</a>
										<div class="meta">
											<div><a><span class="icon-person"></span> 전우민</a></div>
											<div><a><span class="icon-google"></span> sportsstatistics1997@gmail.com</a></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-12 text-center">
							<p>
								Copyright &copy;
								<script>document.write(new Date().getFullYear());</script>
								All rights reserved.
							</p>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
</body>

</html>
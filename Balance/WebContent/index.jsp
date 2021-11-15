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

<link rel="icon" type="image/png" href="images/icons/favicon.ico" />

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

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
								<%
								if (session.getAttribute("id") != null) {
								%>
									<li>
										<a href="#" style="font-size: 16px"><%=session.getAttribute("id")%>님 안녕하세요.</a>
									</li>
									<li class="active">
										<a href="updateMember.jsp"><span>Modify</span></a>
									</li>
									<li> <a href="logout.jsp"><span>LogOut</span></a> </li>
									<li> <a href="game.jsp"><span>Game Start</span></a> </li>
									<li> <a href="voteResult.jsp"><span>Record</span></a> </li>

								<!-- 비 로그인 상태 -->
								<%
								} else {
								%>
									<li class="active">
										<a href="login.jsp"><span>LogIn</span></a>
									</li>
									<li> <a href="voteResult.jsp"><span>Record</span></a> </li>
									<li> <a href="join.jsp"><span>Join</span></a> </li>
								<%
								} %>
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

			<p>
				Copyright &copy;
				<script> document.write(new Date().getFullYear()); </script>
				This Balance Game is made
				<i class="icon-heart" aria-hidden="true"></i>
				by <a href="https://lbsdatastat.tistory.com/" target="_blank">임범수</a>
				   <a href="https://github.com/ngkim0929" target="_blank">김나경</a>
				   <a href="https://github.com/wjs1324" target="_blank">전우민</a>
				   <a href="https://ropering.tistory.com" target="_blank">오명균</a>
			</p>
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
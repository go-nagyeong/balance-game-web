<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Result</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/png" href="images/icons/favicon.ico" />

<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>

<body>
	<%
		String msg = request.getParameter("msg");

		if (msg.equals("0")) {
	%>
			<div class="limiter">
				<div class="container-login100">
					<div class="wrap-login100 p-b-160 p-t-50">
						<a class="login100-form validate-form">
							<span class="login100-form-title p-b-43"> 회원 정보가 수정되었습니다 </span>
							<div class="container-login100-form-btn">
								<a class="login100-form-btn" href="index.jsp">Home</a>
							</div>
						</a>
					</div>
				</div>
			</div>
	<%
		} else if (msg.equals("1")) {
	%>
			<div class="limiter">
				<div class="container-login100">
					<div class="wrap-login100 p-b-160 p-t-50">
						<a class="login100-form validate-form">
							<span class="login100-form-title p-b-43"> 회원가입을 축하드립니다 </span>
							<div class="container-login100-form-btn">
								<a class="login100-form-btn" href="index.jsp">Home</a>
							</div>
						</a>
					</div>
				</div>
			</div>
	<%
		} else {
	%>
			<div class="limiter">
				<div class="container-login100">
					<div class="wrap-login100 p-b-160 p-t-50">
						<a class="login100-form validate-form">
							<span class="login100-form-title p-b-43"> 회원정보가 삭제되었습니다 </span>
							<div class="container-login100-form-btn">
								<a class="login100-form-btn" href="index.jsp">Home</a>
							</div>
						</a>
					</div>
				</div>
			</div>
	<%
		}
	%>
</body>

</html>
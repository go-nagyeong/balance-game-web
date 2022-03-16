<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>로그인</title>
		
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" type="text/css" href="css/util.css">
		<link rel="stylesheet" type="text/css" href="css/main.css">
	</head>
	
	<body>
		<div class="limiter">
			<div class="container-login100">
				<div class="wrap-login100 p-b-160 p-t-50">
					
					<form name="oldMember" action="processLogin.jsp" method="post" onsubmit="return checkForm()" class="login100-form validate-form">
						<span class="login100-form-title p-b-43">로그인</span>
	
						<div class="wrap-input100 rs1 validate-input" data-validate="Username is required">
							<input class="input100" type="text" name="myid">
							<span class="label-input100">아이디</span>
						</div>
	
						<div class="wrap-input100 rs2 validate-input" data-validate="Password is required">
							<input class="input100" type="password" name="mypw">
							<span class="label-input100">비밀번호</span>
						</div>
	
						<div class="container-login100-form-btn">
							<input class="login100-form-btn" type="submit" value="로그인">
						</div>
	
						<div class="text-center w-full p-t-23">
							<a href="join.jsp" class="txt1">회원가입</a>
						</div>
					</form>
					
				</div>
			</div>
		</div>
		
		<script>
			function checkForm() {
				if (!document.oldMember.myid.value) {
					alert("아이디를 입력하세요.");
					return false;
				}
			
				if (!document.oldMember.mypw.value) {
					alert("비밀번호를 입력하세요.");
					return false;
				}
			}
		
			//------------------------------------------------------
			
			var inputbox = document.querySelectorAll(".input100")
			
			for(var i in inputbox) {
				inputbox[i].addEventListener("focusout", hasVal);
			}
			
			function hasVal(e) {
				if(e.target.value) {
					e.target.classList.add("has-val");
				} else {
					e.target.classList.remove("has-val");
				} 
			}
		</script>
	</body>
</html>
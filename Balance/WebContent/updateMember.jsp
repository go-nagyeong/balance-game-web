<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원정보 수정</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/png" href="images/icons/favicon.ico" />

<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">
	function checkForm() {
		if (!document.updateMember.pw.value) {
			alert("새 비밀번호를 입력하세요.");
			return false;
		}
		if (!document.updateMember.pw_confirm.value) {
			alert("새 비밀번호 재확인을 입력하세요.");
			return false;
		}
		if (document.updateMember.pw.value != document.updateMember.pw_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
	
	function goCheckDelete() {
		if (confirm("정말 탈퇴하시겠습니까?")) {
			window.location.href = "deleteMember.jsp";
		}
	}
</script>
</head>

<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-b-160 p-t-50">
			
				<form name="updateMember" action="processUpdateMember.jsp" method="post" onsubmit="return checkForm()" class="login100-form validate-form">
					<span class="login100-form-title p-b-43">회원 정보 수정</span>

					<div class="wrap-input100 rs1 validate-input" data-validate="Username is required">
						<input class="input100" type="password" name="pw">
						<span class="label-input100">새 비밀번호</span>
					</div>

					<div class="wrap-input100 rs2 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="pw_confirm">
						<span class="label-input100">새 비밀번호 재확인</span>
					</div>

					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="submit" value="수정">
					</div>

					<div class="text-center w-full p-t-23">
						<a onclick="goCheckDelete()" class="txt1" style="cursor: pointer">회원 탈퇴</a>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
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

</html>
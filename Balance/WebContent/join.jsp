<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>회원가입</title>
		
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" type="text/css" href="css/util.css">
		<link rel="stylesheet" type="text/css" href="css/main.css">
	</head>
	
	<body>
		<div class="limiter">
			<div class="container-login100">
				<div class="wrap-login100 p-b-160 p-t-50">
					
					<form name="newMember" action="processJoin.jsp" method="post" onsubmit="return checkForm()" class="login100-form validate-form">
						<span class="login100-form-title p-b-43">회원가입</span>
		
						<div class="wrap-input100 rs3 validate-input" data-validate="Username is required">
							<input class="input100" type="text" name="myid" onchange="checkId()">
							<span class="label-input100">아이디</span>
							<input type="hidden" name="idCheckBox" value="checkable">
						</div>
		
						<div class="container-login100-form-btn">
							<input class="login100-form-btn" type="button" onclick="idOverlap()" value="중복체크">
							<input type="hidden" name="idDuplication" value="unusable">
						</div>
		
						<div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
							<input class="input100" type="password" name="mypw">
							<span class="label-input100">비밀번호</span>
						</div>
		
						<div class="wrap-input100 rs2 validate-input" data-validate="Password is required">
							<input class="input100" type="password" name="mypw_confirm">
							<span class="label-input100">비밀번호 재확인</span>
						</div>
		
						<div class="container-login100-form-btn">
							<input class="login100-form-btn" type="submit" value="회원가입">
						</div>
					</form>
					
				</div>
			</div>
		</div>
		
		<script>
			function checkForm() {
				if (!document.newMember.myid.value) {
					alert("아이디를 입력하세요.");
					return false;
				}
		
				if (!document.newMember.mypw.value) {
					alert("비밀번호를 입력하세요.");
					return false;
				}
		
				if (!document.newMember.mypw_confirm.value) {
					alert("비밀번호 재확인을 입력하세요.");
					return false;
				}
				
				if (document.newMember.mypw.value != document.newMember.mypw_confirm.value) {
					alert("비밀번호 재확인을 동일하게 입력하세요.");
					return false;
				}
		
				if (document.newMember.idDuplication.value != "usable") {
					alert("아이디 중복검사를 하세요.");
					return false;
				}
			}
		
			// 아이디 유효성 검사 (영문 소문자, 숫자만 허용)
			function checkId() {
				document.newMember.idDuplication.value = "unusable";
				document.newMember.idCheckBox.value = "checkable";
			    var count = 0;
			    
				for (var i = 0; i < document.newMember.myid.value.length; i++) {
		        	var ch = document.newMember.myid.value.charAt(i);
		        	
		            if (!(ch >= "0" && ch <= "9") && !(ch >= "a" && ch <= "z")) {
		            	count++;
		                document.newMember.myid.focus();
		                document.newMember.myid.select();
					    if (count > 0) {
							document.newMember.idCheckBox.value = "uncheckable";
					      	alert("아이디는 영문 소문자, 숫자만 입력가능합니다.");
			                return false;
					    }
		            }
		        }
			}
		
			function idOverlap() {
				if (!document.newMember.myid.value) {
					alert("아이디를 입력하세요.");
					return false;
				}
				
				if (document.newMember.idCheckBox.value !== "uncheckable") {
					window.name = "IDCheckForm";
					window.open("idOverlap.jsp?myid=" + document.newMember.myid.value, "width=300, height=160, resizable =no, scrollbars=no");
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
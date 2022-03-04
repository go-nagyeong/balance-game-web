<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Game</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/png" href="images/icons/favicon.ico" />

<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>

<body>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/balancedb"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	
<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM member WHERE id=?
   <sql:param value="<%=session.getAttribute(\"id\")%>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="gamecount" value="${row.gamecount}" />
</c:forEach>

<c:choose>
	<c:when test="${gamecount < 20}">
		<sql:query dataSource="${dataSource}" var="resultSet">
		   SELECT * FROM question WHERE num in (${gamecount * 2 + 1}, ${gamecount * 2 + 2})
		</sql:query>
		
		<c:forEach var="row" items="${resultSet.rows}" varStatus="i">
			<c:if test="${i.index eq 0}">
				<c:set var="opt1" value="${row.opt}" />
			</c:if>
			<c:if test="${i.index eq 1}">
				<c:set var="opt2" value="${row.opt}" />
			</c:if>
		</c:forEach>
	</c:when>
					
	<c:otherwise>			
		<c:redirect url="voteResult.jsp?isAfterGame=true" />
	</c:otherwise>
</c:choose>


	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-record p-b-160 p-t-50">
				<span class="login100-form-title m-b-35">
					${gamecount + 1}번째 밸런스
				</span>
				
				<div class="text-center w-full m-b-20">
					<a href="resetGame.jsp" class="txt1 m-r-35">재시작</a>
					<a href="index.jsp" class="txt1">메인 화면</a>
				</div>
	
				<script>
					function Check1() {
						document.formName.hidden1.value = "1";
					}
					function Check2() {
						document.formName.hidden2.value = "1";
					}
				</script>
				
				<form name="formName" action="voteAction.jsp">
					<input type="hidden" name="gamecount" value="${gamecount}">
					<input type="hidden" name="hidden1" value="0">
					<input type="hidden" name="hidden2" value="0">
					<input type="hidden" name="op1" value="${gamecount * 2 + 1}">
					<input type="hidden" name="op2" value="${gamecount * 2 + 2}">
			
					<table class="table table-borderless table-hover text-white">
						<tr>
							<td>
								<button type="submit" onclick="Check1()">
									<img src="q_images/${gamecount * 2 + 1}.jpg" width="400" height="400">
									<p>${opt1}</p>
								</button>
							</td>
							<td>
								<button type="submit" onclick="Check2()">
									<img src="q_images/${gamecount * 2 + 2}.jpg" width="400" height="400">
									<p>${opt2}</p>
								</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
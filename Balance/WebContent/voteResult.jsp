<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Game Record</title>

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

<!-- 게임이 끝난 이후의 접근이면 gamecount 초기화 -->
<c:set var='isAfterGame' value='<%=request.getParameter("isAfterGame")%>'/>
<c:if test="${isAfterGame}">
	<sql:update dataSource="${dataSource}" var="resultSet">
		UPDATE member SET gamecount=0 WHERE id=?
		<sql:param value="<%=session.getAttribute(\"id\")%>" />
	</sql:update>
</c:if>
	
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-record p-b-160 p-t-50">
				<span class="login100-form-title m-b-35">밸런스 게임</span>
				
				<div class="text-center w-full m-b-20">
					<a href="game.jsp" class="txt1 m-r-35">게임 시작</a>
					<a href="index.jsp" class="txt1">메인 화면</a>
				</div>
			
				<table class="table table-light">
					<tr>
						<td>No</td>
						<td colspan="2">선택 A</td>
						<td>전적</td>
						<td colspan="2">선택 B</td>
						<td>전적</td>
					</tr>

					<!-- 게임 카운트 변수 -->
					<c:set var="gameCount" value="1" />

					<sql:query dataSource="${dataSource}" var="resultSet">
					   SELECT * FROM question
					</sql:query>
					
					<c:forEach var="row" items="${resultSet.rows}">
						<!-- 밸런스 선택 비율 변수 -->
						<fmt:formatNumber var="per" pattern="0" value="${row.yes / row.total * 100}" />
						
						<!-- 사용자의 게임 기록을 위해 사용자가 선택한 밸런스를 기록해놓은 필드 가져오기 -->
						<sql:query dataSource="${dataSource}" var="resultSet2">
						   SELECT * FROM member WHERE id=?
						   <sql:param value="<%=session.getAttribute(\"id\")%>" />
						</sql:query>
						
						<c:forEach var="rowByIndex" items="${resultSet2.rowsByIndex}" >
							<c:set var='selectedOption' value="${rowByIndex[gameCount+2]}"/>
						</c:forEach>
						<!-------------------------------------------------------------->
						
						<c:choose>
							<c:when test="${row.num % 2 == 1}">
								<tr>
									<td>${gameCount}</td>
									<td> <img src="q_images/${row.num}.jpg" width="200" height="200"> </td>
									<td>
										<span style="
											<c:if test="${isAfterGame && selectedOption==row.num}">
												background: linear-gradient(to top, yellow 50%, transparent 50%);
												font-size: 18px;
											</c:if>
										">${row.opt}</span>
									</td>
									<td>
										${per}%
										<br>
										(${row.yes}/${row.total})
									</td>
							</c:when>
							
							<c:otherwise>
									<c:set var="gameCount" value="${gameCount + 1}" />
									
									<td> <img src="q_images/${row.num}.jpg" width="200" height="200"> </td>
									<td>
										<span style="
											<c:if test="${isAfterGame && selectedOption==row.num}">
												background: linear-gradient(to top, yellow 50%, transparent 50%);
												font-size: 18px;
											</c:if>
										">${row.opt}</span>
									</td>
									<td>
										${per}%
										<br>
										(${row.yes}/${row.total})
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
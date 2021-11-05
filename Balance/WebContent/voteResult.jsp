<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>게임 기록</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>

<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-b-160 p-t-50">
				<h1 align=center>밸런스 게임</h1>
			
				<table border=1 align=center style="background-color: #FFFFFF" color:white>
					<tr align=center>
						<td>그림</td>
						<td width=300>선택지</td>
						<td width=100>전적</td>
						<td>그림</td>
						<td width=300>선택지</td>
						<td width=100>전적</td>
					</tr>
			
					<%
						Connection conn = null;
						Statement stmt = null;
			
						try {
							Class.forName("com.mysql.jdbc.Driver");
							conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/balancedb", "root", "1234");
							stmt = conn.createStatement();
							ResultSet rs = stmt.executeQuery("select num, opt, total, yes, per from question order by num asc");
			
							while (rs.next()) {
								int per = rs.getInt("per");
			
								if (rs.getInt("num") % 2 == 1) {
							%>
									<tr align=center>
										<td> <img src=q_images/<%=rs.getInt("num")%>.jpg width="200" height="200"> </td>
										<td> <%=rs.getString("opt")%> </td>
										<td> <%=rs.getInt("per")%>%
											<c:set var="per" value="<%=per%>" />
											<c:if test="${per==Null}">
												<c:out value="0%" />
											</c:if>
											<br>
											(<%=rs.getInt("yes")%>/<%=rs.getInt("total")%>)
										</td>
							
							<%
								} else if(rs.getInt("num") % 2 == 0) {
							%>
										<td> <img src=q_images/<%=rs.getInt("num")%>.jpg width="200" height="200"> </td>
										<td> <%=rs.getString("opt")%> </td>
										<td> <%=rs.getInt("per")%>%
											<c:set var="per" value="<%=per%>" />
											<c:if test="${per==Null}">
												<c:out value="0%" />
											</c:if>
											<br>
											(<%=rs.getInt("yes")%>/<%=rs.getInt("total")%>)
										</td>
									</tr>
							<%
								}
							}
			 
						} catch(Exception e) {
							
						}
					%>
					
					<div align=center>
						<a href="game.jsp" style="font-size: 23px">게임 시작</a>
						&nbsp;
						<a href="index.jsp" style="font-size: 23px">메인 화면</a>
					</div>
				</table>
			
				<!-- index.jsp에 접속하면 로그인한 아이디의 DB에 있는 gamecount값이 초기화됨 -->
				<%
					String id = (String) session.getAttribute("id");
				%>
				<sql:setDataSource var="dataSource"
					url="jdbc:mysql://localhost:3306/balancedb"
					driver="com.mysql.jdbc.Driver" user="root" password="1234" />
			
				<sql:update dataSource="${dataSource}" var="resultSet">
					UPDATE member SET gamecount=? WHERE id=?;
					<sql:param value="0" />
					<sql:param value="<%=id%>" />
				</sql:update>
			</div>
		</div>
	</div>
</body>
</html>

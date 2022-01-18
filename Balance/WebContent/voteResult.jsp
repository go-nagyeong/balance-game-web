<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>게임 기록</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/png" href="images/icons/favicon.ico" />

<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>

<body>
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
			

					<%
						Connection conn = null;
						Statement stmt = null;
			
						try {
							Class.forName("com.mysql.jdbc.Driver");
							conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/balancedb", "root", "1234");
							stmt = conn.createStatement();
							ResultSet rs = stmt.executeQuery("select num, opt, total, yes from question order by num asc");
			
							while (rs.next()) {
								float yes = rs.getInt("yes");
								float total = rs.getInt("total");
								String per = String.format("%.0f", (yes/total)*100);
								
								if (rs.getInt("num") % 2 == 1) {
					%>
									<tr>
										<td> <%=rs.getInt("num") / 2 + 1%> </td>
										<td> <img src=q_images/<%=rs.getInt("num")%>.jpg width="200" height="200"> </td>
										<td> <%=rs.getString("opt")%> </td>
										<td>
											<c:set var="total" value="<%=total%>" />
											<c:choose>
												<c:when test="${total eq 0}">
											        <c:out value="0%" />
											    </c:when>
												<c:otherwise>
													<c:out value="<%=per%>" />%
											    </c:otherwise>
										    </c:choose>
											<br>
											(<%=rs.getInt("yes")%>/<%=rs.getInt("total")%>)
										</td>
										
							<%  } else if(rs.getInt("num") % 2 == 0) { %>
										
										<td> <img src=q_images/<%=rs.getInt("num")%>.jpg width="200" height="200"> </td>
										<td> <%=rs.getString("opt")%> </td>
										<td>
											<c:set var="total" value="<%=total%>" />
											<c:choose>
												<c:when test="${total eq 0}">
											        <c:out value="0%" />
											    </c:when>
												<c:otherwise>
													<c:out value="<%=per%>" />%
											    </c:otherwise>
										    </c:choose>
											<br>
											(<%=rs.getInt("yes")%>/<%=rs.getInt("total")%>)
										</td>
									</tr>
					<%
								}
							}
						} catch(Exception e) {
							out.println(e);
						}
					%>
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

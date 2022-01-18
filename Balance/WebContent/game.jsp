<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

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
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/balancedb", "root", "1234");
		
		String sql = "select * from member where id='" + session.getAttribute("id") + "'";
		pstmt = conn.prepareStatement(sql);
		rs1 = pstmt.executeQuery();
		rs1.next();
	%>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-record p-b-160 p-t-50">
				<span class="login100-form-title m-b-35">
					<%=rs1.getInt("gamecount") + 1%>번째 밸런스
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
	
				<%
				if (rs1.getInt("gamecount") == 0) {
				%>
				<form name="formName" action="voteAction.jsp">
					<input type="hidden" name="gamecount" value=<%=rs1.getInt("gamecount")%> >
					<input type="hidden" name="hidden1" value="0">
					<input type="hidden" name="hidden2" value="0">
					<input type="hidden" name="op1" value="1">
					<input type="hidden" name="op2" value="2">
			
					<table class="table table-borderless table-hover">
						<tr>
							<td>
								<button type="submit" onclick="Check1()">
									<img src=q_images/1.jpg width="400" height="400">
									<%
									sql = "select * from question where num=1";
									pstmt = conn.prepareStatement(sql);
									rs2 = pstmt.executeQuery();
									rs2.next();
									%>
									<p><%=rs2.getString("opt")%></p>
								</button>
							</td>
							<td>
								<button type="submit" onclick="Check2()">
									<img src=q_images/2.jpg width="400" height="400">
									<%
									sql = "select * from question where num=2";
									pstmt = conn.prepareStatement(sql);
									rs2 = pstmt.executeQuery();
									rs2.next();
									%>
									<p><%=rs2.getString("opt")%></p>
								</button>
							</td>
						</tr>
					</table>
				</form>
					
				<%
				} else if (rs1.getInt("gamecount") < 20) {
				%>
				<form name="formName" action="voteAction.jsp">
					<input type="hidden" name="gamecount" value=<%=rs1.getInt("gamecount")%> >
					<input type="hidden" name="hidden1" value="0">
					<input type="hidden" name="hidden2" value="0">
					<input type="hidden" name="op1" value=<%=rs1.getInt("gamecount") * 2 + 1%> >
					<input type="hidden" name="op2" value=<%=rs1.getInt("gamecount") * 2 + 2%> >
			
					<table class="table table-borderless table-hover text-white">
						<tr>
							<td>
								<button type="submit" onclick="Check1()">
									<img src=q_images/<%=rs1.getInt("gamecount") * 2 + 1%>.jpg width="400" height="400">
									<%
									sql = "select * from question where num=?";
									pstmt = conn.prepareStatement(sql);
									int a = rs1.getInt("gamecount") * 2 + 1;
									pstmt.setInt(1, a);
									rs2 = pstmt.executeQuery();
									rs2.next();
									%>
									<p><%=rs2.getString("opt")%></p>
								</button>
							</td>
							<td>
								<button type="submit" onclick="Check2()">
									<img src=q_images/<%=rs1.getInt("gamecount") * 2 + 2%>.jpg width="400" height="400">
									<%
									sql = "select * from question where num=?";
									pstmt = conn.prepareStatement(sql);
									int b = rs1.getInt("gamecount") * 2 + 2;
									pstmt.setInt(1, b);
									rs2 = pstmt.executeQuery();
									rs2.next();
									%>
									<p><%=rs2.getString("opt")%></p>
								</button>
							</td>
						</tr>
					</table>
				</form>
			
				<%
				} else {
					response.sendRedirect("voteResult.jsp?isAfterGame=true");
				}
				%>
			</div>
		</div>
	</div>
	
	<%
	} catch (Exception e) {
		out.println(e);
	}
	%>
</body>

</html>
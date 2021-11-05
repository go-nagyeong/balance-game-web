<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Game</title>
</head>

<body style="background-color: #F1B208">
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
	
		<br>
		<div align="center">
			<h2> <%=rs1.getInt("gamecount") + 1%>번째 밸런스 </h2>
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
			<form name="formName" action="voteaction.jsp" style="font-size: 20px;">
				<input type="hidden" name="gamecount" value=<%=rs1.getInt("gamecount")%> >
				<input type="hidden" name="hidden1" value="0">
				<input type="hidden" name="hidden2" value="0">
				<input type="hidden" name="op1" value="1">
				<input type="hidden" name="op2" value="2">
		
				<table align="center">
					<tr>
						<td><button type="submit" onclick="Check1()">
								<img src=q_images/1.jpg width="400" height="400">
							</button></td>
		
						<td><button type="submit" onclick="Check2()">
								<img src=q_images/2.jpg width="400" height="400">
							</button></td>
					</tr>
		
					<tr>
						<td align="center">
							<%
							sql = "select * from question where num=1";
							pstmt = conn.prepareStatement(sql);
							rs2 = pstmt.executeQuery();
							rs2.next();
							%>
							<%=rs2.getString("opt")%>
						</td>
						<td align="center">
							<%
							sql = "select * from question where num=2";
							pstmt = conn.prepareStatement(sql);
							rs2 = pstmt.executeQuery();
							rs2.next();
							%>
							<%=rs2.getString("opt")%>
						</td>
					</tr>
				</table>
		
			</form>
			
		<%
		} else if (rs1.getInt("gamecount") < 20) {
		%>
			<form name="formName" action="voteaction.jsp" style="font-size: 20px;">
				<input type="hidden" name="gamecount" value=<%=rs1.getInt("gamecount")%> >
				<input type="hidden" name="hidden1" value="0">
				<input type="hidden" name="hidden2" value="0">
				<input type="hidden" name="op1" value=<%=rs1.getInt("gamecount") * 2 + 1%> >
				<input type="hidden" name="op2" value=<%=rs1.getInt("gamecount") * 2 + 2%> >
		
				<table align="center">
					<tr>
						<td><button type="submit" onclick="Check1()">
								<img src=q_images/<%=rs1.getInt("gamecount") * 2 + 1%>.jpg width="400" height="400">
							</button></td>
		
						<td><button type="submit" onclick="Check2()">
								<img src=q_images/<%=rs1.getInt("gamecount") * 2 + 2%>.jpg width="400" height="400">
							</button></td>
					</tr>
		
					<tr>
						<td align="center">
							<%
							sql = "select * from question where num=?";
							pstmt = conn.prepareStatement(sql);
							int a = rs1.getInt("gamecount") * 2 + 1;
							pstmt.setInt(1, a);
							rs2 = pstmt.executeQuery();
							rs2.next();
							%>
							<%=rs2.getString("opt")%>
						</td>
						<td align="center">
							<%
							sql = "select * from question where num=?";
							pstmt = conn.prepareStatement(sql);
							int b = rs1.getInt("gamecount") * 2 + 2;
							pstmt.setInt(1, b);
							rs2 = pstmt.executeQuery();
							rs2.next();
							%>
							<%=rs2.getString("opt")%>
						</td>
					</tr>
				</table>
		
			</form>
	
		<%
		} else {
			response.sendRedirect("voteResult.jsp");
		}

	} catch (Exception e) {
		out.println(e);
	}
	%>
</body>

</html>
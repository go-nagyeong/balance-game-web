<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
	
<%
	String gamecount = request.getParameter("gamecount");
	String hidden1 = request.getParameter("hidden1");
	String hidden2 = request.getParameter("hidden2");
	String op1 = request.getParameter("op1");
	String op2 = request.getParameter("op2");
	int temp = 0;

	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/balancedb", "root", "1234");
		String query1 = null;
		String query2 = null;
		String query3 = null;
		String sql1 = null;
		String sql2 = null;

		sql1 = "update question set total=total+1 where num=" + op1;
		sql2 = "update question set total=total+1 where num=" + op2;

		if (hidden1.equals("1")) {
			query1 = "update member set gamecount=gamecount+1 where id='" + session.getAttribute("id") + "'";

			query2 = "update question set yes=yes+1 where num=" + op1;
			temp = Integer.parseInt(op1);

			pstmt = conn.prepareStatement(sql1);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql2);
			pstmt.executeUpdate();
			pstmt.close();

		} else if (hidden2.equals("1")) {
			query1 = "update member set gamecount=gamecount+1 where id='" + session.getAttribute("id") + "'";

			query2 = "update question set yes=yes+1 where num=" + op2;
			temp = Integer.parseInt(op2);

			pstmt = conn.prepareStatement(sql1);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql2);
			pstmt.executeUpdate();
			pstmt.close();
		}

		pstmt = conn.prepareStatement(query1);
		pstmt.executeUpdate();

		pstmt = conn.prepareStatement(query2);
		pstmt.executeUpdate();

		query3 = "update member set g" + String.valueOf(Integer.parseInt(gamecount) + 1) + "=" 
					+ String.valueOf(temp) + " where id='" + session.getAttribute("id") + "'";
		pstmt = conn.prepareStatement(query3);
		pstmt.executeUpdate();
		
		response.sendRedirect("game.jsp");

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
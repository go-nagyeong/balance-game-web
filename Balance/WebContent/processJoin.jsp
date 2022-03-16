<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	String myid = request.getParameter("myid");
	String mypw = request.getParameter("mypw");

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/balancedb", "root", "1234");
		
		String sql = "INSERT INTO member VALUES(?,?,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, myid);
		pstmt.setString(2, mypw);
		int result = pstmt.executeUpdate();
		
		if (result == 1) {
			session.invalidate();
			response.sendRedirect("result.jsp?msg=1");
		}
		
	} catch(SQLException e) {
		System.out.println(e);
		
	} finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>
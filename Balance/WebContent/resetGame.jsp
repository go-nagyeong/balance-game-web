<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	String id = (String) session.getAttribute("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/balancedb", "root", "1234");
		
		String sql = "UPDATE member SET gamecount=? WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, 0);
		pstmt.setString(2, id);
		int result = pstmt.executeUpdate();
		
		if (result == 1) {
			response.sendRedirect("game.jsp");
		}
		
	} catch(SQLException e) {
		System.out.println(e);
		
	} finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>
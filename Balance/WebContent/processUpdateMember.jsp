<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%	String id = (String) session.getAttribute("id");
	String pw = request.getParameter("pw");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/balancedb", "root", "1234");
		
		String sql = "UPDATE member SET pw=? WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pw);
		pstmt.setString(2, id);
		int result = pstmt.executeUpdate();
		
		if (result == 1) {
			response.sendRedirect("result.jsp?msg=0");
		}
		
	} catch(SQLException e) {
		System.out.println(e);
		
	} finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>





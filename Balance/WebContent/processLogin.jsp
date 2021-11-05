<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	String id = request.getParameter("myid");
	String pw = request.getParameter("mypw");

	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/balancedb", "root", "1234");
		String sql = "SELECT COUNT(*) AS cnt FROM member WHERE id=? AND pw=BINARY(?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();
		rs.next();

		if (rs.getString("cnt").equals("1")) {
			session.setAttribute("id", id);
			response.sendRedirect("index.jsp");
		} else {
			out.println("<script> alert('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.'); history.back(); </script>");
		}

	} catch (Exception e) {

	}
%>

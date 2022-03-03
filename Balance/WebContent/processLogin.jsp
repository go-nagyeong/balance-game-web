<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% 	String myid = request.getParameter("myid");
	String mypw = request.getParameter("mypw");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/balancedb", "root", "1234");
		
		String sql = "SELECT * FROM member WHERE id=? AND pw=BINARY(?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, myid);
		pstmt.setString(2, mypw);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			session.setAttribute("id", myid);
			response.sendRedirect("index.jsp");
		} else { %>
			<script>
				alert('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.');
				history.back();
			</script>
		<% }
		
	} catch(SQLException e) {
		System.out.println(e);
		
	} finally {
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>

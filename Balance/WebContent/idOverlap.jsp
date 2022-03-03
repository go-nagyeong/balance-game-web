<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%	String myid = request.getParameter("myid");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/balancedb", "root", "1234");
		
		String sql = "SELECT * FROM member WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, myid);
		rs = pstmt.executeQuery();
		
		if (rs.next()) { %>
			<script>
				alert("이미 사용 중인 아이디입니다.");
				opener.document.newMember.idDuplication.value = "unusable";
				window.close();
			</script>
		<% } else { %>	
			<script>
				alert("아이디를 사용할 수 있습니다.");
				opener.document.newMember.idDuplication.value = "usable";
				window.close();
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
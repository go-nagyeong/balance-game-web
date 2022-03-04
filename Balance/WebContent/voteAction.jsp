<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
	
<%	String id = (String) session.getAttribute("id");

	String gamecount = request.getParameter("gamecount");
	String hidden1 = request.getParameter("hidden1");
	String hidden2 = request.getParameter("hidden2");
	String op1 = request.getParameter("op1");
	String op2 = request.getParameter("op2");

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String query = null;
	String select = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/balancedb", "root", "1234");
		
		// 사용자의 게임 진행 상황을 기록하는 gamecount 필드 업데이트
		query = "UPDATE member SET gamecount=gamecount+1 WHERE id=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		pstmt.close();
		
		// 각 선택지의 통계를 내는 데 사용하는 total 필드 업데이트
		query = "UPDATE question SET total=total+1 WHERE num IN (?, ?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, op1);
		pstmt.setString(2, op2);
		pstmt.executeUpdate();
		pstmt.close();
		
		// 사용자가 선택한 선택지에 따라 총 선택 비율을 나타내는 yes 필드 업데이트 
		query = "UPDATE question SET yes=yes+1 WHERE num=?";
		pstmt = conn.prepareStatement(query);
		if (hidden1.equals("1")) {
			pstmt.setString(1, op1);
			select = op1;
		} else if (hidden2.equals("1")) {
			pstmt.setString(1, op2);
			select = op2;
		}
		pstmt.executeUpdate();
		pstmt.close();
		
		// 사용자가 각 밸런스 질문마다 무엇을 선택했는지 기록하는 g1~20 필드 업데이트
		query = "UPDATE member SET g" + String.valueOf(Integer.parseInt(gamecount) + 1) + "=? WHERE id=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, Integer.parseInt(select));
		pstmt.setString(2, id);
		int result = pstmt.executeUpdate();
		
		if (result == 1)
			response.sendRedirect("game.jsp");
		
	} catch(SQLException e) {
		System.out.println(e);
		
	} finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
	
<%
	String gamecount = request.getParameter("gamecount");
	String hidden1 = request.getParameter("hidden1");
	String hidden2 = request.getParameter("hidden2");
	String op1 = request.getParameter("op1");
	String op2 = request.getParameter("op2");

	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/balancedb", "root", "1234");
		
		String query = null;
		
		// 사용자의 게임 진행 상황을 기록하는 gamecount 필드 업데이트
		query = "update member set gamecount=gamecount+1 where id='" + session.getAttribute("id") + "'";
		pstmt = conn.prepareStatement(query);
		pstmt.executeUpdate();
		
		// 각 선택지의 통계를 내는 데 사용하는 total 필드 업데이트
		query = "update question set total=total+1 where num=" + op1;
		pstmt = conn.prepareStatement(query);
		pstmt.executeUpdate();
		query = "update question set total=total+1 where num=" + op2;
		pstmt = conn.prepareStatement(query);
		pstmt.executeUpdate();
		
		int temp = 0;
		
		// 사용자가 선택한 선택지에 따라 총 선택 비율을 나타내는 yes 필드 업데이트 
		if (hidden1.equals("1")) {
			query = "update question set yes=yes+1 where num=" + op1;
			temp = Integer.parseInt(op1);
		} else if (hidden2.equals("1")) {
			query = "update question set yes=yes+1 where num=" + op2;
			temp = Integer.parseInt(op2);
		}
		pstmt = conn.prepareStatement(query);
		pstmt.executeUpdate();

		// 사용자가 각 밸런스 질문마다 무엇을 선택했는지 기록하는 g1~20 필드 업데이트
		// (게임이 끝난 후, 사용자가 선택한 선택지들을 보여주는 기능은 향후 구현 예정)
		query = "update member set g" + String.valueOf(Integer.parseInt(gamecount) + 1) + "=" 
					+ String.valueOf(temp) + " where id='" + session.getAttribute("id") + "'";
		pstmt = conn.prepareStatement(query);
		pstmt.executeUpdate();
		
		response.sendRedirect("game.jsp");

	} catch (Exception e) {
		out.println(e);
		e.printStackTrace();
	}
%>
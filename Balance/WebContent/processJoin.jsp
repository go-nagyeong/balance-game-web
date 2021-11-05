<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String myid = request.getParameter("myid");
	String mypw = request.getParameter("mypw");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/balancedb"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO member VALUES(?,?,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
   	<sql:param value="<%=myid%>" />
	<sql:param value="<%=mypw%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="result.jsp?msg=1" />
</c:if>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String id = (String) session.getAttribute("id");
	String pw = request.getParameter("pw");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/balancedb"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
   UPDATE MEMBER SET PW=? WHERE ID=?
	<sql:param value="<%=pw%>" />
	<sql:param value="<%=id%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="result.jsp?msg=0" />
</c:if>





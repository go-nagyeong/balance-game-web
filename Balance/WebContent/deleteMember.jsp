<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String id = (String) session.getAttribute("id");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/balancedb"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	
<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM member WHERE id = ?
   <sql:param value="<%=id%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:import var="url" url="logout.jsp" />
	<c:redirect url="result.jsp?msg=2" />
</c:if>
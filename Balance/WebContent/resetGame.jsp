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
	UPDATE member SET gamecount=? WHERE id=?;
	<sql:param value="0" />
	<sql:param value="<%=id%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="game.jsp" />
</c:if>
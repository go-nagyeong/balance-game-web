<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String check = request.getParameter("myid");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/balancedb"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?  
   <sql:param value="<%=check%>" />
</sql:query>

<c:set var="result" value="0" />
<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="result" value="1" />
</c:forEach>


<c:if test="${result == 0}">
	<script>
		alert("아이디를 사용할 수 있습니다.");
		opener.document.newMember.idDuplication.value = "usable";
		window.close();
	</script>
</c:if>

<c:if test="${result == 1}">
	<script>
		alert("이미 사용 중인 아이디입니다.");
		opener.document.newMember.idDuplication.value = "unusable";
		window.close();
	</script>
</c:if>

<%-- <html>
<head>
<title>아이디 중복검사</title>
</head>
<body>
	<br>
	<div>
		<h5 align="center">
			<c:if test="${result == 0}">
				아이디를 사용할 수 있습니다
				<script>
					opener.document.newMember.idDuplication.value = "idCheck";
				</script>
			</c:if>

			<c:if test="${result == 1}">
				이미 사용 중인 아이디입니다 
			</c:if>
		</h5>
	</div>

	<div align="center">
		<input type="button" onclick="window.close()" value=" 닫기 ">
	</div>
</body>
</html> --%>
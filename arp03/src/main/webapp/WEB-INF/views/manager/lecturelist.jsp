<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../include/header.jsp"/>
	<c:forEach var="d" items="${ list}">
	<a href="">${d}</a>
	<br>
	</c:forEach>

	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<a href="make.lec">강의 만들기</a><br>
	<c:forEach var="c" items="${list }">
		<a href="main.lec?lec_no=${c.lec_no }">${c }</a><br>
	</c:forEach>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
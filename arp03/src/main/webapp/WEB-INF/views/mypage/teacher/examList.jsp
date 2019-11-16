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
	<jsp:include page="../../include/header.jsp"/>
	<h1>시험관리</h1>
	
	<a href="make.ex">강의 만들기</a><br>
	<c:forEach var="e" items="${list }">
		<a href="">${e }</a><br>
	</c:forEach>
	
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>
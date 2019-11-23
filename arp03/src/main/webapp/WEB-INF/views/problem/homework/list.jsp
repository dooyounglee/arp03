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
homeworkList
<a href="make.hw">숙제 만들기</a><br>
<c:forEach var="hw" items="${list }">
	<a href="get.hw?hw_no=${hw.hw_no }">${hw }</a><br>
</c:forEach>
</body>
</html>
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
<form action="survey.ma">
	<input type="text" name="title" placeholder="제목">
	<input type="text" value="${enrolldate }" readonly>
	<input type="text" name="q1">
	<input type="text" name="q2">
	<input type="text" name="q3">
</form>
</body>
</html>
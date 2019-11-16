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
	<jsp:include page="../../../include/header.jsp"/>
	<h1>시험만들기</h1>

	${e }<br>
	<a href="edit.ex?e_no=${e.e_no }">수정</a>
	
	<jsp:include page="../../../include/footer.jsp"/>
</body>
</html>
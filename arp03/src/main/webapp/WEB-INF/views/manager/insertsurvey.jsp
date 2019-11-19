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
		
		<h1>${lec.title }페이지 입니다.<button onclick="insertsurvey.ma">설문조사 만들기</button></h1>
	${lec }
		
		<jsp:include page="../include/footer.jsp"/>
</body>
</html>
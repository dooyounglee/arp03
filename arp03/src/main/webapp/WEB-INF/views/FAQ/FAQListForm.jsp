<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

ul,li{

display:inline;

}

</style>
<body>
	<jsp:include page ="../include/header.jsp"/>

<h2 align="center">FAQ 입니다</h2>

<c:if test="${ mem.id eq 'admin' }">
	<button onclick="location.href='finsertForm.ad';">작성하기</button>
</c:if>
<nav align="center">
<ul >
	<li><a href="#">로그인</a></li>
	<li><a href="#">수강</a></li>
	<li><a href="#">홈페이지</a></li>
	<li><a href="#">기타</a></li>
</ul>
</nav>



</body>
</html>
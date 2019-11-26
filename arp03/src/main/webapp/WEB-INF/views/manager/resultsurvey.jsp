<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<body>
<jsp:include page="../include/header.jsp"/>
<div>
<c:forEach var="d" items="${rsq }" varStatus="status">
	<p>${d.question }</p>
	<p>${a[status.index] }</p>
</c:forEach>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
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
	<a href="write.qna">문의하기</a><br>
	<c:forEach var="qna" items="${list }">
		<a href="get.qna?qna_no=${qna.qna_no }">${qna }</a><br>
	</c:forEach>
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
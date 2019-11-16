<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<h1>${lec.title } 강의계획</h1>
	${lec }
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
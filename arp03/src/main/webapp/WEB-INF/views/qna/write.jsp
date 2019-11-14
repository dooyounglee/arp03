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
	
	<form action="${aaa }.qna" method="post" autocomplete=off>
		제목:<input name="title"><br>
		내용:<input name="content"><br>
		<button>완료</button>
	</form>
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
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

	<c:set var="mapping" value="make"/>
	<c:set var="e_no" value="0"/>	
	<c:if test="${!empty e }">
		<c:set var="mapping" value="edit"/>
		<c:set var="e_no" value="${e.e_no }"/>
	</c:if>
	
	<form action="${mapping }.ex" method="post" autocomplete=off>
		<input type="hidden" name="e_no" value="${e_no }">
		시험명:<input name="title" value="${e.title }"><br>
		시험날짜:<input type="date" name="examdate" value="${e.examdate.split(' ')[0] }"><br>
		총점:
		문제수:
		시험시간:
		<button>완료</button>
	</form>
	
	<jsp:include page="../../../include/footer.jsp"/>
</body>
</html>
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
${auth }
	<jsp:include page="../include/header.jsp"/>
	
	<c:if test="${auth.typee eq 's' }">
		<c:set var="s" value="checked"/>
	</c:if>
	<c:if test="${auth.typee eq 't' }">
		<c:set var="t" value="checked"/>
	</c:if>
		
	<form action="join.me" method="post" autocomplete=off>
		<input type="hidden" name="m_no" value="${auth.m_no }">
		<input type="radio" name="typee" value="s" ${s }>학생
		<input type="radio" name="typee" value="t" ${t }>선생님<br>
		id:<input name="id"><br>
		pw:<input name="pw"><br>
		pw2:<input><br>
		이름:<input name="name" value="${auth.name }"><br>
		phone:<input name="phone" value="${auth.phone }"><br>
		email:<input name="email" value="${auth.email }"><br>
		<button>회원가입</button>
	</form>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
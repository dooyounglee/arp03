<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var = "d"/>
<form action="insertsurvey.ma">
	<input type="text" name="lec_no" value="${lec.lec_no}" readonly>
	<input type="text" name="m_no" value="${mem.m_no }" readonly>
	<input type="text" name="title" placeholder="제목">
	<input type="text" name="enrolldate" value="${d }" readonly>
	<input type="text" name="q1" placeholder="질문1"> 
	<input type="text" name="a1" placeholder="답1">
	<input type="text" name="q2" placeholder="질문2">
	<input type="text" name="a2" placeholder="답2">
	<input type="text" name="q3" placeholder="질문3">
	<input type="text" name="a3" placeholder="답3">
	<button type="submit">등록</button>
	<button type="reset">취소</button>
</form>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
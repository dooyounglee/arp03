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
${s };
<jsp:include page="../include/header.jsp"/>
<fmt:parseDate value="${ssq}" pattern="yyyy-MM-dd" var="e"/> 
<fmt:formatDate value="${e}" pattern="yyyy-MM-dd" var = "d"/>

<form action="resultsurvey.ma">
	<h3>설문조사 완료한 사람들</h3>
	<c:forEach var="Y" items="${Ysq }">
	<q>${Y.m_no }, ${Y.name }</q>
	</c:forEach>
	<h3>설문조사 안한 사람들</h3>
	<c:forEach var="N" items="${Nsq }">
	<q>${N.m_no }, ${N.name }</q>
	</c:forEach>
	
	<input type="hidden" value="${su_no }" name="su_no">
	<button type="submit">설문조사 결과보기</button>	
	<input type="button" value="뒤로가기" onclick="location.href='selectsurvey.ma';">
	
	</form>
	<br>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
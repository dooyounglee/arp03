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

<form action="insertcompletesurvey.ma">
	<input type="hidden" name="su_no" value="${ssu }">
	<input type="text" name="lec_no" value="${lec.lec_no}" readonly>
	<input type="text" value="${mem.name }" readonly>
	<input type="text" name="title" value="${title }"placeholder="제목" readonly>
	<input type="text" name="enrolldate" value="${d}" readonly>
	
	<c:forEach items="${s }" var="a" varStatus="status">
	<input type="text" value="${a.question }"  readonly>
	<input type="text" name="answer[${status.index }]" placeholder="답변" required>
	</c:forEach>
	
	<button type="submit">설문완료</button>
	
</form>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
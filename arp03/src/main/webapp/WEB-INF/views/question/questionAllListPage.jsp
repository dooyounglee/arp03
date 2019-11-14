<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#cu{
		cursor:pointer;
	}
</style>
</head>
<body>

<jsp:include page="../include/header.jsp"/>
	
	<h1 align="center">강의별 커뮤니티 리스트</h1>
	
		<%-- <c:if test="${ !empty loginUser }">
		
		</c:if> --%>
	
	<table align="center" border="1" cellspacing="0" width="800">
		<tr>
			<th width="30">강의번호</th>
			<th width="200">강의명</th>
			<th width="30">개강날짜</th>
			<th width="40">요일</th>
		</tr>
		
		<c:forEach items="${ lecList }" var="c">
			<tr id="cu" onclick="location.href='question.qu?lec_no=${c.lec_no}';" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">
				<td>${ c.lec_no }</td>
				<td>${ c.title }</td>
				<td>${ c.startdate }</td>
				<td>${ c.dayofweek }</td>
			</tr>
			</a>
		</c:forEach>
	</table>
	
	<script>
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page ="../include/header.jsp"/>
<h2 align="center">공지사항입니다.</h2>
<c:if test ="${mem.id eq 'admin' }">
<button onclick ="location.href='ninsertForm.ad';">작성하기</button>
</c:if>

<br>
<table align="center" border="1" cellspacing="0" width="700"> 
<tr>
	<th>번호</th>
	<th width="300">제목</th>
	<th>작성자</th>
	<th>작성일</th>
	<th>조회수</th>
</tr>
<c:forEach items="${ list }" var="n">
	<tr>
		<td>${ n.n_no }</td>
		<td>${ n.title }</td>
	  <td>관리자</td>
		<td>${ n.regdate }</td>
		<td>${ n.vcount }</td>
	</tr>
</c:forEach>

</table>


</body>
</html>
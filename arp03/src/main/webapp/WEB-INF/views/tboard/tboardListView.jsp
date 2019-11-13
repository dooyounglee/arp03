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
	<jsp:include page="../include/header.jsp"/>
<h1 align="center">게시판 리스트</h1>

<button onclick ="location.href='insertTBoardFrom.do';">글쓰기</button>
<table align="center" border="1" cellspacing="0" width="700">
		<tr>
			<th>번호</th>
			<th width="300">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>첨부파일</th>
		</tr>
		<c:forEach items="${ list }" var="b">
			<tr>
				<td>${ b.b_no }</td>
				<td>${ b.title }</td>
				<td>${ b.m_no }</td>
				<td>${b.regdate }</td>
				<td>${ b.vcount }</td>
				<c:if test="${ b.fileStatus eq 'Y' }">
				<td>있음</td>
				</c:if>
				<c:if test="${ b.fileStatus eq 'N' }">
				<td>없음</td>
				</c:if>
				
				
			</tr>
		</c:forEach>
			
</table>

</body>
</html>
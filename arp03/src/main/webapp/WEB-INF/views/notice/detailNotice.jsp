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
	
	<h1 align="center">게시글 상세보기</h1>
	<br>
	
	<table align="center" border=1px >
	
		<tr>
			<td colspan="2" align="center">${ n.n_no }번 글 상세보기</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${ n.title }</td>		
		</tr>
		<tr>
			<td>작성자</td>
			<td>관리자</td>		
		</tr>
		<tr>
			<td>내용</td>
			<td>${ n.content }</td>		
		</tr>
		
	</table>
	
	<button onclick="location.href= 'nlist.ad';" align="center">리스트로 돌아가기</button>
	
	<c:if test="${mem.id eq 'admin' }">
	<a href="nupdateForm.ad?n_no=${ n.n_no }">수정하기</a>
	<a href="ndelete.ad?n_no=${ n.n_no }">삭제하기</a>
	</c:if>	
</body>
</html>
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
	
	<table align="center">
		<tr>
			<td colspan="2" align="center">${ b.b_no }번 글 상세보기</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${ b.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${ b.content }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="#">신고</button>
				<c:if test="${ mem.m_no eq b.m_no }">
					<button type="button" onclick="location.href='bupdateView.do?id=${b.b_no}';">수정</button>
					<button type="button" onclick="location.href='bdelete.do?id=${b.b_no}';">삭제</button>
				</c:if>
			</td>
		</tr>
	</table>
	
	<br>
	<br>
	
	<!-- 댓글 등록 부분 -->
	<table align="center" border="1" cellspacing="0">
		<tr>
			<td><textarea cols="55" rows="3" id="rContent"></textarea></td>
			<td><button id="rBtn">등록</button></td>
		</tr>
	</table>
	<!-- 댓글 목록 부분 -->
	<table align="center" width="500" border="1" cellspacing="0" id="rtb">
		<thead>
			<tr>
				<td colspan="3"><b id="rCount"></b></td>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	
	<h1 align="center">질문 게시판 리스트</h1>
	
	<h3 align="center">
		총 게시글 갯수 : ${ pi.listCount } 페이지 : ${ pi.currentPage } / ${ pi.maxPage }
		<c:if test="${ !empty loginUser }">
			<button onclick="">글쓰기</button>
		</c:if>
	</h3>
	
	<table align="center" border="1" cellspacing="0" width="800">
		<tr>
			<th width="25">번호</th>
			<th width="180">제목</th>
			<th width="50">회원번호</th>
			<th width="50">작성일</th>
			<th width="25">조회수</th>
			<th width="25">신고수</th>
			<th width="35">첨부파일</th>
		</tr>
		<c:forEach items="${ qList }" var="q">
			<tr>
				<td>${ q.q_no }</td>
				<td>${ q.title }</td>
				<td>${ q.m_no }</td>
				<td>${ q.regdate }</td>
				<td>${ q.vcount }</td>
				<td>${ q.dcount }</td>
				<td>
					<c:if test="${ !empty q.originalName }">
						<img align="center" width="30" src="siraFile/클립1.svg"/>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
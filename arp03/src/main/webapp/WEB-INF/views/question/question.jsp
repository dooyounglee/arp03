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
	
	<h1 align="center">강의번호: 게시판</h1>
	
	<h3 align="center">
		총 게시글 갯수 : ${ pi.listCount } 페이지 : ${ pi.currentPage } / ${ pi.maxPage }
		<!-- 로그인이 된 상태에서는 글쓰기 버튼 보이게 / 일단 테스트해볼때 방해되니까 주석처리닷..-->
	<%-- 	<c:if test="${ !empty mem }"> --%>
			<button onclick="location.href='qWriteForm.qu';">글쓰기</button>
		<%-- </c:if> --%>
	</h3>
	
	<table align="center" border="1" cellspacing="0" width="800">
		<tr>
			<th width="25">번호</th>
			<th width="180">제목</th>
			<th width="50">회원이름</th>
			<th width="50">작성일</th>
			<th width="25">조회수</th>
			<th width="25">신고수</th>
			<th width="35">첨부파일</th>
		</tr>
		<c:forEach items="${ qList }" var="q">
			<tr>
				<td>${ q.q_no }</td>
				<td>${ q.title }</td>
				<td>${ q.name }</td>
				<td>${ q.regdate }</td>
				<td>${ q.vcount }</td>
				<td>${ q.dcount }</td>
				<td>파일표시될곳</td>
<%-- 				<td>
					<c:if test="${ !empty q.originalName }">
						<img align="center" width="30" src="siraFile/클립1.svg"/>
					</c:if>
				</td> --%>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
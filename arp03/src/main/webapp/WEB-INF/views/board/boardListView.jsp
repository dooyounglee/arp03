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
	
	<h3 align="center">총 게시글 갯수 : ${pi.listCount} 페이지 : ${ pi.currentPage } /${ pi.maxPage } 
		<c:if test="${ !empty mem }">
		<button onclick="location.href='binsertForm.do';">글쓰기</button>
		</c:if>
	</h3>
	
	<table align="center" border="1" cellspacing="0" width="700">
		<tr>
			<th>번호</th>
			<th width="300">제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${ list }" var="b">
			<tr>
				<td>${ b.b_no }</td>
				<td>
					<c:if test="${ !empty mem }">
						<a href="bdetail.do?id=${ b.b_no }">${ b.title }</a>
					</c:if>
					<c:if test="${ empty mem }">
						${ b.title }
					</c:if>
				</td>
				<td>익명</td>
				<td>${ b.regdate }</td>
				<td>${ b.vcount }</td>
			</tr>
		</c:forEach>
		
		<!-- 페이징 처리 -->
		<tr align="center" height="20">
			<td colspan="5">
				<!-- 이전 -->
				<c:if test="${ pi.currentPage eq 1 }">
					[prev]
				</c:if>
				<c:if test="${ pi.currentPage ne 1 }">
					<c:url value="blist.do" var="prev">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ prev }">[prev]</a>
				</c:if>
				<!-- 페이지 -->
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:if test="${ p eq pi.currentPage }">
						<font color="gray">${ p }</font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url value="blist.do" var="page">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<a href="${ page }"> ${ p } </a>
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${ pi.currentPage eq pi.maxPage }">
					[next]
				</c:if>
				<c:if test="${ pi.currentPage ne pi.maxPage }">
					<c:url value="blist.do" var="next">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<a href="${ next }">[next]</a>
				</c:if>
				
			</td>
		</tr>
	</table>
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
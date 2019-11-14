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
	
	<c:if test="${ !empty mem }">
		<button onclick ="location.href='insertTBoardFrom.do';">글쓰기</button>
	</c:if>

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
				<c:if test="${ b.imageStatus eq 'Y' }">
				<td><a href="tbdetail.do?b_no=${ b.b_no }">${ b.title }<img src="resources/image/imgIcon.jpg" width="17px" height="17px"/></a></td>
				</c:if> 
				<c:if test="${ b.imageStatus eq 'N' }">
				<td><a href="tbdetail.do?b_no=${ b.b_no }">${ b.title }</a></td>
				</c:if>
				<td>${ b.name }</td>
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

		<!-- 페이징 처리 -->
		<tr align="center" height="20">
			<td colspan="6">
				<!-- [이전] -->
				<c:if test="${ pi.currentPage eq 1 }">
					[이전] 
				</c:if>
				<c:if test="${ pi.currentPage ne 1 }">
					<c:url value="tblist.do" var="before">
						<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
					</c:url>
					<a href="${ before }">[이전] </a>	
				</c:if>
				
				<!-- [페이지] -->
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"> [${ p }] </font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url value="tblist.do" var="page">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<a href="${ page }"> ${ p } </a>
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage eq pi.maxPage }">
					 [다음]
				</c:if>
				<c:if test="${ pi.currentPage ne pi.maxPage }">
					<c:url value="blist.do" var="after">
						<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
					</c:url>
					<a href="${ after }"> [다음]</a>
				</c:if>
			</td>
		</tr>

</body>
</html>
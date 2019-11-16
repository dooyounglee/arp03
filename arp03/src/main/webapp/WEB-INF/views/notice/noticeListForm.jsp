<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	String totalVacation = request.getParameter("totalVacation");

%>
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
		<td><a href="ndetail.ad?n_no=${ n.n_no }">${ n.title }</a></td>
	  <td>admin</td>
		<td>${ n.regdate }</td>
		<td>${ n.vcount }</td>
	</tr>
</c:forEach>

<!-- 페이징처리 -->
<tr align="center" height="20">
			<td colspan="6">
				<!-- [이전] -->
				<c:if test="${ pi.currentPage eq 1 }">
					[이전] 
				</c:if>
				<c:if test="${ pi.currentPage ne 1 }">
					<c:url value="nlist.ad" var="before">
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
						<c:url value="nlist.ad" var="page">
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
					<c:url value="nlist.ad" var="after">
						<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
					</c:url>
					<a href="${ after }"> [다음]</a>
				</c:if>
			</td>
		</tr>
</table>



</body>
</html>
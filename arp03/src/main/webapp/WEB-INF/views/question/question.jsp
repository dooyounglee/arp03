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
		수강페이지
	<a href="">메인</a>
	<a href="">강의계획</a>
<%-- 	<a href="question.qu?lec_no=${ c.lec_no }">질문게시판</a> --%>
	<a href="question.qu?lec_no=${ lec.lec_no }">질문게시판</a>
	<a href="">내 출석</a>
	<a href="">내 점수</a>
	
	<h1 align="center">${ lec.lec_no }번 강의_${ lec.title } 게시판</h1>
	
	<h3 align="center">
		총 게시글 갯수 : ${ pi.listCount } 페이지 : ${ pi.currentPage } / ${ pi.maxPage }
		<!-- 로그인이 된 상태에서는 글쓰기 버튼 보이게 / 일단 테스트해볼때 방해되니까 주석처리닷..-->
	<%-- 	<c:if test="${ !empty mem }"> --%>
			<button onclick="location.href='qWriteForm.qu?lec_no=${lec.lec_no}';">글쓰기</button>
		<%-- </c:if> --%>
	</h3>
	
	<table align="center" border="1" cellspacing="0" width="800">
		<tr>
			<th width="25">번호</th>
			<th width="180">제목</th>
			<th width="50">회원이름</th>
			<th width="50">작성일</th>
			<th width="25">조회수</th>
			<th width="35">첨부파일</th>
			<th width="25">답변여부</th>
		</tr>
		<c:forEach items="${ qList }" var="q">
			<tr>
				<td>${ q.q_no }</td>
				<td>
					<a href="qdetail.qu?q_no=${ q.q_no }">${ q.title }</a>
				</td>
				<td>${ q.name }</td>
				<td>${ q.regdate }</td>
				<td>${ q.vcount }</td>
				<td>${ q.fileox } </td>
				<td>${ q.isreply }</td>
			</tr>
		</c:forEach>
		
		<!-- 페이징 -->
		<tr align="center" height="20">
			<td colspan="7">
				<!-- 이전 -->
				<c:if test="${ pi.currentPage eq 1 }">
					이전
				</c:if>
				<c:if test="${ pi.currentPage ne 1 }">
					<c:url value="question.qu" var="before">
						<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
						<c:param name="lec_no" value="${ lec.lec_no }"/>
					</c:url>
					<a href="${ before }"> 이전 </a>
				</c:if>
				<!-- 페이지 -->
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"> ${ p } </font>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url value="question.qu" var="page">
								<c:param name="currentPage" value="${ p }"/>
								<c:param name="lec_no" value="${ lec.lec_no }"/>
							</c:url>
							<a href="${ page }"> ${ p } </a>
						</c:if>
					</c:forEach>
				<!-- 다음 -->
				<c:if test="${ pi.currentPage eq pi.maxPage }">
					다음
				</c:if>
				<c:if test="${ pi.currentPage ne pi.maxPage }">
					<c:url value="question.qu" var="after">
						<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
						<c:param name="lec_no" value="${ lec.lec_no }"/>
					</c:url>
					<a href="${ after }"> 다음 </a>
				</c:if>
			</td>
		</tr>
		
		
	</table>
</body>
</html>
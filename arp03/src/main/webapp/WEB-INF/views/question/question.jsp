<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판</title>
<style>
	a{
		text-decoration:none;
	}
</style>
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
	<c:set var="loop_flag" value="false"/>
		<c:forEach items="${ qList }" var="q" varStatus="status">
			<c:if test="${ not loop_flag }">
				${ status.count }
				<c:if test="${status.count == 1 }">
				<button style="cursor:pointer" onclick="location.href='qWriteForm.qu?lec_no=${lec.lec_no}&name=${ q.name }';">글쓰기</button>
					<c:set var="loop_flag" value="true"/>
				</c:if>
			</c:if>
		</c:forEach>	
	<%-- </c:if> --%>
	</h3>
	
	<table align="center" border="1" cellspacing="0" width="800">
		<tr>
			<th width="25">번호</th>
			<th width="180">제목</th>
			<th width="20">회원이름</th>
			<th width="50">작성일</th>
			<th width="30">조회수</th>
			<th width="40">첨부파일</th>
			<th width="38">답변여부</th>
			
		</tr>
		<c:if test="${ empty qList }">
			<tr align="center">
				<td colspan="7">아직 게시글이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach items="${ qList }" var="q">
			<tr align="center">
				<td>${ q.q_no }</td>
				<td>
					<a href="qdetail.qu?q_no=${ q.q_no }&name=${ q.name }">${ q.title }</a>
				</td>
				<td>${ q.name }</td>
				<td>${ q.regdate }</td>
				<td>${ q.vcount }</td>
				
				<c:if test="${ q.fileox eq 'Y' }">
					<td><img width="15" src="resources/siraFile/클립2.svg"></td>
				</c:if>
				<c:if test="${ q.fileox ne 'Y' }">
					<td>${ q.fileox } </td>
				</c:if>
				<td>${ q.isreply }</td>
			</tr>
		</c:forEach>
		
		<c:if test="${ !empty qList }">
			<!-- 페이징 -->
			<tr align="center" height="20">
				<td colspan="7">
					<!-- 이전 -->
					<c:if test="${ pi.currentPage eq 1 }">
						
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
						
					</c:if>
					<c:if test="${ pi.currentPage ne pi.maxPage && pi.currentPage eq 1 && pi.maxPage ne 0 }">
						<c:url value="question.qu" var="after">
							<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
							<c:param name="lec_no" value="${ lec.lec_no }"/>
						</c:url>
						<a href="${ after }"> 다음 </a>
					</c:if>
				</td>
			</tr>
		</c:if>
		
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="http://code.jquery.com/jquery-3.2.1.js"></script> 
</head>
<body>
	${mem }<br>
	<c:set var="cp" value="arp"/>
	<a href="/${cp }">메인</a>
	<c:if test="${!empty mem }">
		${mem.name }님 안녕하세요
	</c:if>
	<a href="login.me">로그인</a>
	<a href="logout.me"><del>로그아웃</del></a>
	
	<hr>
	
	학생
	<a href="lectureList.ad"><del>내 수강목록</del></a>
	<a href="blist.do">자유 게시판</a>
	<a href="">내 문의</a>
	<a href="">내 정보</a>
	
	<hr>
	
	선생님
	<a href="lectureList.ad"><del>내 수업목록</del></a>
	<a href="blist.do">자유 게시판</a>
	<a href="tblist.do">선생님 게시판</a>
	<a href="">내 문의</a>
	<a href="">내 정보</a>
	
	<hr>
	
	수강페이지
	<a href="">메인</a>
	<a href="">강의계획</a>
	<a href="question.qu">질문게시판</a>
	<a href="">내 출석</a>
	<a href="">내 점수</a>
	
	<hr>
	
	관리자
	<a href="lectureList.ad"><del>강좌관리</del></a>
	<a href="boardList.ad"><del>게시글 관리</del></a>
	<a href="replyList.ad">댓글 관리</a>
	<a href="">문의관리</a>
	<a href="">신고관리</a>
	<a href="memberList.ad"><del>회원관리</del></a>
	<a href="nlist.ad">공지사항</a>
	<a href="">faq</a>
<hr>
</body>
</html>
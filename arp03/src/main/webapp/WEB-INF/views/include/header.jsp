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
	<a href="find.me"><del>id/pw찾기</del></a>
	
	<hr>
	
	학생
	<a href="lectureList.ad"><del>내 수강목록</del></a>
	<a href="blist.do">자유 게시판</a>
	<a href="mylist.qna"><del>내 문의</del></a>
	<a href="myInfo.me"><del>내 정보</del></a>
	<a href="vlist.me">내 휴가</a>
	
	<hr>
	
	선생님
	<a href="lectureList.ad"><del>내 수업목록</del></a>
	<a href="blist.do">자유 게시판</a>
	<a href="tblist.do">선생님 게시판</a>
	<a href="mylist.qna"><del>내 문의</del></a>
	<a href="myInfo.me"><del>내 정보</del></a>
	<a href="">학생휴가 관리</a>
	
	<hr>
	
	<c:if test="${!empty lec }">
		수강페이지
		<a href="">메인</a>
		<a href="">강의계획</a>
		<a href="question.qu?lec_no=${ lec.lec_no }">질문게시판</a>
		<a href="">내 출석</a>
		<a href="">내 점수</a>
		<hr>
	</c:if>

	
<a href="lectureList.ad"><del>강좌관리</del></a>
	<a href="boardList.ad"><del>게시글 관리</del></a>
	<a href="replyList.ad"><del>댓글 관리</del></a>
	<a href="qnaList.ad"><del>문의관리</del></a>
	<a href="declareList.ad"><del>신고관리</del></a>
	<a href="memberList.ad"><del>회원관리</del></a>
	<a href="vationList.ad">휴가관리</a>
	<a href="nlist.ad"><del>공지사항</del></a>
	<a href="flist.ad"><del>faq</del></a>
	
<hr>
</body>
</html>
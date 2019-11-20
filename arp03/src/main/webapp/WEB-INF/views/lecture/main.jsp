<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h1>${lec.title }페이지 입니다.<button onclick="location.href='selectsurvey.ma';">설문조사 목록으로 가기</button></h1>
	${lec }

	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
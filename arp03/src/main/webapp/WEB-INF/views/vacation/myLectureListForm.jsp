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

<jsp:include page = "../include/header.jsp"/>

<h2 align="center">휴가를 쓸 수업</h2>

<h2 align="center">${mem.m_no }의 강의</h2>
<button onclick="location.href='vlist.me';">내가 신청한 휴가리스트</button>
<table  align="center" border="1" cellspacing="0" width="700" method="post">
	<tr>
		<th>강의번호</th>
		<th>강의명</th>
		<th>시작일</th>
		<th>시작시간</th>
		<th>휴가신청</th>
	</tr>
	
	<c:forEach items="${list }" var="c">
	<tr>
		<td>${c.lec_no }</td>
		<td>${c.title }</td>
		<td>${c.startdate }</td>
		<td>${c.starttime }</td>
		<td><a href="vinsertForm.me?m_no=${c.m_no }&lec_no=${c.lec_no}">휴가신청하기</a></td>
	</tr>
	</c:forEach>
	
		
	





</table>

</body>
</html>
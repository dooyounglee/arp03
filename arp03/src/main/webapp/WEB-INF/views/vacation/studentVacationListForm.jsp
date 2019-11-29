<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">학생 휴가 리스트 </h1>
<jsp:include page= "../include/header.jsp"/>

<table align="center" border="1" cellspacing="0" width="700"> 

<tr>
	<th>휴가번호</th>
	<th>강의번호</th>
	<th>강의명</th>
	<th>학생명</th>
	<th width="50">사유</th>
	<th width="100">휴가날짜</th>
	<th>작성일</th>

</tr>

<c:forEach items="${ list }" var="v">
	<tr>
		<td>${v.v_no}</td>
		<td>${v.lec_no }</td>
		<td>${v.title }</td>
		<td>${v.name }</td>
		<td><a href="vDetail.me?lec_no=${ v.lec_no }">${ v.vacation_title }</a></td>
		<td>${fn:substring(v.vacationdate , 0 ,10) }</td>
		<td>${v.application_date }</td>
		
	</tr>		
</c:forEach>
</table>

</body>
</html>
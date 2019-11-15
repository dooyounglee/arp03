<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 신청하기</title>
</head>
<body>
<jsp:include page= "../include/header.jsp"/>
	<h2 align="center"> 휴가 신청하기</h2>
	<form action ="vinsert.me" align="center">
	
	<input type="text" name="m_no" value="${ mem.m_no }"><br>
	<textarea name="reason" placeholer="이유를 입력하세요"></textarea><br>

	<table style="text-align:center;float:left;" align="center">
			<thead>
				<tr>
					<td colspan=1 id='prevmonth'><</td>
					<td colspan=5><span id="yyyy">2019</span>년 <span id="mm">8</span>월</td>
					<td colspan=1 id='nextmonth'>></td>
				</tr>
				<tr>
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</form>
	
</body>
</html>
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
	
	<h1 align="center">휴가 상세보기</h1>
	<br>
	<table border="1px">
	<tr>
	<th>선생님</th>
	<th>관리자</th>
	</tr>
	<tr>
	<td>${v.tstatus }</td>
	<td>${v.astatus }</td>
	</tr>
	</table>
	
	
	<table align="center" border="1px">
	
	<tr>
		<td colspan="2">${v.v_no}번 글 상세보기</td>
	</tr>
	<tr>
		
		<td>작성자</td>
		<td>${v.name}</td>
	</tr>
	<tr>
		<td>사유</td>
		<td>${v.reason }</td>
	</tr>	
	<tr>
		<td>휴가시작날짜</td>
		<td>${v.start_date }</td>
	</tr>
	<tr>
		<td>끝나는날짜</td>
		<td></td>
	</tr>
	<tr>
		<td>일수</td>
		<td>${v.date_count }일</td>
	</tr>
	<c:if test="${v.tstatus eq 'Y' || v.astatus eq 'Y'}">
		<td>출력하기</td>
		<td><button onclick="myvacation()">인쇄</button></td>
	</c:if>
	
	<tr>
	
	
	</tr>
	</table>
	<button onclick="location.href='vlist.me';" align="center">리스트로 돌아가기</button>
	<a href="vupdateForm.me?v_no=${ v.v_no }">수정하기</a>
	<a href="vdelete.me?v_no=${ v.v_no }" >삭제하기</a>

<script>


function myvacation() {
	  window.print("#tb");
	  
	}


</script>

</body>
</html>
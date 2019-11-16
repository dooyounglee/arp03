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

<jsp:include page= "../include/header.jsp"/>

<h1 align="center">내 휴가 리스트 </h1>

<button onclick="location.href='vinsertForm.me';">작성하기</button>
<table align="center" border="1" cellspacing="0" width="700"> 
<tr>
	<th>휴가번호</th>
	<th colspan="2">휴가시작일</th>
	<th>휴가끝나는일</th>
	<th>일수</th>
	<th>작성자</th>
	<th>작성일</th>
	
</tr>
<c:forEach items="${ list }" var="v">
	<tr>
		<td>${ v.v_no }</td>
		<td class="startDate" colspan="2">${v.start_date }</td>
			<td class="endDate"></td>
		<td class="dateCount"> ${v.date_count }일</td>
		
	
		<td>${mem.m_no }</td>
		<td>${v.application_date }</td>
	</tr>		
</c:forEach>

</table>

<script>

$(function(){
	
	var start_date = $(".startDate").text()//2019-01-01
	console.log(start_date)
	var yyyy= start_date.substr(0,4)
	console.log(yyyy)
	var MM = parseInt(start_date.substr(5,2))-1
	console.log(MM)
	var dd = parseInt(start_date.substr(8,2))
	console.log(dd)
	var howdate = parseInt($(".dateCount").text())
	
	var today=new Date(yyyy,MM,dd+howdate)			
	console.log(today.getFullYear())
	console.log(today.getMonth()+1)
	console.log(today.getDate())
	console.log(today)
		
			var date = String(today.getDate());
			var zerodate = "";
			
			if(today.getDate() < 10){
				
				var zerodate ="0"+date
				
			}else{
				
				var zerodate = date
			}

	
	
	 $(".endDate").text(today.getFullYear() + "-" + String(today.getMonth()+1)+"-" + zerodate)
	
	
});




</script>

</body>
</html>
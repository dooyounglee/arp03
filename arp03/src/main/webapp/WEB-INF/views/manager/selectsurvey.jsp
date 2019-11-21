<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<body>
<jsp:include page="../include/header.jsp"/>
${list }
	<table>
		<tr>
			<td>설문조사 제목</td>
			<td>작성일</td>
			<td>작성자</td>
			<td>강의명</td>
			<!-- 설문조사 인원/ 설문조사 총인원 있으면 좋을듯 -->
		</tr>
	<c:forEach var="d" items="${ list}">
		<tr>
			<td>${d.title }</td>
			<td>${d.enrolldate }</td>
			<td>${d.name }</td>
			<td>${d.title_1 }</td>
			<td type="hidden" value="${d.su_no }"></td>
		</tr>
	</c:forEach>
	</table>
	<script>
		$("table td").mouseenter(function(){
			$(this).parent().children().css({"background":"darkgray","cursor":"pointer"})
		}).click(function(){
			var no=$(this).parent().children().eq(4).val();
			location.href="detailsurvey.ma?su_no="+no;
		});
	</script>
	<button type="button" onclick="location.href='daysurvey.ma';">설문조사 만들기</button>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../include/header.jsp"/>
	
	<h1>회원관리</h1>
	<a href="insertMember.ad">회원등록</a><br>
	<a href="insertMemberToLecture.ad">학생을 강의에 꽂아주기</a><br>
	<c:forEach var="m" items="${list }">
		${m }<button onclick="banish(${m.m_no})">강퇴</button><button onclick="banishCancle(${m.m_no})">강퇴취소</button><br>
	</c:forEach>
	
	<form id="form" method='post'>
		<input type="hidden" name="m_no">
	</form>
	<script>
		function banish(m_no){
			var formm=$('#form').attr('action','banish.ad')
			formm.children('input').eq(0).val(m_no)
			formm.submit();
		}
		function banishCancle(m_no){
			var formm=$('#form').attr('action','banishCancle.ad')
			formm.children('input').eq(0).val(m_no)
			formm.submit();
		}
	</script>
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>
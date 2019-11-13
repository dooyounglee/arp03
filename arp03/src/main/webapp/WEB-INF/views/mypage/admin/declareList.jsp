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
	
	<h1>신고관리</h1>
	<c:forEach var="d" items="${list }">
		${d }<button onclick="ok(${d.d_no})">처리완료</button><br>
	</c:forEach>
	
	<form id="form" method='post'>
		<input type="hidden" name="d_no">
	</form>
	<script>
		function ok(d_no){
			var formm=$('#form').attr('action','okDeclare.ad')
			formm.children('input').eq(0).val(d_no)
			formm.submit();
		}
	</script>
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>
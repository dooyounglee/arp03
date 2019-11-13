<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<jsp:include page="../../include/header.jsp"/>
	
	<c:forEach var="b" items="${list }">
		${b }<button onclick="deleteBoard(${b.b_no})">삭제</button>
		<button onclick="deleteCancleBoard(${b.b_no})">삭제취소</button><br>
	</c:forEach>
	
	<form id="form" method='post'>
		<input type="hidden" name="b_no">
	</form>
	<script>
		function deleteBoard(b_no){
			var formm=$('#form').attr('action','deleteBoard.ad')
			formm.children('input').eq(0).val(b_no)
			formm.submit();
		}
		function deleteCancleBoard(b_no){
			var formm=$('#form').attr('action','deleteCancleBoard.ad')
			formm.children('input').eq(0).val(b_no)
			formm.submit();
		}
	</script>
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>
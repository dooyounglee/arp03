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
	
	<c:forEach var="r" items="${list }">
		${r }<button onclick="deleteReply(${r.r_no})">삭제</button>
		<button onclick="deleteCancleReply(${r.r_no})">삭제취소</button><br>
	</c:forEach>
	
	<form id="form" method='post'>
		<input type="hidden" name="r_no">
	</form>
	<script>
		function deleteReply(r_no){
			var formm=$('#form').attr('action','deleteReply.ad')
			formm.children('input').eq(0).val(r_no)
			formm.submit();
		}
		function deleteCancleReply(r_no){
			var formm=$('#form').attr('action','deleteCancleReply.ad')
			formm.children('input').eq(0).val(r_no)
			formm.submit();
		}
	</script>
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>
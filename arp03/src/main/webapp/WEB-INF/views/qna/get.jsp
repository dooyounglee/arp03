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
	<jsp:include page="../include/header.jsp"/>
	
	${qna }<br>
	<form action="answerQna.ad" method="post" autocomplete=off>
		<input type="hidden" name="qna_no" value="${qna.qna_no }">
		<input name="answer"><button>답</button><br>
	</form>
	<button onclick="del(${qna.qna_no})">삭제</button><br>
	
	<form id="form" method='post'>
		<input type="hidden" name="qna_no">
	</form>
	<script>
		function del(qna_no){
			var formm=$('#form').attr('action','del.qna')
			formm.children('input').eq(0).val(qna_no)
			formm.submit();
		}
	</script>
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
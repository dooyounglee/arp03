<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
${mem }

	<h1>수정</h1>
	<form action="update.me" method="post" autocomplete=off>
		<input type="hidden" name="m_no" value="${mem.m_no }">
		학생/선생번호:<input value="${mem.m_no }" disabled><br>
		id:<input value="${mem.id }"><br>
		이름:<input name="name" value="${mem.name }"><br>
		email:<input name="email" value="${mem.email }"><br>
		phone:<input name="phone" value="${mem.phone }"><br>
		<button>수정</button>
	</form>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
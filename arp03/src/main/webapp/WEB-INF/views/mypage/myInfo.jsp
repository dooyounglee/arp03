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
	
	<h1>내정보</h1>
	${mem }

	<h1>수정</h1>
	<form action="update.me" method="post" autocomplete=off>
		<input type="hidden" name="m_no" value="${mem.m_no }">
		학생/선생번호:<input value="${mem.m_no }" disabled><br>
		id:<input value="${mem.id }" disabled><br>
		이름:<input name="name" value="${mem.name }"><br>
		email:<input name="email" value="${mem.email }"><br>
		phone:<input name="phone" value="${mem.phone }"><br>
		<button>수정</button>
	</form>
	
	<h1>비번변경</h1>
	<form action="changePw.me" method="post" autocomplete=off>
		<input type="hidden" name="m_no" value="${mem.m_no }">
		현재:<input name="pw"><br>
		새 비번:<input name="newPw"><br>
		<button>변경</button>
	</form>
	
	<h1>탈퇴</h1>
	<form action="leave.me" method="post" autocomplete=off>
		<input type="hidden" name="m_no" value="${mem.m_no }">
		<button>탈퇴</button>
	</form>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
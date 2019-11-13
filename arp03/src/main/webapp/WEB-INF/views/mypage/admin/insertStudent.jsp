<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../include/header.jsp"/>
	
	<h2>학생등록</h2>
	<form action="insertMember.ad" method="post" autocomplete=off>
		<input type="hidden" name="typee" value="s">
		email:<input name="email"><br>
		수강할 강의:<input name="lec_no">이건근데, 따로 꽂아줘야 할듯. 한 학생당 한개만 하는게 아니라서.<br>
		<button>등록</button>
	</form>
	<br>
	
	<h2>티쳐등록</h2>
	<form action="insertMember.ad" method="post" autocomplete=off>
		<input type="hidden" name="typee" value="t">
		이름:<input name="name"><br>
		email:<input name="email"><br>
		phone:<input name="phone"><br>
		<button>등록</button>
	</form>
	
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>숙제만들기</h1>
	<form action="make.hw" method="post" autocomplete=off>
		숙제이름:<input name="title"><br>
		숙제제출:<input name="enddate"><br>
		<button>만들기</button>
	</form>
</body>
</html>
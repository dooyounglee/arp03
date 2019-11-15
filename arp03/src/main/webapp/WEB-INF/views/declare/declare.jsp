<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>신고하기</h1>
    
    <form action="insert.de" method="post" autocomplete=off>
    	신고사유
		<input type="radio" name="kind" value="1">이유1<br>
		<input type="radio" name="kind" value="2">이유2<br>
		<input type="radio" name="kind" value="3">이유3<br>
		<input type="radio" name="kind" value="4">이유4<br>
		<input type="radio" name="kind" value="5">이유5<br>
	
		내용:<input name="content">
		<button>신고</button>
    </form>
	
	
	
	
	
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
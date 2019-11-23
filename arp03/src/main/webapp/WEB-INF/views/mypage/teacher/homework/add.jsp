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
<h1>숙제 추가하기</h1>
<c:forEach var="hw" items="${list }">
	${hw }<button onclick="add(${hw.hw_no })">추가</button><br>
</c:forEach>

<script>
	var parent = window.opener;
	function add(hw_no){
		$.ajax({
			url:'addHomework.lec',
			type:'post',
			data:{
				hw_no:hw_no,
			},
			success:function(data){
				parent.location.href="homeworklist.lec"
			},
		})
	}
</script>
</body>
</html>
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
문제추가창${hw }<br>이미있는 문제면 추가버튼 안보이게?<br>
	<c:forEach var="p" items="${list }">
		<a href="get.pro?p_no=${p.p_no }">${p }</a>
		<button onclick="add(${p.p_no })">추가</button><br>
	</c:forEach>
<button onclick="send()">닫기</button>
<script>
	function send(){
		var parent = window.opener;
		window.close();
		parent.location.href="get.hw?hw_no=${hw.hw_no}";
	}
	function add(p_no){
		$.ajax({
			url:'addProblem.hw',
			type:'post',
			data:{
				hw_no:${hw.hw_no},
				p_no:p_no,
			},
			success:function(data){
				
			},
		})
	}
</script>
</body>
</html>
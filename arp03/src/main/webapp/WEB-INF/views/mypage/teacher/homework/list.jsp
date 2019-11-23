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
<button onclick="add()">숙제 추가</button>
<div id="homeworkArea">
	<div id="homeworkContent">
<c:forEach var="hw" items="${list }">
	<a href="getHomework.lec?hw_no=${hw.hw_no }">${hw }</a>
	<%-- <button onclick="solve(${hw.hw_no })">문제풀기</button> --%>
	<button onclick="answer(${hw.hw_no })">정답확인</button>
	<button onclick="del(${hw.hw_no })">삭제</button><br>
</c:forEach>
	</div>
</div>
<script>
	function add(){
		var url="homework.te";
        window.open(url,"","width=400,height=400,left=600");
	}
	function answer(hw_no){
		location.href="checkAnswer.hw?hw_no="+hw_no
	}
	function del(hw_no){
		$.ajax({
			url:'delHomework.lec',
			type:'post',
			data:{
				hw_no:hw_no,
			},
			success:function(data){
				$('#homeworkArea').load('homeworklist.lec #homeworkContent')
			},
		})
	}
</script>
</body>
</html>
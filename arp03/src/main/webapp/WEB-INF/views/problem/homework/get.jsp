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
${hw }
<button onclick="add()">추가하기</button><br>
<div id="problemArea">
	<div id="problemContent">
		<c:forEach var="p" items="${list }">
			${p }<button onclick="del(${p.p_no })">제거</button><br>
		</c:forEach>
	</div>
</div>
<script>
	function add(){
		var url="add.hw?hw_no=${hw.hw_no}";
        window.open(url,34,"width=400,height=400,left=600");
	}
	function del(p_no){
		$.ajax({
			url:'delProblem.hw',
			type:'post',
			data:{
				hw_no:${hw.hw_no},
				p_no:p_no,
			},
			success:function(data){
				$('#problemArea').load('get.hw?hw_no=${hw.hw_no} #problemContent')
			},
		})
	}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<body>
    <h1>신고하기</h1>
    
    	신고사유<br>
		<input type="radio" name="kind" value="1">이유1<br>
		<input type="radio" name="kind" value="2">이유2<br>
		<input type="radio" name="kind" value="3">이유3<br>
		<input type="radio" name="kind" value="4">이유4<br>
		<input type="radio" name="kind" value="5">이유5<br>
	
		내용:<input id="content">
		<button onclick="send()">신고</button>
	
	<script>
		function send(){
			var kind=$('input[name="kind"]:checked').val()
			var parent = window.opener;
			
 			$.ajax({
				url:'insert.de',
				type:'post',
				data:{
					kind:kind,
					content:$('#content').val(),
				},
				success:function(data){
					parent.location.href='declareList.ad';
					window.close();
				},
			})
			
		}
	</script>
	
	
	
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
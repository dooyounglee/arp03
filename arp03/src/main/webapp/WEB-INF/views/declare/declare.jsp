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
		<input type="radio" name="kind" value="1">영리목적/홍보<br>
		<input type="radio" name="kind" value="2">불법정보<br>
		<input type="radio" name="kind" value="3">음란성/선정성<br>
		<input type="radio" name="kind" value="4">욕설/인신공격<br>
		<input type="radio" name="kind" value="5">개인정보노출<br>
		<input type="hidden" id="obj" value=${ obj }>
		<input type="hidden" id="obj_no" value=${ obj_no }>
	
		내용:<input id="content">
		<button onclick="send();">신고</button>
	
	<script>
		console.log($('#obj_no').val());
		function send(){
			var kind=$('input[name="kind"]:checked').val()
			var parent = window.opener;
			
 			$.ajax({
				url:'insert.de',
				type:'post',
				data:{
					kind:kind,
					content:$('#content').val(),
					obj:$('#obj').val(),
					obj_no:$('#obj_no').val()
				},
				success:function(data){
					//parent.location.href='declareList.ad';
					window.close();
				},
			})
			
		}
	</script>
	
	
	
	
</body>
</html>
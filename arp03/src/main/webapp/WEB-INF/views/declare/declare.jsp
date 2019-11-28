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
	<%@ include file="../include/bhead.jsp"%>
	 <div class="card-body">
                       <h4 class="modal-title" id="myModalLabel">신고하기</h4>
               <div class="demo-radio-button">
                     <input name="kind" type="radio" id="radio_1" value="1">
                     <label for="radio_1">영리목적/홍보</label><br>
                     <input name="kind" type="radio" id="radio_2" value="2">
                     <label for="radio_2">불법정보</label><br>
                     <input name="kind" type="radio" id="radio_3" value="3">
                     <label for="radio_3">음란성/선정성</label><br>
                     <input name="kind" type="radio" id="radio_4" value="4">
                     <label for="radio_4">욕설/인신공격</label><br>
                     <input name="kind" type="radio" id="radio_5" value="5">
                     <label for="radio_5">개인정보노출</label><br>
                     <h6>신고사유</h6>
               <input name="content" id="declareContents" type="text" required>
               <input type="hidden" id="obj" value="${ obj }">
               <input type="hidden" id="obj_no" value="${ obj_no }">
              </div>
       </div>
       <div class="modal-footer">
             <button onclick="send();" type="button" id="declareR" class="btn btn-primary">신고하기</button>
       </div>
	
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
					content:$('#declareContents').val(),
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<meta charset="UTF-8">
<title>Send Message</title>
</head>
<body>
<form action="insertMsg.do">
<h3>쪽지보내기</h3>
제목 : <input type="text" name="title"><br>
<input type="hidden" value="${ mem.m_no }" name="s_no">
<input type="hidden"  name="g_no" id="g_no">
받는사람 : <input type="text" name="name" id="g_list" style="width:250px" placeholder="이름뒤에 -와 회원번호를 입력해주세요"><input type="checkbox" id="me" name="me" value="${mem.name}-${mem.m_no}">나에게 쓰기<br>
<textarea rows="3" cols="50" name="content">
</textarea>

<button type="submit">보내기</button>
</form>
<script>

$(document).ready(function() {
	$("#g_list").autocomplete({
		source : function(request, response) {

			$.ajax({

				url : "autocomplete",
				type : "post",
				dataType : "json",
				data: request,

				success : function(data) {

					var result = data;
					response(result);
				},

				error : function(data) {
					alert("에러가 발생하였습니다.")
				}
			});
		}
	});
});


$("#g_list").change(function(){
	var name = $(this).val();
	console.log(name);
	var mno =name.split("-")[1];
	console.log(mno);
	
	$("#g_no").val(mno);
	
});

$("#me").on("click", function(){
	var me = $(this).val();
	console.log(me);
	var mno =me.split("-")[1];
	$("#g_list").val(me);
	console.log(mno);
	$("#g_no").val(mno)

	
})

 $("#me").click(function(){ 
       if($("#me").prop("checked")){ 
          $("input[name=me]").prop("checked",true);
	        var me = $(this).val();
	      	console.log(me);
	      	var mno =me.split("-")[1];
	      	$("#g_list").val(me);
	      	console.log(mno);
	      	$("#g_no").val(mno);
	        $("#g_list").prop("readonly",true);
          
      }else{
         $("input[name=me]").prop("checked",false); 
         $("#g_list").val("");
         $("#g_no").val("");
         $("#g_list").prop("readonly",false);
      }    
 })


	/* $("#g_list").change(function(){
		var name = $(this).text();
			
		$.ajax({
			url:"selectMno",
			type:"post",
			data:{name:name},
			success:function(data){
				if(data>0){
					console.log(data);
				}else{
					console.log("실패");
				}
			},
			error:function(){
				console.log("ajax 통신 실패");
			}
			})
		}) */



</script>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate value="${today }" pattern="yyyy-MM-dd" var = "d"/>
<form action="insertsurvey.ma" id="frm">
	<input type="text" name="lec_no" value="${lec.lec_no}" readonly>
	<input type="hidden" name="m_no2">
	<input type="text" name="m_no" value="${mem.m_no }" readonly>
	<input type="text" name="title" placeholder="제목" required>
	<input id="point" type="text" name="enrolldate" value="${d }" readonly>
	<input type="text" name="q1" value="11">
	<div id ="div"></div>
	<button id="insertquestion" type="button">질문추가</button>
	<button id="deletequestion" type="button">질문삭제</button>
	<input type="hidden" name="issurvey">
	<button  id="submitquestion" type="submit">등록</button>
	<button type="reset">취소</button>
</form>
<script>
	$(document).ready(function(){
		var lastq=0;
		var removesucess=0;
		var q=1;
		$("#insertquestion").click(function(){
			var input = $("<input>").attr("placeholder", "질문"+q).attr("name", "question["+lastq+"]").attr("required", true);
			/* var hid = $("<input>").attr("type", "hidden").attr("name", "sq_no["+lastq+"]").attr("value", q);
			$("#div").append(hid); */
			$("#div").append(input);
			
			lastq+=1;
			q+=1;	
		});
		$("#deletequestion").click(function(){
			if(lastq>0){
			var emp = confirm("확인을 누르시면 질문이 모두 사라집니다.");
			if(emp==true){
			$("#div").empty();
		}
		/* 	removesucess=1;
			if(removesucess==1){
			removesucess=0;
			lastq-=1;
			} */
			lastq=0;
			q=1;
			}
		});	
	/* 	$("#submitquestion").click(function(){		
			var qla=$("<input>").attr("type", "hidden").attr("value", lastq).attr("name", "qlast");
			$("#div").append(qla);
			$("#frm").submit();
		}); */
	});


</script>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
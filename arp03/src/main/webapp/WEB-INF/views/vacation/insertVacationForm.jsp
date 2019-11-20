<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 신청하기</title>
<!-- jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!--  jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!--jQuery UI 라이브러리 js파일  -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
</head>
<body>
<jsp:include page= "../include/header.jsp"/>

	<h2 align="center"> 휴가 신청하기</h2>
	<form action ="vinsert.me" align="center" >
	
	<input type="text" name="m_no" value="${param.m_no }" readonly><br>
	<input type="text" name="lec_no" value="${param.lec_no }" readonly><br>
	
	<input type="text" name="title" value="${param.title }" readonly><br>
	
	<textarea name="reason"  rows="4" cols="50" placeholder="사유입력"></textarea><br>
	<input type="text" id="testDatepicker" name="start_date">
	
	<select id="howdate" name="date_count">
		<option>----</option>
		<option value="1">1일</option>
		<option value="2">2일</option>
		<option value="3">3일</option>
		<option value="4">4일</option>
		<option value="5">5일</option>
	</select>
	<br>
	<input type="text" id="totalVacation" name="totalVacation" readonly> <br>
	
	
	
	<button type="submit">등록하기</button> 
	<button type="button" onclick="location.href='vlist.me';">목록으로</button>
	</form>
	<script>
	
	$(function() {
	    $( "#testDatepicker" ).datepicker({
	    	 changeMonth: true, 
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	   		 dateFormat: "yymmdd",
	   		 minDate: -0,
	   		 maxDate:"+100D",
	   		showButtonPanel: true, 
	         currentText: '오늘 날짜', 
	         closeText: '닫기'      
	    });
	});
	
	
	
	</script>
	
   
   <script>
   
   var jq132 = jQuery.noConflict();
   
   </script>
	
	<script>
		$("#howdate").on("change", function(){
			var start_date = $("#testDatepicker").val()//20190101
			var yyyy= start_date.substr(0,4)
			var MM = parseInt(start_date.substr(4,2))-1
			var dd = parseInt(start_date.substr(6,2))
			var howdate = parseInt($(this).val())
			var today=new Date(yyyy,MM,dd+howdate)			
			console.log(today.getFullYear())
			console.log(today.getMonth()+1)
			console.log(today.getDate())
			console.log(today)
			
			var date = String(today.getDate());
			var zerodate = "";
			var message ="날짜를 선택해주세요"
		

			
			if(today.getDate() < 10){
				
				var zerodate ="0"+date
				
			}else{
				
				var zerodate = date
			}

			if(String(today.getFullYear()) == "NaN"){
				$("#totalVacation").val(message)
			}else{
				
			$("#totalVacation").val(String(today.getFullYear()) + String(today.getMonth()+1) + zerodate )
				
			}
			
			
		})
	
	</script>
	
</body>
</html>
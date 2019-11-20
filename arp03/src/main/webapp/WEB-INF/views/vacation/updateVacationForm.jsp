<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page = "../include/header.jsp"/>
<form action="vupdate.me">
	<table align="center">
	<input type="hidden" name="v_no" value="${ v.v_no }">
	<tr>
	
	<td>작성자:</td>
	<td><input type="text" value="${v.name}" readonly></td>
	<td>이유:</td>
	<td><input type="text" value="${v.reason }"></td>
	<td>날짜:</td>
	<td><input type="text" id="testDatepicker" name="start_date" value="${v.start_date }"></td>
	<td>
		<select id="howdate" name="date_count" >
		<option>----</option>
		<option value="1">1일</option>
		<option value="2">2일</option>
		<option value="3">3일</option>
		<option value="4">4일</option>
		<option value="5">5일</option>
	</select>
	</td>
	<td>
	<input type="text" id="totalVacation" name="totalVacation" readonly>
	</td>
	</tr>
	</table>



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
	         closeText: '닫기', 
	         
	            
	    });
	});
	
	
	
	</script>
	 <script src='jquery-3.2.1.js'></script>
   
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
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
	<form action ="vinsert.me" align="center">
	
	<input type="text" name="m_no" value="${ mem.m_no }"><br>
	<textarea name="reason" placeholer="이유를 입력하세요"></textarea><br>
	<input type="text" id="testDatepicker" name="start_date">
	
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
	   		 maxDate:"+30D",
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
	
	
</body>
</html>
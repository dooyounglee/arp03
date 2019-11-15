<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<body>
	<jsp:include page ="../include/header.jsp"/>
	
	
	<h2 align="center"> FAQ 작성하기</h2>
	<br>
	
	<form action="finsert.ad" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<input type="hidden" name="m_no" value="${ mem.m_no }">
			</tr>
			<tr>
				<td>구분</td>
				<td>
				<select name="category">
				<option value="로그인">로그인</option>
				<option value="수강">수강</option>
				<option value="홈페이지">홈페이지</option>
				<option value="기타">기타</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>질문</td>
				<td><input type="text" name="question"></td>
			</tr>
			<tr>
				<td>답변</td>
				<td><textarea id="summernote" cols="50" rows="7" name="answer"></textarea></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit">등록하기</button> 
					<button type="button" onclick="location.href='flist.ad';">목록으로</button>
				</td>
			</tr>
		</table>
	</form>
	
	
	
	
	<script>
	
	$(document).ready(function() {
		  $('#summernote').summernote();
		});
	</script>
	
	
	  <script src='jquery-3.2.1.js'></script>
   
   <script>
   
   var jq132 = jQuery.noConflict();
   
   </script>
	
</body>
</html>
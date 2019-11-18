<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기 페이지</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<style>
	input, textarea{
		border:none;
	}
</style>
</head>

<body>
	<!-- 제목, 내용, 작성자, 첨부파일정보 -->
	<jsp:include page="../include/header.jsp"/>
	<!-- 여기 작성자부분 수정전엔 뜨는데 수정다하고 상세보기다시오면 못뜸 -> 다시올떈 url에 name값사라져있음 -->
	<br><br><br>
	<h1 align="center">상세보기 페이지</h1>
	<br>
	<form action="qupdateForm.qu?q_no=${ q.q_no }" method="post" enctype="multipart/form-data">
		
		<table align="center">
			<tr>
				<td>제목</td>
				<td><input size="40" type="text" name="title" value="${ q.title }" readonly></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input size="10" type="text" name="name" value="${ name }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${ q.content }</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<c:if test="${ !empty q.originalname }">
						<a href="${ pageContext.servletContext.contextPath }/resources/qFileUpload/${ q.changename }" download="${ q.originalname }">${ q.originalname }</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<c:if test="${ mem.getName() eq name }">
					<button type="submit">수정</button>
					<button type="button" onclick="location.href='qdelete.qu?q_no=${ q.q_no }&lec_no=${ q.lec_no }';">삭제</button>
					</c:if>
					<!-- <button type="button" onclick="window.history.back()">취소</button> -->
					<button type="button" onclick="location.href='question.qu?lec_no=${q.lec_no}';">목록</button>
					<br><br>
				</td>
			</tr>
		</table>
	</form>
	<br><br><br>
	
	
	
	<!-- header에 있는 jquery 충돌 방지 -->
   <script src='jquery-3.2.1.js'></script>
   
   <script>
   
   var jq132 = jQuery.noConflict();
   
   </script>
	
	
</body>
</html>
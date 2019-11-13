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
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<jsp:include page ="../include/header.jsp"/>
	
	<
	<h2 align="center"> 공지사항 작성하기</h2>
	<br>
	
	<form action="nupdate.ad" method="post" enctype="multipart/form-data">
		<table align="center">
			<input type="hidden" name="n_no" value="${ n.n_no }">
				<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${n.title }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="m_no" value="${ mem.m_no }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea id="summernote" cols="50" rows="7" name="content">${n.content }</textarea></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit">수정하기</button> 
					<button type="button" onclick="location.href='nlist.ad';">목록으로</button>
				</td>
			</tr>
		</table>
	</form>
	<script>
	
	$(document).ready(function() {
		  $('#summernote').summernote();
		});
	</script>
</body>
</html>
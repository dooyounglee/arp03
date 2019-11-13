<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- <script src="https://code.jquery.com/juqery-3.1.0.min.js" type="text/javascript"></script> -->

<head>
<meta charset="UTF-8">

<title>게시판 작성하기 </title>
</head>

<body>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
 <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>



	<jsp:include page="../include/header.jsp"/>
	<h3 align="center">글 작성하기</h3>
	
	<form method="post">
  		<textarea id="summernote" name="editordata"></textarea>
	</form>
	
	 <script>
    $(function() {
        $("#summernote").summernote();
    });
  </script>

</body>
 

</html>
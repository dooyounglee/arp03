<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
</head>
<!-- include libraries(jQuery, bootstrap) -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

include summernote css/js
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script> -->
<body>
<%@ include file="../include/bhead.jsp"%>
</head>
<body class="fix-header card-no-border logo-center">

<!-- Preloader - style you can find in spinners.css -->


	<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="../include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="../include/bsidebar.jsp" %>
        </aside>
        <!-- End of Left-sidebar -->

		<!-- Page wrapper  -->
        <div class="page-wrapper">
	<!-- End of Left-sidebar -->
	<br><br><br>
	<h2 align="center"> 공지사항 작성하기</h2>
	<br>
	
	<form action="ninsert.ad" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>
			
				<td>제목</td>
				<td><div class="form-group"><input type="text" name="title" class="form-control form-control-line"></div></td>
				
			</tr>
			
			<tr>
				
				<td><input type="hidden" name="m_no" value="${ mem.m_no }" readonly></td>
			</tr>
			<br>
			<tr>
				<td>내용</td>
				<td><textarea id="summernote" cols="50" rows="7" name="content" ></textarea></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn waves-effect waves-light btn-outline-info">등록하기</button> 
					<button type="button" onclick="location.href='nlist.ad';" class="btn waves-effect waves-light btn-outline-warning">목록으로</button>
				</td>
			</tr>
		</table>
	</form>

	<br><br>
	
	  <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
	        <!-- End footer -->
			</div>
	        <!-- End of Page wrapper  -->
			</div>
		<!-- End of Main wrapper -->

	
	
	
	
	
	
	
	<script>
	
	$(document).ready(function() {
		  $('#summernote').summernote({
			  
			  height:300,
			  minheight:null,
			  maxheight:null,
			  focus:true
		  });
		 
		});
	</script>
	<!-- <script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 100
      });
    </script> -->
	
   <script>
   
   var jq132 = jQuery.noConflict();
   
   </script>
	
	
</body>
</html>
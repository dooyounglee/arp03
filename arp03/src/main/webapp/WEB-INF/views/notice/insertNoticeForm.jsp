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
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
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
				<td><input type="text" name="title" class="form-control form-control-line"></td>
				
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
	<div class="card-body">
                                <h4 class="card-title">Animated line inputs</h4>
                                <h6 class="card-subtitle">Just add <code>form-material</code> class to the form that's it.</h6>
                                <form class="form-material mt-4">
                                    <div class="form-group">
                                        <label>Default Text <span class="help"> e.g. "George deo"</span></label>
                                        <input type="text" class="form-control form-control-line" value="Some text value..."> </div>
                                    <div class="form-group">
                                        <label for="example-email">Email <span class="help"> e.g. "example@gmail.com"</span></label>
                                        <input type="email" id="example-email2" name="example-email" class="form-control" placeholder="Email"> </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" class="form-control" value="password"> </div>
                                    <div class="form-group">
                                        <label>Placeholder</label>
                                        <input type="text" class="form-control" placeholder="placeholder"> </div>
                                    <div class="form-group">
                                        <label>Text area</label>
                                        <textarea class="form-control" rows="5"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Input Select</label>
                                        <select class="form-control">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>File upload</label>
                                        <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                                            <div class="form-control" data-trigger="fileinput"> <i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span></div> <span class="input-group-addon btn btn-default btn-file"> <span class="fileinput-new">Select file</span> <span class="fileinput-exists">Change</span>
                                            <input type="file" name="..."> </span> <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a> </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Helping text</label>
                                        <input type="text" class="form-control form-control-line"> <span class="help-block text-muted"><small>A block of help text that breaks onto a new line and may extend beyond one line.</small></span> </div>
                                </form>
                            </div>
	
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
	
   <script>
   
   var jq132 = jQuery.noConflict();
   
   </script>
	
	
</body>
</html>
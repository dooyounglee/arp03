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
<%@ include file="../include/bhead.jsp"%>
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Preloader - style you can find in spinners.css -->
 	<%@ include file="../include/bpreloader.jsp" %> 
	<!-- End of Preloader - style you can find in spinners.css -->

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
				<td>
				<textarea id="summernote" cols="50" rows="7" name="content" id="content" required >${b.content }</textarea>
				</td>
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
	 <%@ include file="../include/bjs.jsp" %>   
	
						
	
	
	
	
	<script>
	//jQuery.noConflict();
	$(document).ready(function() {
		$('#summernote').summernote({
            callbacks : {
				onImageUpload : function(files) {
					var _this=this;
					    for(var i=0; i<files.length; i++){
					    	var formData = new FormData();
					        formData.append('uploadFile', files[i]);
						    $.ajax({
						        url: "upload",
						        data: formData,
						        processData: false,
						        contentType: false,
						        type: 'POST',
						        success: function (data) {
						            $(_this).summernote('editor.insertImage', "resources/upload/"+data);
						        }
						    });
					    }
		            alert("이미지 업로드 성공");
				}
			},
        });
	});
	
   
   
   </script>
	
	
</body>
</html>
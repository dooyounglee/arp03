<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%-- <body>
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
	</script> --%>
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
	
	<br>
	
	
	<form action="nupdate.ad" method="post" enctype="multipart/form-data">
	<input type="hidden" name="n_no" value="${n.n_no }">
		<table align="center">
			<tr>
			
				<td>제목</td>
				<td><div class="form-group"><input type="text" name="title" class="form-control form-control-line" value="${n.title }"></div></td>
				
			</tr>
			
			<tr>
				
				<td><input type="hidden" name="m_no" value="${ mem.m_no }" readonly></td>
			</tr>
			<br>
			<tr>
				<td>내용</td>
				<td>
				<textarea id="summernote" cols="50" rows="7" name="content" id="content" required >${n.content }</textarea>
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
			tabsize: 2,
			height: 300,
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
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
        
        
        
	<%-- <!-- End of Left-sidebar -->
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
	</form> --%>
	
	
	
	
	<div class="container-fluid">	
	
	
	<div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">공지사항</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/arp">Home</a></li>
                            <li class="breadcrumb-item active"><a href="nlist.ad">공지사항</a></li>
                            <li class="breadcrumb-item active">작성하기</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-12 align-self-center d-none d-md-block">
                        <div class="d-flex mt-2 justify-content-end">
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                   
                                </div>
                                <div class="spark-chart">
                                </div>
                            </div>
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                   
                                </div>
                                <div class="spark-chart">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				<div class="card">
                            <div class="card-body collapse show">
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
                            </div>
                        </div>
	
	
	
	
	
	
	
	
	
	
<!-- <input id="movie"><button onclick="movie()">부미</button> -->
<script>
function movie(){
	//<iframe id="youtuberealId" width="560" height="315" src="https://play-tv.kakao.com/embed/player/cliplink/404312441" frameborder="0"></iframe>
	//$('#summernote').summernote('editor.insertImage', "resources/upload/"+data);
	//$('#summernote').summernote('insertText', '<iframe id="youtuberealId" width="560" height="315" src="https://play-tv.kakao.com/embed/player/cliplink/404312441" frameborder="0"></iframe>');
	$('#summernote').summernote('pasteHTML', '<iframe id="youtuberealId" width="560" height="315" src="https://play-tv.kakao.com/embed/player/cliplink/404312441" frameborder="0"></iframe>');
	
}
</script>
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
	
	var title =$("#title").val()
	var content = $("#content").val()
	
	if(title == ""){
		alert("제목을 입력하세요");
		return false;
	}
	
	if(content == ""){
		alert("내용을 입력하세요");
		return	false;
	}
	
	</script>
	
	
	
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
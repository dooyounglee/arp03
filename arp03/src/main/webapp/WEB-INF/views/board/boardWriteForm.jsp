<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/juqery-3.1.0.min.js" type="text/javascript"></script> -->
<%@ include file="../include/bhead.jsp"%>
<style>
	
</style>
</head>
<body>
	<header class="topbar">
		<%@ include file="../include/btopbarheader.jsp"%>
	</header>
	<!-- End Topbar header -->

	<!-- Left-sidebar -->
	<aside class="left-sidebar">
		<%@ include file="../include/bsidebar.jsp"%>
	</aside>
	<!-- End of Left-sidebar -->
	
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
 	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	
	<div class="page-wrapper">
	             <div class="row page-titles">
                 
                    <div class="col-md-7 col-4 align-self-center">
                        <div clarss="d-flex m-t-10 justify-content-end">
                            <div class="d-flex m-r-20 m-l-10 hidden-md-down">
                            </div>
                            <div class="">
                                <button class="right-side-toggle waves-effect waves-light btn-success btn btn-circle btn-sm pull-right m-l-10"><i class="ti-settings text-white"></i></button>
                            </div>
                        </div>
                    </div>
                </div>

	             <div class="row page-titles">
                    <div class="col-md-7 col-4 align-self-center">
                        <div clarss="d-flex m-t-10 justify-content-end">
                            <div class="d-flex m-r-20 m-l-10 hidden-md-down">
                            </div>
                            <div class="">
                                <button class="right-side-toggle waves-effect waves-light btn-success btn btn-circle btn-sm pull-right m-l-10"><i class="ti-settings text-white"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
	
	<c:if test="${ empty b }">
	<h3 align="center" style="color:black">글쓰기</h3>
	<br>
	<form action="binsert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name=m_no value=${ mem.m_no }>
		<table width="800px" align="center">
			<tr>
				<td><input type="text" name="title" id="title" class="form-control" required placeholder="제목을 입력해주세요"></td>
			</tr>
			
			<tr>
				<td><textarea cols="50" rows="7" name="content" id="summernote"></textarea></td>
			</tr>
			<tr>
				<td align="center">
					<button class="btn waves-effect waves-light btn-info" type="button" onclick="location.href='blist.do';">목록으로</button>
					<button class="btn waves-effect waves-light btn-info" type="submit">등록하기</button>
				</td>
			</tr>
		</table>	
	</form>
	</c:if>
	
	<c:if test="${ !empty b }">
	<h3 align="center" style="color:black">글 수정</h3>
	<form action="bupdate.do?b_no=${b.b_no}" method="post" enctype="multipart/form-data">
		<input type="hidden" name=m_no value=${ mem.m_no }>
		<table width="800px" align="center">
			<tr>	
				<td><input type="text" name="title" id="title" class="form-control" value="${ b.title }"></td>
			</tr>
			
			<tr>
				<td><textarea cols="50" rows="7" name="content" id="summernote">${ b.content }</textarea></td>
			</tr>
			<tr>
				<td align="center">
					<button class="btn waves-effect waves-light btn-info" type="button" onclick="location.href='blist.do';">목록으로</button>
					<button class="btn waves-effect waves-light btn-info" type="submit">등록하기</button>
				</td>
			</tr>
		</table>	
	</form>
	</c:if>
	
	</div>
	
	 <script>
      $(function(){
  		$("#summernote").summernote({
  			height: 300,
  			fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New' ],
  			fontNamesIgnoreCheck : [ '맑은고딕' ],
  			focus: true,
  			
  			callbacks: {
  				onImageUpload: function(files, editor, welEditable) {
  		            for (var i = files.length - 1; i >= 0; i--) {
  		            	sendFile(files[i], this);
  		            }
  		        }
  			}
  			
  		});

  	});
      
      function sendFile(file, el) {
          var form_data = new FormData();
          form_data.append('file', file);
          $.ajax({
            data: form_data,
            type:"POST",
            url:"image.do",
            cache: false,
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
            success: function(img_name) {
            	//console.log(img_name);
              $(el).summernote('editor.insertImage', img_name);
            },
            error: function(){
            	console.log("ajax 통신 실패");
            }
          });
        }
    </script>
	
</body>
</html>
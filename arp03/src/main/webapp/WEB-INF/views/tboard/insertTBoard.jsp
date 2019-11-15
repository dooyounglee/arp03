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
	
	<c:if test="${ empty b }">
	<h3 align="center">글 작성하기</h3>
	
	<br><br>
	
	<form action="insertTBoard.do" method="post" enctype="multipart/form-data" name="boardForm">
	
			<table align="center">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" id="title" required></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="hidden" name="m_no" value="${ mem.m_no }"></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="uploadFile" ></td>
				</tr>
				
				<tr>
					<td></td>
					<td><textarea id="summernote" cols="50" rows="7" name="content" id="content" required></textarea></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" id="subBtn">등록하기</button> 
						<button type="button" onclick="location.href='tblist.do';">목록으로</button>
					</td>
				</tr>
			</table>
		</form>
		
	</c:if>
		
		<c:if test="${ !empty b }">
			<h3 align="center">글 수정하기</h3>
			
				<form action="tbupdate.do?b_no=${b.b_no}" method="post" enctype="multipart/form-data">
	
			<table align="center">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" value="${ b.title }" id="title" required></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="hidden" name="m_no" value="${ b.m_no }"></td>
				</tr>
				<tr>
					<td>첨부파일</td>
				<td>
					<input type="file" name="reloadFile">
					<input type="hidden" name="original_filename" value="${ bf.original_filename }">
					<c:if test="${ !empty bf.original_filename }">
						<a href="${ pageContext.servletContext.contextPath }/resources/tbuploadFiles/${bf.rename_filename}" download="${ bf.original_filename }">${ bf.original_filename }</a>
					</c:if>
				</td>	
				</tr>
				<tr>
					<td></td>
					<td><textarea id="summernote" cols="50" rows="7" name="content" id="content" required>${ b.content }</textarea></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" id="subBtn">수정하기</button> 
						<button type="button" onclick="location.href='tblist.do';">목록으로</button>
					</td>
				</tr>
			</table>
		</form>
		</c:if>
		
	
	
	 <script>
	 $(document).ready(function() {
         $('#summernote').summernote({ // summernote를 사용하기 위한 선언
        
             height: 400,
				callbacks: { // 콜백을 사용
                 // 이미지를 업로드할 경우 이벤트를 발생
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
	           url:"imageUpload.do",
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
	
	 
/*   	 $("#subBtn").on("click", function(){
		 var title = $("#title").val();
		 var content = $("#content").val();
		 
		 if(title==""){
			 alert("제목을 입력해주세요!");
			 $("#title").focus();
			 return false;
		 }else if(content==""){
			 alert("내용을 입력해주세요!");
			 $("#content").focus();
			 return false;
		 }else{
			 return true;
		 };
	 }); */
	 
	</script>
	
	 <!--  헤더 제이쿼리 충돌 방지  -->
	<script src='jquery-3.2.1.js'></script>
	
	<script>
	
	var jq132 = jQuery.noConflict();
	
	</script>
	 
	
	
	
  

</body>
 

</html>
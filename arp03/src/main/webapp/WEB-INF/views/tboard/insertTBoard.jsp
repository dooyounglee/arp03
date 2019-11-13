<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- <script src="https://code.jquery.com/juqery-3.1.0.min.js" type="text/javascript"></script> -->
<script>
/* summernote에서 이미지 업로드시 실행할 함수 */
	function sendFile(file, editor) {
    // 파일 전송을 위한 폼생성
		data = new FormData();
	    data.append("uploadFile", file);
	    $.ajax({ // ajax를 통해 파일 업로드 처리
	        data : data,
	        type : "POST",
	        url : "./summernote_imageUpload.jsp",
	        cache : false,
	        contentType : false,
	        processData : false,
	        success : function(data) { // 처리가 성공할 경우
            // 에디터에 이미지 출력
	        	$(editor).summernote('editor.insertImage', data.url);
	        }
	    });
	}
</script>
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
	
	<form action="insertTBoard.do" method="post" enctype="multipart/form-data">
	
			<table align="center">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="hidden" name="writer" value="${ mem.m_no }"></td>
				</tr>
				<tr>
					<td></td>
					<td><textarea id="summernote" cols="50" rows="7" name="content"></textarea></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit">등록하기</button> 
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
					<td><input type="text" name="title" value="${ b.title }"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="hidden" name="writer" value="${ b.m_no }"></td>
				</tr>
				<tr>
					<td></td>
					<td><textarea id="summernote" cols="50" rows="7" name="content">${ b.content }</textarea></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit">수정하기</button> 
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
					    sendFile(files[0], this);
					}
				}
			});
		});
	</script>
  

</body>
 

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/juqery-3.1.0.min.js" type="text/javascript"></script> -->
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<br>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
 	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	<c:if test="${ empty b }">
	<h1 align="center">게시글 작성하기</h1>
	<form action="binsert.do" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="m_no" value=${ mem.m_no } readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="content" id="summernote"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" onclick="location.href='blist.do';">목록으로</button>
					<button type="submit">등록하기</button>
				</td>
			</tr>
		</table>	
	</form>
	</c:if>
	
	<c:if test="${ !empty b }">
	<h1 align="center">게시글 수정하기</h1>
	<form action="bupdate.do?b_no=${b.b_no}" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${ b.title }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="m_no" value=${ mem.m_no } readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="content" id="summernote">${ b.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" onclick="location.href='blist.do';">목록으로</button>
					<button type="submit">등록하기</button>
				</td>
			</tr>
		</table>	
	</form>
	</c:if>
	
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
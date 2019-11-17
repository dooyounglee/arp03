<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 페이지</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>

<body>
	<!-- 제목, 내용, 작성자, 첨부파일정보 -->
	<jsp:include page="../include/header.jsp"/>
	
	<h1 align="center">수정 페이지</h1>
	<br>
	<form action="qupdate.qu?q_no=${ q.q_no }" method="post" enctype="multipart/form-data">
	<input type="hidden" name="lec_no" value="${q.lec_no }">
	<input type="hidden" name="originalname" value="${ q.originalname }">
	<input type="hidden" name="changename" value="${ q.changename }">
		<table align="center">
			<tr>
				<td>제목</td>
				<td><input size="40" type="text" name="title" value="${ q.title }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input size="10" type="text" name="name" value="${ name }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea id="summernote" cols="50" rows="7" name="content">${ q.content }</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input style="display:inline-block;" type="file" name="fileReload">
					<c:if test="${ !empty q.originalname }">
						<a href="${ pageContext.servletContext.contextPath }/resources/qFileUpload/${q.changename}" download="${ q.originalname }" id="fName">${ q.originalname }</a>
						<button type="button" id="fileDelete">삭제</button>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button id="deleteaj" type="submit">확인</button>
					<!-- <button type="button" onclick="window.history.back()">취소</button> -->
					<button type="button" onclick="location.href='question.qu?lec_no=${q.lec_no}';">목록</button>
					<br><br>
				</td>
			</tr>
		</table>
	</form>
	
	<script>
	
		$(document).ready(function(){
			$("#summernote").summernote({
				height:300,
				minHeight: null,
				maxHeight: null,
				focus: true,
				
				callbacks:{
					
					onImageUpload: function(files, editor, weleditable){
						for(var i = files.length - 1; i >= 0; i--){
							sendFile(files[i], this);
						}
					}
					
				},
				lang:"ko-KR",
				placeholder: '※ 이 게시판은 수업시간에 궁금했던점들을 선생님께 질문할수있는 질문게시판입니다. 도배, 욕설 및 부적절한 내용을 올릴 경우 신고 및 삭제될 수 있습니다. 참고하여 작성해주세요.'
				
			});
		});
		
	
		$("#fileDelete").click(function(){
			var changename = $("input[name=changename]").val();
			//console.log(changename);
			//var q_no = ${ q.q_no };
			//var lec_no = ${q.lec_no };
			
			$.ajax({
				url: "fileDelete.aj",
				data: {changename:changename},
				success: function(data){
					console.log("ajax통신 성공")
					if(data == "success"){
						console.log("sucess");
						$("#fName").text("");
						$("input[name=originalname]").val(null);
						$("#fileDelete").attr("style","display:none");
					}else{
						alert("파일이 정상적으로 삭제되지않았습니다.");
					}
					
				}, error:function(){
					console.log("ajax통신 실패");
				}
			});
			
		});
		
		
		 
		 
		 
		 
		
/* 		 $("#fileDelete").click(function(){
			 $("#fileDelete").attr("style","display:none");
			 $("#fName").attr("style","display:none");
			});
			
		
		$("#deleteaj").click(function(){
			var changename = $("input[name=changename]").val();
			//console.log(changename);
			var q_no = ${ q.q_no };
			
			$.ajax({
				url: "fileDelete.aj",
				data: {changename:changename, q_no:q_no},
				success: function(data){
					console.log("ajax통신 성공")
					if(data == "success"){
						console.log("sucess");
						$("#fName").text("");
						$("input[name=originalname]").val(null);
						$("#fileDelete").attr("style","display:none");
					}else{
						alert("파일이 정상적으로 삭제되지않았습니다.");
					}
					
				}, error:function(){
					console.log("ajax통신 실패");
				}
			});
			
		});
		 */
		
		
		
		
	</script>
	
	
	<!-- header에 있는 jquery 충돌 방지 -->
   <script src='jquery-3.2.1.js'></script>
   
   <script>
   
   var jq132 = jQuery.noConflict();
   
   </script>
	
	
</body>
</html>
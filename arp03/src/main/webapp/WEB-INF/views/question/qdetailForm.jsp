<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기 페이지</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<style>
	input, textarea{
		border:none;
	}
	#qOpen{
		display:none;
	}
	.c1{
		border:1px solid black;
		width:500px;
		height:250px;
		margin-left:auto;
		margin-right:auto;
	}
	.t1{
		margin-top:50px;
	}
</style>
</head>

<body>

	<!-- 제목, 내용, 작성자, 첨부파일정보 -->
	<jsp:include page="../include/header.jsp"/>
	<!-- 여기 작성자부분 수정전엔 뜨는데 수정다하고 상세보기다시오면 못뜸 -> 다시올떈 url에 name값사라져있음 -->
	<br><br><br>
	<h1 align="center">상세보기 페이지</h1>
	<br>
	<form class="c1" action="qupdateForm.qu?q_no=${ q.q_no }" method="post" enctype="multipart/form-data">
		
		<table class="t1" align="center">
			<tr>
				<td>제목</td>
				<td><input size="40" type="text" name="title" value="${ q.title }" readonly></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input size="10" type="text" name="name" value="${ name }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${ q.content }</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<c:if test="${ !empty q.originalname }">
						<a href="${ pageContext.servletContext.contextPath }/resources/qFileUpload/${ q.changename }" download="${ q.originalname }">${ q.originalname }</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<c:if test="${ mem.getName() eq name }">
					<button type="submit">수정</button>
					<button type="button" onclick="location.href='qdelete.qu?q_no=${ q.q_no }&lec_no=${ q.lec_no }';">삭제</button>
					</c:if>
					<!-- <button type="button" onclick="window.history.back()">취소</button> -->
					<!-- 나중에 답변하기 버튼은 선생님만 보이게 처리하기 -->
					<c:if test="${empty q.replycontent}">
					<button type="button" onclick="Qre();">답변하기</button>
					</c:if>
					
					<button type="button" onclick="location.href='question.qu?lec_no=${q.lec_no}';">목록</button>
					<br><br>
				</td>
			</tr>
		</table>
	</form>
	<br><br><br>
	
	
	<!-- 질문게시판에 선생님이 답변달았을때의 insert form 사실상update-->
	<form id="qOpen" action="qTCInsertReply?q_no=${ q.q_no }&lec_no=${ q.lec_no }" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td>작성자</td>
				<td><input size="10" type="text" name="name" value="${ name }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea id="summernote" cols="50" rows="7" name="replycontent">${ q.replycontent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button id="qReOk" type="submit">확인</button>
					<!-- <button type="button" onclick="window.history.back()">취소</button> -->
					<button type="button" onclick="qReX();">취소</button>
					<br><br>
				</td>
			</tr>
		</table>
	</form>
	
	
	<!-- 값얻어온다음에 조건값에 메소드값으로 바꾸기 -->
	<c:if test="${!empty q.replycontent}">
	<form class="c1" id="qOpen1" action="" method="post" enctype="multipart/form-data">
		
		<h1 align="center">선생님 답변</h1>
		
		<table class="t1" align="center">
			<tr>
				<td>작성자</td>
				<td><input size="10" type="text" name="name" value="${ name }" readonly></td>
				<td>${ q.replydate }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${ q.replycontent }</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<!-- 수정버튼은 작성한 해당선생님만 볼 수 있게 -->
				<br>
					<button type="button" onclick="qReUpdate();">수정</button>
					<button type="button" onclick="qReX();">취소</button>
					<br><br>
				</td>
			</tr>
		</table>
	</form>
	<br>
	
	<!-- 댓글 -->
	<div id="dat">
	<h5 align="center">댓글리스트있으면 여기위로</h5>
	<table align="center">
	<tr>
		<td><textarea style="border:1px solid black;" id="repl" cols="50" rows="2" name=""></textarea></td>
		<td><button type="button">댓글</button></td>
	</tr>
	</table>
	</div>
	</c:if>
	
	
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
		
		function sendFile(file, el){
			var form_data = new FormData();
			form_data.append("file", file);
			
			$.ajax({
				data: form_data,
				type: "POST",
				url: "qImgUpload.aj",
				cache: false,
				contentType: false,
				enctype: "multipart/form-data",
				processData: false,
				success: function(img_name){
					console.log("ajax통신 성공")
					$(el).summernote("editor.insertImage", img_name);
				}, error: function(){
					console.log("ajax통신 실패");
				}
			});
			
		}
		
		function Qre(){
			$("#qOpen").attr("style","display:block");
		}
		
		function qReX(){
			//$("#summernote").remove();
			//$("textarea[name=summernote]").text("");
			if(confirm("작성한 내용이 사라집니다. 페이지에서 나가시겠습니까?") == true){
				$("#qOpen").attr("style","display:none");
				location.reload();
			}else{
				return false;
			}
		}
		
		function qReUpdate(){
			$("#qOpen1").attr("style","display:none");
			$("#dat").attr("style","display:none");
			$("#qOpen").attr("style","display:block");
		}
	</script>
	
	
	

	
	
	<!-- header에 있는 jquery 충돌 방지 -->
	<script src='jquery-3.2.1.js'></script>
   
   <script>
   
   var jq132 = jQuery.noConflict();
   
   </script>
	
	
</body>
</html>
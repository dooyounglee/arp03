<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 페이지</title>

<%@ include file="../include/bhead.jsp"%>
<!-- include libraries(jQuery, bootstrap) -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->
<!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> -->

<!-- include summernote css/js -->
<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet"> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script> -->


<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script> -->

<!-- <title>Summernote Lite</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script> -->

<style>
	.btn-info{
		background:#1e88e5;
	}
</style>

</head>

<body class="fix-header card-no-border logo-center">

	<!-- Main wrapper -->
	<div id="main-wrapper">

		<!-- Topbar header - style you can find in pages.scss -->
		<header class="topbar">
			<%@ include file="../include/btopbarheader.jsp"%>
		</header>
		<!-- End Topbar header -->

		<!-- Left-sidebar -->
		<aside class="left-sidebar">
			<%@ include file="../include/bsidebar.jsp"%>
		</aside>
		<!-- End of Left-sidebar -->

		<!-- Page wrapper  -->
		<div class="page-wrapper">

			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Bread crumb and right sidebar toggle -->
				<!-- ============================================================== -->
				<div class="row page-titles">
					<div class="col-md-5 col-12 align-self-center">
						<h3 class="text-themecolor mb-0 mt-0">Forms</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
							<li class="breadcrumb-item active">Form</li>
						</ol>
					</div>
					<div class="col-md-7 col-12 align-self-center d-none d-md-block">
						<div class="d-flex mt-2 justify-content-end">
							<div class="d-flex mr-3 ml-2">
								<div class="chart-text mr-2">
									<h6 class="mb-0">
										<small>THIS MONTH</small>
									</h6>
									<h4 class="mt-0 text-info">$58,356</h4>
								</div>
								<div class="spark-chart">
									<div id="monthchart"></div>
								</div>
							</div>
							<div class="d-flex mr-3 ml-2">
								<div class="chart-text mr-2">
									<h6 class="mb-0">
										<small>LAST MONTH</small>
									</h6>
									<h4 class="mt-0 text-primary">$48,356</h4>
								</div>
								<div class="spark-chart">
									<div id="lastmonthchart"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- End Bread crumb and right sidebar toggle -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- Row -->
				<div class="row">
					<!-- 수강페이지 메뉴 -->
					<%@ include file="../include/blecturemenu.jsp"%>

					<!--  <section class="cd-horizontal-timeline loaded"> -->

					<!-- .timeline -->
					<div class="col-10">
						<div class="card">
							<div class="card-body"
								style="padding-left: 40px; padding-right: 40px;">
								<form action="qupdate.qu?q_no=${ q.q_no }" method="post" enctype="multipart/form-data">
									<div class="card-body">
										<input type="hidden" name="lec_no" value="${q.lec_no }">
										<input type="hidden" name="originalname"
											value="${ q.originalname }"> <input type="hidden"
											name="changename" value="${ q.changename }">
										<h3 align="center" style="font-size: 20px; color: gray">수정 페이지</h3>
										<br>
										<br>
										<br> 
										<input class="form-control" style="width: 300px;" type="text" name="title" value="${ q.title }" required><br>
										<br>
										<input style="border: none;" size="10" type="text" name="name" value="${ mem.name }" readonly><br>
										<textarea id="summernote" cols="50" rows="7" name="content" required>${ q.content }</textarea>
										<br> 첨부파일 &nbsp; <input style="display: inline-block;"
											type="file" name="fileReload">
										<c:if test="${ !empty q.originalname }">
											<a href="${ pageContext.servletContext.contextPath }/resources/qFileUpload/${q.changename}" download="${ q.originalname }" id="fName">${ q.originalname }</a>
											<button type="button" class="btn btn-secondary btn-outline" id="fileDelete">
												<span class="docs-tooltip">
													<span class="fas fa-trash"></span>
												</span>
											</button>
										</c:if>
										<br>
										<br> ＃youtube＃naver＃kakao URL &nbsp; <input class="form-control inputtexturl" id="youtubeId" type="text" style="width: 300px;" name="youtubelink" value="${ q.youtubelink }">
											<button id="addURLTest" type="button">추가</button>
										<br>
										<br>
										<div style="text-align: center;">
											<button class="btn waves-effect waves-light btn-rounded btn-info" id="deleteaj" onclick="return note2UpText()" type="submit">확인</button>
											<!-- <button type="button" onclick="window.history.back()">취소</button> -->
											<button class="btn waves-effect waves-light btn-rounded btn-info" type="button" onclick="location.href='question.qu?lec_no=${q.lec_no}';">목록</button>
										</div>
										<br>
										<br>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%-- <!-- 제목, 내용, 작성자, 첨부파일정보 -->
	<jsp:include page="../include/header.jsp"/>
	
	<h1 align="center">수정 페이지</h1>
	<br> --%>
	<%-- <form action="qupdate.qu?q_no=${ q.q_no }" method="post" enctype="multipart/form-data"> --%>
	<%-- <input type="hidden" name="name" value="${ name }"> --%>
	<%-- <input type="hidden" name="lec_no" value="${q.lec_no }">
	<input type="hidden" name="originalname" value="${ q.originalname }">
	<input type="hidden" name="changename" value="${ q.changename }">
		<table align="center"> --%>
<%-- 			<tr>
				<td>제목</td>
				<td><input size="40" type="text" name="title" value="${ q.title }"></td>
			</tr> --%>
			<%-- <tr>
				<td>작성자</td>
				<td><input size="10" type="text" name="name" value="${ mem.name }" readonly></td>
			</tr> --%>
<%-- 			<tr>
				<td>내용</td>
				<td><textarea id="summernote" cols="50" rows="7" name="content">${ q.content }</textarea></td>
			</tr> --%>
			<%-- <tr>
				<td>첨부파일</td>
				<td><input style="display:inline-block;" type="file" name="fileReload">
					<c:if test="${ !empty q.originalname }">
						<a href="${ pageContext.servletContext.contextPath }/resources/qFileUpload/${q.changename}" download="${ q.originalname }" id="fName">${ q.originalname }</a>
						<button type="button" id="fileDelete">삭제</button>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>유튜브URL</td>
				<td><input id="youtubeId" type="text" style="width:300px;" name="youtubelink" value="${ q.youtubelink }"></td>
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
	</form> --%>
	
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
		
		
		$("#addURLTest").click(function(){ // 추가 버튼
			
			// 사용자가 입력한 값
			var youtubeaaa = $(".inputtexturl").val();
			// summernote 내용 textarea부분
		/* 	var upText = $(".upText").text(); */
		/* 	alert(youtubeaaa);
			alert(upText); */
			/* var youtubeIdChange = $("#youtubeId").val(); */
			/* var youtubeId = youtubeIdChange.replace('watch?v=','embed/'); */
			if($(".inputtexturl").val().trim() != ""){
				$('#summernote').summernote('pasteHTML', '<iframe id="youtuberealId" width="560" height="315" src="' + youtubeaaa + '" frameborder="0">');
			}
			var youtu = "https://youtu.be/";
			var naver = "/v/";
			var kakao = "https://tv.kakao.com/v/";
			var daum = "https://kakaotv.daum.net/v/";
			var youtubeId = youtubeaaa.replace('https://youtu.be/','https://www.youtube.com/embed/');
			var naverId = youtubeaaa.replace('/v/','/embed/');
			var kakaoId = youtubeaaa.replace('https://tv.kakao.com/v/','https://play-tv.kakao.com/embed/player/cliplink/');
			var daumNewsId = youtubeaaa.replace('https://kakaotv.daum.net/v/','https://play-tv.kakao.com/embed/player/cliplink/');
			if(youtubeaaa.indexOf(youtu) != -1){
				$("#youtuberealId").attr("src", youtubeId);
			}
			if(youtubeaaa.indexOf(naver) != -1){
				$("#youtuberealId").attr("src", naverId);
			}
			if(youtubeaaa.indexOf(kakao) != -1){
				$("#youtuberealId").attr("src", kakaoId);
			}
			if(youtubeaaa.indexOf(daum) != -1){
				("#youtuberealId").attr("src", daumNewsId);
			}
			
			
			/* 값 비우기 */
			$(".inputtexturl").val("").focus();
		});
		
		
		function note2UpText(){
			if($(".note-editable").text().trim() == "" && $("#summernote").val() == ""){
				alert("내용을 입력해주세요.");
				return false;
			}
		}
		
		
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
	
	
	
					<!-- footer -->
        <footer class="footer">
            <%@ include file="../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../include/bjs.jsp" %>
	
</body>
</html>
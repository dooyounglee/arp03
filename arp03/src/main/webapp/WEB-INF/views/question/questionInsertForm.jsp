<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성하기 페이지</title>
<%@ include file="../include/bhead.jsp"%>
</head>
<body class="fix-header card-no-border logo-center">

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

        	<!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">게시글 작성하기</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/arp">Home</a></li>
                            <li class="breadcrumb-item"><a href="lectureList.ad">Lecture List</a></li>
                            <li class="breadcrumb-item"><a href="main.lec?lec_no=${lec.lec_no}">${ lec.title }</a></li>
                            <li class="breadcrumb-item"><a href="question.qu">질문게시판</a></li>
                            <li class="breadcrumb-item active">게시글 작성하기</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-12 align-self-center d-none d-md-block">
                        <div class="d-flex mt-2 justify-content-end">
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <h6 class="mb-0"><small>THIS MONTH</small></h6>
                                    <h4 class="mt-0 text-info">$58,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="monthchart"></div>
                                </div>
                            </div>
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <h6 class="mb-0"><small>LAST MONTH</small></h6>
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
							<div class="card-body" style="padding-left: 40px; padding-right: 40px;">
								<form action="qinsert.qu" method="post" enctype="multipart/form-data">
									<div class="card-body">
									<input type="hidden" name="m_no" value="${ mem.m_no }">
										
										<h3 align="center" style="font-size: 20px; color: gray">게시글 작성하기</h3>
										<br><br><br> 
										<input class="form-control" style="width: 300px;" type="text" name="title" required placeholder="제목을 입력해주세요.">
										<br>
										<%-- <input style="border: none;" size="10" type="text" name="name" value="${ mem.name }" readonly> --%>
										<br>
										<textarea class="upText" id="summernote" cols="50" rows="7" name="content" required></textarea>
										
										<br> 첨부파일 &nbsp; <input style="display: inline-block;" type="file" name="fileUp">
										
<%-- 										<c:if test="${ !empty q.originalname }">
											<a href="${ pageContext.servletContext.contextPath }/resources/qFileUpload/${q.changename}" download="${ q.originalname }" id="fName">${ q.originalname }</a>
											<button type="button" class="btn btn-secondary btn-outline"
												id="fileDelete">
												<span class="docs-tooltip"><span class="fas fa-trash"></span></span>
											</button>
										</c:if> --%>
										<br>
										<br> ＃youtube＃naver＃kakao URL &nbsp; <input class="form-control inputtexturl" style="width: 300px;" id="youtubeId" type="text" name="youtubelink">
											<img style="width:30px; height:30px; cursor:pointer;" id="addURLTest" src="resources/siraFile/plus버튼.png">
										<br>
										<br>	
										
										<div style="text-align: center;">
											<button class="btn waves-effect waves-light btn-rounded btn-warning" onclick="return upContent()" type="submit">등록</button>
											<button class="btn waves-effect waves-light btn-rounded btn-info" type="button" onclick="location.href='question.qu';">목록</button>
										</div>
										<br>
										<br>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
	
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
			var currentStr = $('#summernote').summernote('code');
			
			// 사용자가 입력한 값
			var youtubeaaa = $(".inputtexturl").val();
			// summernote 내용 textarea부분
	
			if($(".inputtexturl").val().trim() != ""){
				
				var currentStr = $('#summernote').summernote('code');
				
				$('#summernote').summernote('code', currentStr +'<iframe id="youtuberealId" width="560" height="315" src="' + youtubeaaa + '" frameborder="0"></iframe>');
				
				var youtu = "https://youtu.be/";
				var naver = "naver.com/v/";
				var kakao = "https://tv.kakao.com/v/";
				var daum = "https://kakaotv.daum.net/v/";
				var youtubeId = youtubeaaa.replace('https://youtu.be/','https://www.youtube.com/embed/');
				var naverId = youtubeaaa.replace('naver.com/v/','naver.com/embed/');
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
				};
		});
		
		function upContent(){
			if($(".note-editable").text().trim() == "" && $("#summernote").val() == ""){
				alert("내용을 입력해주세요.");
				false;
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
		
	</script>
	
   
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
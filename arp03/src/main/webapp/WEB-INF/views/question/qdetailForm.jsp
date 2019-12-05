<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- head태그. header.jsp말고 -->
	<%@ include file="../include/bhead.jsp"%>
<title>상세보기 페이지</title>
<style>
	 .spanTrashColor{
	 	color:black;
	 }
	 .spanTrashColor:hover{
	 	color:red;
	 }
</style>
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
						<h3 class="text-themecolor mb-0 mt-0">상세보기 페이지</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/arp">Home</a></li>
                            <li class="breadcrumb-item"><a href="lectureList.ad">Lecture List</a></li>
                            <li class="breadcrumb-item"><a href="main.lec?lec_no=${lec.lec_no}">${ lec.title }</a></li>
                            <li class="breadcrumb-item"><a href="question.qu">질문게시판</a></li>
                            <li class="breadcrumb-item active">상세보기 페이지</li>
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

					<div class="col-lg-10">
						<div class="card">
							<div class="card-body">
								<section class="cd-horizontal-timeline loaded">

									<!-- .timeline -->
									<div class="events-content">
										<form class="c5" action="qupdateForm.qu?q_no=${ q.q_no }"
											method="post" enctype="multipart/form-data">
											<br>
											<h3 align="center" style="font-size: 20px; color: gray;">상세보기 페이지</h3>
											<div class="selected">
												<!-- <h3 style="font-size: 18px; font-weight:bold;"><img width="55" src="resources/siraFile/Q2.png">&nbsp;&nbsp;&nbsp;학생질문</h3> -->
												<img width="60" src="resources/siraFile/Q2.png">&nbsp;&nbsp;&nbsp;
												<span style="font-weight: bold; color:black; font-size: 25px;" size="20"
													type="text" name="title">${ q.title }</span>
												<hr class="mt-4">
												<span style="color:black; font-weight:500;" size="10" type="text" name="name">${ q.name }</span>
												<div style="float: right; color: black;">${ q.updatedate }</div>
												<br> <br> ${ q.content }
												<c:if test="${ !empty q.youtubelink }">
													<iframe id="youtuberealId" width="560" height="315" src=""
														frameborder="0" allowfullscreen></iframe>
												</c:if>
											</div>
											<c:if test="${ !empty q.originalname }">
												<tr>
													<td><br>첨부파일</td>
													<td><a href="${ pageContext.servletContext.contextPath }/resources/qFileUpload/${ q.changename }" download="${ q.originalname }">${ q.originalname }</a></td>
												</tr>
											</c:if>
											<input id="youtubeId" type="hidden" style="width: 300px;"
												name="youtubelink" value="${ q.youtubelink }"> <br>
											<br>
											<div id="btns" align="center">
												<c:if test="${ mem.m_no eq q.m_no }">
													<button type="submit"
														class="btn waves-effect waves-light btn-rounded btn-info">수정</button>
													<button type="button" id="qDel"
														class="btn waves-effect waves-light btn-rounded btn-danger">삭제</button>
												</c:if>
												<!-- <button type="button" onclick="window.history.back()">취소</button> -->
											
												<c:if
													test="${empty q.replycontent && mem.typee eq 't' && mem.m_no eq lec.m_no}">
													<button type="button" onclick="Qre();"
														class="btn waves-effect waves-light btn-rounded btn-danger">답변하기</button>
												</c:if>
												<button type="button"
													class="btn waves-effect waves-light btn-rounded btn-info"
													onclick="location.href='question.qu';">목록</button>
												<br> <br>
											</div>
											<br>
										</form>
									</div>
									<!-- .events-content -->
								</section>
							</div>
						</div>
						<!-- row2시작 (선생님답변 쓰는부분)  -->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<form id="qOpen" style="display:none;" action="qTCInsertReply?q_no=${ q.q_no }"
								method="post" enctype="multipart/form-data">
								<div class="card-body">
									<br><%--  <input size="10" type="text" name="name"
										value="${ qt.tcname }" readonly> --%>
									<textarea id="summernote" cols="50" rows="7"
										name="replycontent" required>${ q.replycontent }</textarea>
									<!-- 									<script>
								      $('#summernote').summernote({
								        tabsize: 2,
								        height:300,
										minHeight: null,
										maxHeight: null,
										focus: true,
										lang:"ko-KR",
								      });
								    </script> -->
									<br>
									<div style="text-align: center;">
										<button
											class="btn waves-effect waves-light btn-rounded btn-warning"
											id="qReOk" onclick="return noteTextUp()" type="submit">확인</button>
										<button
											class="btn waves-effect waves-light btn-rounded btn-info"
											type="button" onclick="qReX();">취소</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- row2끝 -->
				<!-- row3시작 (선생님답변 올린부분) -->
				<c:if test="${!empty q.replycontent}">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<section class="cd-horizontal-timeline loaded">

										<!-- .timeline -->
										<div class="events-content">
											<form class="c1" id="qOpen1" method="post"
												enctype="multipart/form-data">
												<br>
												<div class="selected">
													<!-- <h3 style="font-size: 18px; font-weight:bold;"><img width="55" src="resources/siraFile/Q2.png">&nbsp;&nbsp;&nbsp;학생질문</h3> -->
													<br> <img width="60" src="resources/siraFile/A2.png">&nbsp;&nbsp;&nbsp;
													<span style="font-weight: bold; font-size: 25px; color: black;" size="20">선생님 답변</span>
													<hr class="mt-4">
													<span size="10" style="color:black; font-weight:500;" type="text" name="name">${ qt.tcname }</span>
													<div style="float: right; color:black;">${ q.replydate }</div>
													<br> <br> ${ q.replycontent }
													<c:if test="${ mem.typee eq 't' && mem.m_no eq lec.m_no }">
														<br>
														<div style="text-align: center;">
															<button
																class="btn waves-effect waves-light btn-rounded btn-info"
																type="button" onclick="qReUpdate();">수정</button>
														</div>
														<br>
														<br>
													</c:if>
												</div>
												<br>
											</form>
										</div>
										<!-- .events-content -->
									</section>
								</div>
							</div>
						</div>
					</div>
					<!-- row3끝 -->
					<!-- row4시작 (댓글리스트부분) -->
					<div id="dat">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-body">
										<div id="replyArea">
											<div id="replyAreaChildren">
												<table id="demo-foo-pagination" align="center"
													cellspacing="0">
													<input type="hidden" id="q_nohidden" name="q_no" value="${ q.q_no }">
													<c:if test="${ qRListCount ne 0 }">
														<span
															style="color: gray; font: fantasy; font-weight: bold;">댓글(${ qRListCount })</span>
														<hr>
														<c:forEach items="${ qRList }" var="qr">
															<div>
																<div style="padding-bottom: 7px; height: 30px;">
																	<span
																		style="float: left; white-space: nowrap; color: white; display: none;">${ qr.r_no }</span>
																	<span
																		style="float: left; white-space: nowrap; font-weight: bold;">${ qr.name }</span>
																	<!-- 내글일경우에만 표시해주자 ex) 내 글 -->
																	<c:if test="${ qr.m_no eq mem.m_no }">
																		<!-- 박스 -->
																		<span
																			style="color: red; height: 19px; margin: 3px 0 0 6px; padding: 0 8px; border-width: 1px 1px 1px 1px; border-style: solid; font-weight: bold; border-radius: 17px; position: relative; float: left; vertical-align: top;">
																			<!-- 글 --> <span
																			style="height: 17px; line-height: 17px; margin: 0; color: red; font-size: 10px; letter-spacing: -1px; float: left;">
																				내 글 </span>
																		</span>
																	</c:if>
																</div>
																<div class="contentWordText" style="display: inline;">
																	<span class="contentWordText"
																		style="color: black; font: fantasy; word-break:break-all; white-space:pre-line;"> ${ qr.content }
																	</span>
																</div>
																<div style="float: right;">
																	<span style="color:black;"> ${ qr.updatedate } </span>
																	<span> <c:if test="${ qr.m_no eq mem.m_no }">
																			<button class="qrBtn btn-outline"
																				style="outline: 0; border: none; font-size: 13px;"
																				type="button">
																				<span  class="fas fa-trash spanTrashColor"></span>
																			</button>
																		</c:if>
																	</span>
																</div>
															</div>
															<br>
														</c:forEach>
													</c:if>
													<c:if test="${ qRListCount eq 0 }">
														<div style="text-align: center">아직 작성된 댓글이 없습니다.</div>
													</c:if>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- row4끝 -->
						<!-- row5시작 (댓글 등록하는 칸부분) -->
						<div class="row">
							<div class="col-lg-2"></div>
							<div class="col-lg-9">
								<div>
									<textarea class="contentWordText"
										style="border: 1px solid lightgray; padding: 10px; border-radius: 5px;"
										cols="60" rows="3" id="repl" name="content" required></textarea>
									<button class="btn waves-effect waves-light btn-warning"
										style="height: 47px; margin-left: auto; margin-right: auto; margin-top: -70px;"
										id="datUp" type="submit" onclick="qRestartInsert()">댓글등록</button>
								</div>
							</div>
						</div>
						<br><br><br>
					</div>
				</c:if>
					</div>
					
				</div>
				<!-- row1끝 -->

				
			</div>

			<!-- row5끝 -->











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
		
		function noteTextUp(){
			if($(".note-editable").text().trim() == "" || ("#summernote").text().trim() == ""){
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
		
		function Qre(){
			$("#qOpen").attr("style","display:block");
		}
		
		$("#qDel").click(function(){
			if(confirm("삭제하시겠습니까?") == true){
				location.href='qdelete.qu?q_no=${ q.q_no }&lec_no=${ q.lec_no }';
			}else{
				false;
			}
		});
		
		function qReX(){
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
		
		$(document).on("click", ".qrBtn", function(){
 			var r_no = $(this).parent().parent().parent().children().children().eq(0).text();
			/* var r_no = $(this).parent().parent().children().eq(0).text(); */
			if(confirm("삭제하시겠습니까?") == true){
				$.ajax({
					data: {r_no:r_no},
					type: "POST",
					url: "deleteDatReply.re",
					success: function(success){
						//console.log("ajax통신 성공")
						
						if(success=="success"){
							alert("댓글이 삭제되었습니다.");
							qRestart();
							webSocket.send("댓글삭제성공");
						}else{
							alert("댓글등록실패")
						}
						
					}, error: function(){
						console.log("ajax통신 실패");
					}
				});
			}else{
				false;
			}
			
			
		});
		
	</script>


		<script>
	
		// 다시 리로드 구역정하기 // 호출해서 쓰자
		function qRestart(){
			// replyArea안에있는 replyAreachildered를 리로드하겠다. 부모 안에 자식을 리로드
			$('#replyArea').load("qdetail.qu?q_no=${q.q_no} #replyAreaChildren");
		}
		
		// 댓글 등록
		function qRestartInsert(){
			//var q_no = $("#q_nohidden").val();
			var content = $("#repl").val();
			
			$.ajax({
				data: {
					q_no:${q.q_no},
					content:content
				},
				type: "POST",
				url: "qReplyInsert.re",
				success: function(success){
					console.log("ajax통신 성공")
					
					if(success=="success"){
						console.log("댓글등록성공");
						qRestart();
						$("#repl").val("").focus();
						webSocket.send("댓글성공");
					}else{
						alert("댓글등록실패")
					}
					
				}, error: function(){
					console.log("ajax통신 실패");
				}
			});
		}	
		
		
	</script>





	<script>
   
   var jq132 = jQuery.noConflict();
   
   </script>








<script type="text/javascript">
//WebSocketEx는 프로젝트 이름
//websocket 클래스 이름"ws://${pageContext.request.serverName}:${pageContext.request.serverPort}/${cp}/count/websocket"
var webSocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}/arp/websocket");
//"ws://${pageContext.request.serverName}:${pageContext.request.serverPort}/arp/websocket"
var messageTextArea = document.getElementById("messageTextArea");
//웹 소켓이 연결되었을 때 호출되는 이벤트
webSocket.onopen = function(message){
//console.log("연결성공flekd")
};
//웹 소켓이 닫혔을 때 호출되는 이벤트
webSocket.onclose = function(message){
//	console.log("연결닫힘www")
};
//웹 소켓이 에러가 났을 때 호출되는 이벤트
webSocket.onerror = function(message){
//	console.log("연결에러ww")
};
//웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트
webSocket.onmessage = function(message){
//console.log(message)
qRestart();
}; 
//Send 버튼을 누르면 실행되는 함수
function sendMessage(){
var message = document.getElementById("textMessage");
messageTextArea.value += "Send to Server => "+message.value+"\n";
//웹소켓으로 textMessage객체의 값을 보낸다.
//webSocket.send(message.value);
//textMessage객체의 값 초기화
message.value = "";
}
//웹소켓 종료
function disconnect(){
webSocket.close();
}
</script>




			<!-- footer -->
			<footer class="footer">
				<%@ include file="../include/bfooter.jsp"%>
			</footer>
			<!-- End footer -->
			</div>
			<!-- End of Page wrapper  -->
        
			</div>
			<!-- End of Main wrapper -->
	
			<%@ include file="../include/bjs.jsp" %>




</body>
</html>
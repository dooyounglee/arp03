<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String[] list = request.getParameterValues("bfList");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/bhead.jsp"%>
<style>
	#formdiv{
		border: 1px solid black;
		padding:20px;
		padding-left:60px;
		padding-right:60px;
		text-align:left;
		color:black;
		width:auto;
		height:auto;
		margin-left:auto;
		margin-right:auto;

	}	
	
	.card{
		text-align:left;
		margin-left:auto;
		margin-right:auto;
	
	}
	
	#bor{
		margin:0px;	
	}
	
	#regDate{
	float:right;
	color :gray;
	font-size:13px;
	}
	
	
	#file,a{
	font-size:15px;
	}
	#btn{
		text-align:right;
		margin-left:auto;
		margin-right:auto;
		width:600px;
	}

	
	
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
        <!-- Page wrapper  -->

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
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">

								<div id="formdiv" align="center">

									<p align="center" style="font-size: 15px">${ b.b_no }번글</p>
									${ b.title } <br> <label id="bor" style="color: lightgray">---------------------------------------------------------------------------</label>
									<div>
										<label>${ b.name}</label> <label id="regDate">${ b.regdate }</label>
									</div>
									<div id="content">${ b.content }</div>
									<div>
										<c:if test="${ !empty bfList}">
											<img src="resources/image/fileIcon.jpg" width="15px"
												height="19px">
											<label id="file">첨부파일</label>
											<br>


											<c:forEach items="${ bfList }" var="bl">
												<a
													href="${ pageContext.servletContext.contextPath }/resources/tbuploadFiles/${bl.rename_filename}"
													download="${ bl.original_filename }">${ bl.original_filename }</a>
												<br>

											</c:forEach>

										</c:if>
									</div>

									<br> <br>

									<div id="re">
										<!-- 댓글 등록 부분 -->

										<table align="center" width="700" border="1" cellspacing="0">
											<tr>
												<td width="508px"><textarea cols="65" rows="3"
														id="rContent"
														style="border: 0; overflow-y: hidden; background: clear; padding: 0px"></textarea></td>
												<td><button id="rBtn"
														class="btn btn-rounded btn-block btn-outline-info">등록하기</button></td>
											</tr>
										</table>
										<br>
										<!-- 댓글 목록 부분 -->
										<table align="center" width="700" cellspacing="0" id="rtb"
											style="color: black">
											<thead>
												<tr>
													<td colspan="3"><b id="rCount"></b></td>
												</tr>
											</thead>
											<tbody>

											</tbody>

										</table>
									</div>
									<br>
									<div align="right" id="btn">
										<c:if test="${ mem.m_no eq b.m_no }">
											<a href="tbupdateView.do?b_no=${ b.b_no }">수정하기</a>
											<a href="tbdelete.do?b_no=${ b.b_no }">삭제하기</a>
										</c:if>
										<a href="tblist.do;">목록으로</a>
									</div>


									<br> <br> <br> <br>
								</div>
							</div>
						</div>

					</div>
					<script>
		$(function(){
			getReplyList();
			
	
		// 댓글등록하기 버튼 
		$("#rBtn").on("click", function(){
				var content = $("#rContent").val();
				if(content == ""){
					alert("댓글을 작성해주세요!");
					return false;
				}
				var b_no= ${b.b_no};
				var m_no = ${mem.m_no}; 
				console.log(content);
				console.log(b_no);
				console.log(m_no);
				
				$.ajax({
					url:"trinsert.do",
					data:{content:content,
						  b_no:b_no,
						  m_no:m_no},
			        success:function(data){
			        	
			    		if(data == "success"){
			    			getReplyList();
							$("#rContent").val("");
						}else{
							alert("댓글 작성 실패");
						}
						
					},error:function(){
						console.log("ajax 통신 실패");
					}
				});
				
			});
		
		// 수정버튼을 눌렀을때
		$(document).on("click",".upBtn",function(){
			
			console.log("44");
			console.log($(this).parent().parent().children(".content").text());
			console.log($(this).parent().parent().children())
			// content자리가 textarea로 변경되게 
			 var upContent=$(this).parent().parent().children(".content");	
			 var contentText= upContent.text();
			 
		 	upContent.replaceWith( '<textarea id="upcontent">'+contentText+'</textarea>' );
		 	
		 	var delNo =$(this).parent().parent().children(".delBtn");
		 	// 삭제버튼, 수	정버튼 안보이고 등록버튼 보임
		 	delNo.hide(); // 삭제버튼
		 	$(this).hide(); // 수정버튼
			$(this).parent().parent().children("#subBtn").show();		// 등록버튼	
		 	$(this).parent().parent().children("#reBtn").hide();	// 답글버튼
		 				
		});
		
		// 등록버튼 눌렀을때
		$(document).on("click",".subBtn", function(){
			
			var updateContent =	$(this).parent().parent().children("#upcontent");
			
			console.log(updateContent);
			
			$(this).parent().hide(); // 등록버튼 td삭제
		 	$(".upBtn").show();		 // 수정버튼
		 	$(this).parent().parent().children(".delBtn").show(); // 삭제버튼
			
		 	var r_no = $(this).parent().parent().children("#r_no").val();
		 	console.log("r_no"+r_no);
		 	
		 	$.ajax({
				url:"tbReplyUpdate.do",
				data:{b_no:${b.b_no},
					  r_no:r_no,
					  content:updateContent.val()
					},
				success:function(data){
				if(data=="success"){
					
					console.log("성공")
					getReplyList();
					
					/* updateContent.replaceWith("<td >"+updateContent.val()+"</td>"); */
					
				
				}else{
					console.log("댓글수정실패");
				}
				},error:function(){
					console.log("수정 ajax 통신 실패");
				}
					
			}); 
		});
		
		
		
		// 답글버튼 눌렀을때 
		$(document).on("click",".re",function(){
			
			/* var updateContent =	$(this).parent().parent().children("#upcontent"); */
			var updateContent = $(this).parent().parent().children(".content");
			var name = $(this).parent().parent().children(".name").text();
			console.log(name);
			updateContent.parent().after("<tr><td>┖></td><td><textarea></textarea></td><td><button class='resubBtn btn waves-effect waves-light btn-info' >등록</button></td></tr>");
			
			
		});
		
		// 대댓글 등록 버튼 눌렀을때 
		$(document).on("click",".resubBtn", function(){
			
			var r_no = $(this).parent().parent().prev().children("#r_no").val();
			console.log("r_no"+r_no);
			var content = $(this).parent().prev().children().val(); 
			console.log(content);
			
			
			
			  $.ajax({
				url:"reReplyInsert.do",
				data:{parent_no: r_no,
					  content:content,
					  b_no:${b.b_no},
					  m_no:${mem.m_no}},
					  success:function(data){
						  
						  if(data=="success"){
							  
							  getReplyList();
							} else {
								alert("댓글 작성에 실패했습니다");
							}
						}, error:function(){
							console.log("ajax 통신 실패");
						}	
						  
				});	
		
		});
		
		
		 
	/* 	 // 대댓글 삭제 버튼을 눌렀을때
		 $(document).on("click",".delReBtn", function(){
			 
			 $.ajax({
				 url:"deleteRe.do",
				 data:{r_no:r_no,
					   b_no:${b.b_no},
					   parent_no: r_no,
					   success:function(data){
							  
							  if(data=="success"){
								  
								  getReplyList();
								} else {
									alert("댓글 삭제에 실패했습니다");
								}
							}, error:function(){
								console.log("ajax 통신 실패");
							}	
					   
					 }
		
			 });
		 
		 }); */
		 
		 

		 // 댓글 삭제버튼 눌렀을때
		 $(document).on("click",".delBtn", function(){
			 var r_no = $(this).parent().parent().children("#r_no").val();
			 var depth = $(this).parent().parent().children(".depth").val();
		
			 		 console.log(r_no);
					 console.log(depth);
				
					 
					 $.ajax({
						 url:"deleteBtn.do",
						 data:{r_no:r_no,
							   depth:depth},
							   success:function(data){
									  
									  if(data=="success"){
										  
										  getReplyList();
										} else {
											alert("댓글 삭제에 실패했습니다");
										}
									}, error:function(){
										console.log("ajax 통신 실패");
									}
							   
						
								
						 
					 });
				 
				 
		 });
			 
		
		

	/* 	// 제목을 눌렀을때 대댓글
		$contentTd.hover(function() {
			console.log($(this).parent().text());
			  $(this).css("color", "blue");
			}, function(){
			  $(this).css("color", "black");
			});
		$contentTd.on("click", function(){
			
			$(this).parent().after("<tr><td>"+r_no+"</td><td><textarea></textarea></td></tr>");
			})
		
			
		});	 */
	
	function getReplyList(){
			
			$.ajax({
				url:"treplyList.do",
				data:{b_no:${b.b_no}},
				dataType:"json",
				success:function(data){
					console.log(data);
					
					$tbody = $("#rtb tbody");	
					$tbody.html("");
					
					$("#rCount").text("댓글(" + data.length + ")");
					
					if(data.length > 0){ // 댓글이 존재할 경우
						
						// 반복문을 통해서 한 행씩 추가될 수 있도록
						$.each(data, function(index, value){ // value == data[index]
							// 작성자 내용 작성일
							$tr = $("<tr></tr>");
							
							
							$writerTd = $("<td width='120' class='name'></td>").text(value.name);
							$writerReTd = $("<td>┖>"+"  "+value.name+"</td>");
							$contentTd = $("<td class='content' width='200'></td>").text(value.content);
							$dateTd = $("<td></td>").text(value.regdate);
							$upBtn = $("<td><button class='upBtn btn waves-effect waves-light btn-xs btn-info'>수정</button></td>");
							$delBtn = $("<td><button class='delBtn btn waves-effect waves-light btn-xs btn-info'>삭제</button></td>");
							$upForm =$("<textarea></textarea>");
							$subBtn = $("<td id='subBtn'><button class='subBtn btn waves-effect waves-light btn-xs btn-info'>sub</button></td>");
							$r_no = $("<input type='hidden' id='r_no' class='r_no'>").val(value.r_no);
							$depth = $("<input type='hidden' class='depth'>").val(value.depth);
							$reBtn = $("<td id='reBtn'><button class='re btn waves-effect waves-light btn-xs btn-info'>답글</button></td>");
							$delString = $("<td>삭제된 댓글입니다.</td>");
							$parent_no = $("<input type='hidden'  class='parent_no'>").val(value.parent_no);
							
						
							
							
							if(value.depth == 1){				// 댓글
								$tr.append($writerTd);
								
								var status = value.status;
								if(status == "N"){			//삭제된 댓글일때
								$tr.append($delString);
								}else{											
							
									$tr.append($contentTd);
								}
							}else{
								
								$tr.append($writerReTd);
								$tr.append($contentTd);
							
							}
							$tr.append($dateTd);
							if(${mem.m_no} == value.m_no){
								$tr.append($upBtn);
								$tr.append($delBtn);
							}
							
							$tr.append($subBtn);
							$tr.append($depth);
							$tr.append($r_no);
							if(value.depth == 1){
								$tr.append($reBtn);
							}
							$tr.append($parent_no);
			
							
							$subBtn.hide(); 
							
							$tbody.append($tr);
				
							
						});
				
			
							
						}else{ // 댓글이 존재하지 않을 경우
						
						$tr = $("<tr></tr>");
						
						$contentTd = $("<td colspan='3'></td>").text("등록된 댓글이 없습니다.");
						$tr.append($contentTd);
						
						$tbody.append($tr);
					}
					
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
			
	}  
		
		});
		
			
	 
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


			<%@ include file="../include/bjs.jsp"%></body>
</html>
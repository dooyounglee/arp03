<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String[] list = request.getParameterValues("bfList");
%>
<!DOCTYPE html>
<html>
<%@ include file="../include/bhead.jsp"%>
<head>
<meta charset="UTF-8">
<style>
	#formDiv{
		text-align:left;
		margin-left:auto;
		margin-right:auto;
		width:800px
		}
	
</style>

<title>게시판 작성하기 </title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

</head>
<title>Insert title here</title>
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
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
				
								<h4 class="card-title">게시판 리스트</h4>
		
								<form method="post" id="MultiUpload" action="insertTBoard.do" enctype="multipart/form-data" id="boardInsertForm" >
									
							
												
												<input name="m_no" value="${mem.m_no}" type="hidden">
												
												<div class="form-material">
												<input type="text" name="title" id="title" required placeholder="제목을 입력해주세요" value="${b.title }" class="form-control"><br>
							                     </div>
											
											
												<input type="hidden" name="m_no" value="${ mem.m_no }">
												
												
										
										
												<c:if test="${ empty b }">
													<label>파일첨부</label>
													<input type="file"  name="file" id="file" multiple="multiple">
													<div id="fileArea">
													
													</div>
												</c:if>
							
													<textarea id="summernote" cols="50" rows="7" name="content" id="content"required >${b.content }</textarea>
							
							
											<div align="center">
											<button type="submit" id="subBtn" class="btn waves-effect waves-light btn-info">등록하기</button> 
											<button type="button" class="btn waves-effect waves-light btn-info" onclick="location.href='tblist.do';">목록으로</button>
											</div>		
							
								</form>
									
									
								</div>
							</div>
						</div>
					</div>
				</body>
		
	<%-- 	<c:if test="${ !empty b }">
			<h3 align="center">글 수정하기</h3>
			
				<form action="tbupdate.do?b_no=${b.b_no}" method="post" enctype="multipart/form-data">
	
			<table align="center">
				<tr>

					<td>제목</td>
					<td><input type="text" name="title" value="${ b.title }" id="title" required></td><br><br>
				</tr>
				
				<tr>
					<td></td>
					<td><input type="hidden" name="m_no" value="${ b.m_no }"></td>
					<br>
				</tr>
				<tr>
					<td>첨부파일</td>
				<td>
				<input type="file" name="reloadFile" multiple="multiple"> 
				
				<c:if test="${ !empty bfList }">
				<c:forEach items="${ bfList }" var="bfList">
				
					<input type="hidden" class="original_filename" name="original_filename"  value="${ bfList.original_filename }">
					<input type="hidden" id="rename" value="${ bfList.rename_filename }">
					
					<div id="delDiv">
					 <a id="fileName" href="${ pageContext.servletContext.contextPath }/resources/tbuploadFiles/${bfList.rename_filename}" download="${ bfList.original_filename }">${ bfList.original_filename }</a>
                	  <button type="button" class="delBtn">파일삭제</button>
					</div>
				
				</c:forEach>
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
		 --%>
	
	

	
	 <script>
	 
	 
	 $(document).ready(function() {
         $('#summernote').summernote({ // summernote를 사용하기 위한 선언
        
             height: 400,
             minHeight: null,
				maxHeight: null,
				focus: true,
				
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
	  */

	 

	 
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
	     
	     $(".delBtn").on("click", function(){
	    	 
	         var this_=$(this)
	        	
	         var rename = $(this_).parent().prev().val();
	         
	         console.log(rename);
	   
	            $.ajax({
	               url:"tbdeleteFile.do",
	               data:{rename_filename : rename},
	               success:function(data){
	                     
	                  if(data == "success"){
	                     console.log("성공");
	                     
	                     
	                     $(this_).parent().prev().remove()
	                     $(this_).parent().prev().remove()  
	                     $(this_).parent().remove() 
	                    
	                
	                     
	                    
	                  }else{
	                     alert("파일 삭제 실패");
	                  }
	                  
	               },error:function(){
	                  
	                  console.log("ajax 통신 실패");
	               }
	            });
	            
	         }); 
	       
	     
		// 파일업로드 리스트 보여주기		
	     $(document).ready( function() {
	    	 
	    	   var fileArea = document.getElementById("fileArea");
	    	   
	    	 
	         $("input[type=file]").change(function () {
	             
	             var fileInput = document.getElementById("file");
	    
	              
	             var files = fileInput.files;
	             var file;
	             
	             $("input[type=file]").on("click",function(){
	            	
	            	 while ( fileArea.hasChildNodes() ) { 
	            		 fileArea.removeChild( fileArea.firstChild ); 
	            		 }

	             });
	          	
	             for (var i = 0; i < files.length; i++) {
	            	 
	            	 var input = document.createElement("input");
	            	 var br = document.createElement("br");
	            	 input.type="text";
	            	 input.id="upFileName"+i;
	            	 input.style="none";
	            	 fileArea.appendChild(input);
	            	 fileArea.appendChild(br);

	   
	                 file = files[i];
	                 $("#upFileName"+i).val(file.name);
	            }
	                
	        
	              
	         });
	  
	     });
		
	
	 
	</script>
	
	 <!--  헤더 제이쿼리 충돌 방지  -->
	<script src='jquery-3.2.1.js'></script>
	
	<script>
	
	var jq132 = jQuery.noConflict();

	
	</script>
	
<!-- 	<script>
		var form = document.forms[0];
		var fileArea = document.getElementById("fileArea");
		var num =2;
	
		$("#addBtn").on("click", function(){
		if(num < 6){
			var element = document.createElement("input");
			element.type="file";
			element.name="uploadFile"+num;
			num++;
			
			fileArea.appendChild(element);
		
		}else{
			alert("파일첨부는 5개까지 가능합니다");
		}
	});	
		$("#deleteBtn").on("click",function(){
			if(num > 2){
				num--;
				var inputs = fileArea.getElementsByTagName('input');
				fileArea.removeChild(inputs[inputs.length-1]);
			
			}
		});
		
	form.onsubmit=function(){
		var inputs = fileArea.getElementsByTagName('input');
		event.preventDefault(); // 일단 정지
		for(var i=0; i<inputs.length; i++){
			if(inputs[i].value== ""){
				alert((i+1)+"번째파일을 선택해주세요");
				inputs[i].focus();
				return;
			}
		}
		
		this.submit();
	}
	
	</script> -->

<!-- footer -->
<footer class="footer">
	<%@ include file="../include/bfooter.jsp"%>
</footer>
<!-- End footer -->

</div>
<!-- End of Page wrapper  -->

</div>
<!-- End of Main wrapper -->


<%@ include file="../include/bjs.jsp"%>





</body>
 

</html>
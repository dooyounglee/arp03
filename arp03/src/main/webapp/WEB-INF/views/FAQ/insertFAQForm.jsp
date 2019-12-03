<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
</head>
<!-- <!-- include libraries(jQuery, bootstrap)
 <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

include summernote css/js
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script> -->
<body> 
	<%@ include file="../include/bhead.jsp"%>
<!-- <script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script> -->
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Preloader - style you can find in spinners.css -->
	 <%@ include file="../include/bpreloader.jsp" %>  
	<!-- End of Preloader - style you can find in spinners.css -->

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
        
	<br>
	<%-- 
	<form action="finsert.ad" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<input type="hidden" name="m_no" value="${ mem.m_no }">
			</tr>
			<tr>
				<td>구분</td>
				<td>
				<select name="category">
				<option value="로그인">로그인</option>
				<option value="수강">수강</option>
				<option value="홈페이지">홈페이지</option>
				<option value="기타">기타</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>질문</td>
				<td><input type="text" name="question" class="form-control form-control-line"></td>
			</tr>
			<tr>
				<td>답변</td>
				<td>
					
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success btn-rounded">등록하기</button> 
					<button type="button" class="btn btn-info btn-rounded" onclick="location.href='flist.ad';">목록으로</button>
				</td>
			</tr>
		</table>
	</form>
 --%>

	
	<div class="container-fluid">	
	
	
	<div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">FAQ</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/arp">Home</a></li>
                            <li class="breadcrumb-item active"><a href="flist.ad">FAQ</a></li>
                            <li class="breadcrumb-item active">작성하기</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-12 align-self-center d-none d-md-block">
                        <div class="d-flex mt-2 justify-content-end">
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                   
                                </div>
                                <div class="spark-chart">
                                </div>
                            </div>
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                   
                                </div>
                                <div class="spark-chart">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				<div class="card">
                            <div class="card-body collapse show">
       <h2 align="center"> FAQ 작성하기</h2>
		<br>
	
		<form action="finsert.ad" method="post" enctype="multipart/form-data">
				<table align="center">
			<tr>
				<input type="hidden" name="m_no" value="${ mem.m_no }">
			</tr>
			<tr>
				<td>구분</td>
				<td>
				<select name="category">
				<option value="로그인">로그인</option>
				<option value="수강">수강</option>
				<option value="홈페이지">홈페이지</option>
				<option value="기타">기타</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>질문</td>
				<td><input type="text" name="question" class="form-control form-control-line"></td>
			</tr>
			<tr>
				<td>답변</td>
				<td>
				<textarea id="summernote" cols="50" rows="7" name="answer" id="answer" required >${b.content }</textarea>
				</td>
			</tr>
				
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success btn-rounded">등록하기</button> 
					<button type="button" class="btn btn-info btn-rounded" onclick="location.href='flist.ad';">목록으로</button>
				</td>
			</tr>
			</table>
		</form>
                            </div>
                        </div>



     <footer class="footer">
            <%@ include file="../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	 <%@ include file="../include/bjs.jsp" %>   
	
						
	 <<!-- script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 100
      });
    </script> -->
	
 <script>
	
	$(document).ready(function() {
		  $('#summernote').summernote({
			  
			  height:300,
			  minheight:null,
			  maxheight:null,
			  focus:true
		  });
		 
		});
	</script>
	
	
	 <!-- <script src='jquery-3.2.1.js'></script>
   
   <script>
   
   var jq132 = jQuery.noConflict();
   
   </script> 
     -->
	
</body>
</html>
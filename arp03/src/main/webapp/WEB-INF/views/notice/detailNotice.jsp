<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>




<script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
<body>
	<%@ include file="../include/bhead.jsp"%>
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
	<!-- End of Left-sidebar -->

	
	
	
	
<%-- 	<h1 align="center">게시글 상세보기</h1>
	<br>
	
	<table align="center" border="1px" >
	
		<tr>
			<td colspan="2" align="center">${ n.n_no }번 글 상세보기</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${ n.title }</td>		
		</tr>
		<tr>
			<td>작성자</td>
			<td>관리자</td>		
		</tr>
		<tr>
			<td>내용</td>
			<td>${ n.content }</td>		
		</tr>
		
	</table> --%>
	
	
	<%-- 
	<div class="page-wrapper">
		<div class="row page-titles">
	</div>
	<div align="center">
	<div class="card">
	<br><br>
	
	
	
	<div id="formdiv" align="center">
	<p align="center" style="font-size: 15px ">${ n.n_no }번 글 </p>
	<!-- <label>제목 : </label> -->
	${ n.title }	
	<label id="bor" style="color: lightgray">---------------------------------------------------------------------------</label>
	<div>
	<label>${ b.name}</label>	
	
	<label id="regDate">${ n.regdate }</label>
	</div>
	<div id="content">
	${ n.content }	
	</div>

	</div>
	<br>
	<c:if test="${mem.id eq 'admin' }">
	<div align="right"  id="btn">
	
	<button onclick="location.href= 'nlist.ad';" align="center">리스트로 돌아가기</button>
	<a href="nupdateForm.ad?n_no=${ n.n_no }">수정하기</a>
	<a href="ndelete.ad?n_no=${ n.n_no }" >삭제하기</a>
	</div>
	</c:if>
	<br><br>
	
	
	<br><br><br><br>
	</div>
	</div>
	 --%>
<div class="container-fluid">	
	
	
	<div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h2 class="text-themecolor mb-0 mt-0">공지사항</h2>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/arp">Home</a></li>
                            <li class="breadcrumb-item active"><a href="nlist.ad">공지사항목록</a></li>
                            <li class="breadcrumb-item active">공지사항상세보기</li>
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
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-body printableArea">
                        <h2 class="card-title">공지사항</h2>
                        <h5 class="card-subtitle">반갑습니다 kh수학교육원에 오신걸 환영합니다.</h5><br>
                            <hr>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="pull-left">
                                        <address>
                                          <p style="display:inline">${n.title }</p>
                                          <p style="float:right" >관리자 | ${ n.regdate }</p>
                                          <hr>
                                          
                                          <div style="padding: 30px 0 30px 0;">
                                          	<p>${ n.content }</p>
                                          </div>		
                                        </address>
                                    </div>
                                    <button onclick="location.href= 'nlist.ad';" align="center" class="btn waves-effect waves-light btn-info">리스트로 돌아가기</button>
                                    <div class="pull-right text-right">
                                        <address>
                                            <c:if test="${mem.id eq 'admin' }">
												<div align="right"  id="btn">
												
												<button onclick="location.href= 'nlist.ad';" align="center" class="btn waves-effect waves-light btn-info">리스트로 돌아가기</button>
												<a href="nupdateForm.ad?n_no=${ n.n_no }" class="btn waves-effect waves-light btn-success">수정하기</a>
												<a href="ndelete.ad?n_no=${ n.n_no }" class="btn waves-effect waves-light btn-danger">삭제하기</a>
												</div>
											</c:if>	
                                        </address>
                                    </div>
                                </div>
                              
                                
                            </div>
                        </div>
                    </div>
                </div>
	</div>
	

	
	    <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
	        <!-- End footer -->
	
			</div>
	        <!-- End of Page wrapper  -->
	        
			</div>
		<!-- End of Main wrapper -->


	<%@ include file="../include/bjs.jsp" %>	
	
	
	
	<script>
	
	
	
	
	
	
	
	</script>
	
	
</body>
</html>
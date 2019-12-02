<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- head태그. header.jsp말고 -->
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




<!--
<table align="center" border="1" cellspacing="0" width="700"> 
<tr>
	<th>번호</th>
	<th width="300">제목</th>
	<th>작성자</th>
	<th>작성일</th>
	<th>조회수</th>
</tr>

<c:if test="${pi.listCount eq 0 }">
	<tr>
	<td colspan="5" align="center">해당 게시판에 게시물이 없습니다</td>
	</tr>
</c:if>
	

 
<c:forEach items="${ list }" var="n">
	<tr>	
		<td>${ n.n_no }</td>
		<td><a href="ndetail.ad?n_no=${ n.n_no }">${ n.title }</a></td>
	  	<td>admin</td>
		<td>${ n.regdate }</td>
		<td>${ n.vcount }</td>
	</tr>
</c:forEach>
 -->
	  <%-- <div class="col-lg-6" align="center" style="margin:auto">
                        <div class="card" align="center">
                            <div class="card-body" align="center">
                                <h2 class="card-title">공지사항</h2><br><br>
                            <div class="card-body" align="center">
                                <div class="table-responsive">
                                    <table class="table color-table info-table">
                                        <thead align="center">
                                        <tr>
											<th>번호</th>
											<th width="300">제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
                                       
                                         <c:if test="${pi.listCount eq 0 }">
											<tr>
											<td colspan="5" align="center">해당 게시판에 게시물이 없습니다</td>
											</tr>
										</c:if>
                                        </thead>
                                        
                                         <c:forEach items="${ list }" var="n">
                                        <tbody align="center"> 
                                       
											<tr>	
												<td>${ n.n_no }</td>
												<td><a href="ndetail.ad?n_no=${ n.n_no }">${ n.title }</a></td>
											  	<td>admin</td>
												<td>${ n.regdate }</td>
												<td>${ n.vcount }</td>
											</tr>
											
                                        </tbody>
                                       </c:forEach>
                                       <tr align="center" height="20">
												<c:if test= "${pi.listCount ne 0 }">
													<td colspan="6">
														<!-- [이전] -->
														<c:if test="${ pi.currentPage eq 1 }">
															[이전] 
														</c:if>
														<c:if test="${ pi.currentPage ne 1 }">
															<c:url value="nlist.ad" var="before">
																<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
															</c:url>
															<a href="${ before }">[이전] </a>	
														</c:if> 
														
														<!-- [페이지] -->
														<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
															<c:if test="${ p eq pi.currentPage }">
																<font color="red" size="4"> [${ p }] </font>
															</c:if>
															<c:if test="${ p ne pi.currentPage }">
																<c:url value="nlist.ad" var="page">
																	<c:param name="currentPage" value="${ p }"/>
																</c:url>
																<a href="${ page }"> ${ p } </a>
															</c:if>
														</c:forEach>
														
														 <!-- [다음] -->
														<c:if test="${ pi.currentPage eq pi.maxPage }">
															 [다음]
														</c:if>
														<c:if test="${ pi.currentPage ne pi.maxPage }">
															<c:url value="nlist.ad" var="after">
																<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
															</c:url>
															<a href="${ after }"> [다음]</a>
														</c:if>
													</td>
													</c:if>
												</tr>
											
                                    </table>
                          		 </div>
                            </div>
                        </div>
                    </div>
				</div> --%>
				
				<div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h2 class="text-themecolor mb-2 mt-0">공지사항</h2>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/arp">Home</a></li>
                            <li class="breadcrumb-item active">공지사항</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-12 align-self-center d-none d-md-block">
                        <div class="d-flex mt-2 justify-content-end">
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                   <!--  <h6 class="mb-0"><small>THIS MONTH</small></h6>
                                    <h4 class="mt-0 text-info">$58,356</h4> --></div>
                                <div class="spark-chart">
                                   <%--  <div id="monthchart"><canvas width="60" height="35" style="display: inline-block; width: 60px; height: 35px; vertical-align: top;"></canvas></div> --%>
                                </div>
                            </div>
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <!-- <h6 class="mb-0"><small>LAST MONTH</small></h6>
                                    <h4 class="mt-0 text-primary">$48,356</h4> --></div>
                                <div class="spark-chart">
                                   <%--  <div id="lastmonthchart"><canvas width="60" height="35" style="display: inline-block; width: 60px; height: 35px; vertical-align: top;"></canvas></div> --%>
                                </div>
                            </div>
                            <div class="">
                                <button class="right-side-toggle waves-effect waves-light btn-success btn btn-circle btn-sm pull-right ml-2"><i class="ti-settings text-white"></i></button>
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
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="card-title" align="center">공지사항</h2><br><br>
                                <!-- Accordian-part -->
                                <div id="accordian-part">                                 
                                    <div id="accordian-3">
                                    <div class="table-responsive">
                      
                                    <table class="table color-table info-table">
                              
                                        <thead align="center">
                                        <tr>
											<th>번호</th>
											<th width="400">제목</th>
											<th>작성일</th>
											<th>작성자</th>
											<th>조회수</th>
										</tr>
                                       
                                         <c:if test="${pi.listCount eq 0 }">
											<tr>
											<td colspan="5" align="center">해당 게시판에 게시물이 없습니다</td>
											</tr>
										</c:if>
                                        </thead>
                                        
                                         <c:forEach items="${ list }" var="n">
                                        <tbody align="center"> 
                                       
											<tr>	
												<td>${ n.n_no }</td>
												<td><a href="ndetail.ad?n_no=${ n.n_no }">${ n.title }</a></td>
												<td>${ fn:substring(n.regdate,0,10) }</td>
											  	<td>admin</td>
												<td>${ n.vcount }</td>
											</tr>
											
                                        </tbody>
                                       </c:forEach>
                                       <tr align="center" height="20">
												<c:if test= "${pi.listCount ne 0 }">
													<td colspan="6">
														<!-- [이전] -->
														<c:if test="${ pi.currentPage eq 1 }">
															[이전] 
														</c:if>
														<c:if test="${ pi.currentPage ne 1 }">
															<c:url value="nlist.ad" var="before">
																<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
															</c:url>
															<a href="${ before }">[이전] </a>	
														</c:if> 
														
														<!-- [페이지] -->
														<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
															<c:if test="${ p eq pi.currentPage }">
																<font color="red" size="4"> [${ p }] </font>
															</c:if>
															<c:if test="${ p ne pi.currentPage }">
																<c:url value="nlist.ad" var="page">
																	<c:param name="currentPage" value="${ p }"/>
																</c:url>
																<a href="${ page }"> ${ p } </a>
															</c:if>
														</c:forEach>
														
														 <!-- [다음] -->
														<c:if test="${ pi.currentPage eq pi.maxPage }">
															 [다음]
														</c:if>
														<c:if test="${ pi.currentPage ne pi.maxPage }">
															<c:url value="nlist.ad" var="after">
																<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
															</c:url>
															<a href="${ after }"> [다음]</a>
														</c:if>
													</td>
													</c:if>
												</tr>
											
                                    </table>
                          		 </div>
<c:if test ="${mem.id eq 'admin' }">
<button onclick ="location.href='ninsertForm.ad';" class="btn waves-effect waves-light btn-rounded btn-danger">작성하기</button>
</c:if>                                      
                                        
                                    </div>
                                </div>
                                <!-- End accordian-part -->
                            </div>
                        </div>
                    </div>
                </div>
                
					<!-- footer -->
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
	
		 
<script>




</script>

</body>
</html>
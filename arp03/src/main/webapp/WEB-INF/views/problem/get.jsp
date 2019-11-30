<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../include/bhead.jsp"%>
	
	<!-- 수식 -->
	<script type="text/x-mathjax-config">
      MathJax.Hub.Config({
        tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
      });
    </script>
	<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
	<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
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
                        <h3 class="text-themecolor mb-0 mt-0">Problem</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/${cp }">Home</a></li>
                            <li class="breadcrumb-item active">Problem</li>
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
                <%-- <!-- Row -->
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">게시판관리</h4>
                                <a class="btn btn-success" href="make.pro">문제 만들기</a><br>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>문제</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="p" items="${plist }">
                                        		<tr>
	                                        		<td>${p.p_no }</td>
	                                                <td><a href="get.pro?p_no=${p.p_no }">${p.problem }</a></td>
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row --> --%>
                <!-- Row -->
                <div class="row">
                    <div class="col-12 mt-4">
                        <h4 class="mb-0">Problem ${p.p_no }</h4>
                        <p class="text-muted mt-0">The building block of a card is the <code>.card</code> <code>.card-body</code> Use it whenever you need a padded section within a card.</p>
                        <div class="card">
                            <div class="card-body collapse show">
                                <h2 class="card-title">${p.problem }</h2>
                                <h6 class="card-subtitle">사용변수: ${p.keyval }</h6>
                                <h4 class="card-text card-subtitle">해설: ${p.solve }</h4>
                                <p class="card-text">정답: ${p.solution }</p>
                                <a class="btn btn-success" href="edit.pro?p_no=${p.p_no }">수정</a>
                                <a class="btn btn-danger" href="del.pro?p_no=${p.p_no }">삭제</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of Row -->
                <!-- Row -->
                <div class="row">
                    <div class="col-12 mt-4">
                        <h4 class="mb-0">학생화면</h4>
                        <p class="text-muted mt-0">The building block of a card is the <code>.card</code> <code>.card-body</code> Use it whenever you need a padded section within a card.</p>
                        <div class="card">
                            <div class="card-body collapse show">
                                <h4 class="card-title">${ranp.problem }</h4>
                                <p class="card-text">${ranp.solve }</p>
                                <p class="card-text">${ranp.solution }</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->








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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<h1>문제 상세보기</h1>
	문제: ${p.problem }<br>
	정답: ${p.solution }<br>
	해설: ${p.solve }<br>
	<br>
	
	<h1>학생화면</h1>
	<c:if test="${!empty ranp }">
		문제: ${ranp.problem }<br>
		정답: ${ranp.solution }<br>
		해설: ${ranp.solve }<br>
	</c:if>

	<a href="edit.pro?p_no=${p.p_no }">수정</a>
</body>
</html>
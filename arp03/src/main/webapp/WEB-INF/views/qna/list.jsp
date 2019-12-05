<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<head>
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

        	<!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Q&A</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/${cp }">Home</a></li>
                            <li class="breadcrumb-item active">Q&A</li>
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
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Q&A</h4>
                                <a class="btn btn-success float-left" href="write.qna">문의하기</a><br>
                                <h6 class="card-subtitle"></code></h6>
                                <div class="table-responsive">
                                    <table id="zero_config" class="table hover-table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>m_no</th>
                                                <th>title</th>
                                                <th>questiondate</th>
                                                <th>answerdate</th>
                                                <c:if test="${mem.typee eq 'a' }">
                                                <th>status</th>
                                                </c:if>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="qna" items="${list }">
                                        		<tr>
	                                        		<td>${qna.qna_no }</td>
	                                        		<td>${qna.name }</td>
	                                                <td><a href="get.qna?qna_no=${qna.qna_no }">${qna.title }</a></td>
	                                                <td>${qna.questiondate }</td>
	                                                <td>${qna.answerdate }</td>
	                                                <c:if test="${mem.typee eq 'a' }">
	                                                <td>${qna.status }</td>
	                                                </c:if>
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                    <script>
								   		$('#zero_config').DataTable();
								    </script>
                                </div>
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
	
	
	
	
	
	
	
	
	
	<%-- <jsp:include page="../include/header.jsp"/>
	<a href="write.qna">문의하기</a><br>
	<c:forEach var="qna" items="${list }">
		<a href="get.qna?qna_no=${qna.qna_no }">${qna }</a><br>
	</c:forEach>
	
	<jsp:include page="../include/footer.jsp"/> --%>
</body>
</html>
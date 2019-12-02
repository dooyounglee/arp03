<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../../include/bhead.jsp"%>
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Preloader - style you can find in spinners.css -->
 	<%@ include file="../../include/bpreloader.jsp" %> 
	<!-- End of Preloader - style you can find in spinners.css -->
	
	<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="../../include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="../../include/bsidebar.jsp" %>
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
                        <h3 class="text-themecolor mb-0 mt-0">Reply List</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/${cp }">Home</a></li>
                            <li class="breadcrumb-item active">Reply List</li>
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
                                <h4 class="card-title">댓글관리</h4>
                                <h6 class="card-subtitle">Add class <code>.table</code></h6>
                                <div class="table-responsive">
                                    <table id="zero_config" class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>title</th>
                                                <th>regdate</th>
                                                <th>updatedate</th>
                                                <th>m_no</th>
                                                <th>status</th>
                                                <th>dcount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="r" items="${list }">
                                        		<tr>
	                                        		<td>${r.r_no }</td>
	                                                <td>${r.content }</td>
	                                                <td>${r.regdate }</td>
	                                                <td>${r.update_date }</td>
	                                                <td>${r.m_no }</td>
	                                                <td>
	                                                	<c:if test="${r.status eq 'Y'}">
	                                                		<button class="btn btn-danger" onclick="deleteReply(${r.r_no})">삭제</button>
		                                                	<button class="btn btn-secondary" onclick="declareReply(${r.r_no})">신고</button>
	                                                	</c:if>
	                                                	<c:if test="${r.status eq 'D'}">
	                                                		신고
	                                                	</c:if>
	                                                	<c:if test="${r.status eq 'N'}">
	           	                                     		<button class="btn btn-primary" onclick="deleteCancleReply(${r.r_no})">삭제 취소</button>
	                                                	</c:if>
	                                                </td>
	                                                <td>
	                                                </td>
												</tr>
											</c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>title</th>
                                                <th>regdate</th>
                                                <th>updatedate</th>
                                                <th>m_no</th>
                                                <th>status</th>
                                            </tr>
                                        </tfoot>
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
            <%@ include file="../../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../../include/bjs.jsp" %>
	
	
	
	
	
	
	
	<jsp:include page="../../include/header.jsp"/>
	
	<c:forEach var="r" items="${list }">
		${r }<button onclick="deleteReply(${r.r_no})">삭제</button>
		<button onclick="deleteCancleReply(${r.r_no})">삭제취소</button><br>
	</c:forEach>
	
	<form id="form" method='post'>
		<input type="hidden" name="r_no">
	</form>
	<script>
		function deleteReply(r_no){
			var formm=$('#form').attr('action','deleteReply.ad')
			formm.children('input').eq(0).val(r_no)
			formm.submit();
		}
		function deleteCancleReply(r_no){
			var formm=$('#form').attr('action','deleteCancleReply.ad')
			formm.children('input').eq(0).val(r_no)
			formm.submit();
		}
		function declareReply(r_no){
			var formm=$('#form').attr('action','declareReply.ad')
			formm.children('input').eq(0).val(r_no)
			formm.submit();
		}
		
	</script>
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>
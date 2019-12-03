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
                        <h3 class="text-themecolor mb-0 mt-0">Board List</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/${cp }">Home</a></li>
                            <li class="breadcrumb-item active">Board List</li>
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
                                <h4 class="card-title">게시판관리</h4>
                                <h6 class="card-subtitle">Add class <code>.table</code></h6>
                                <div class="table-responsive">
                                    <table id="zero_config" class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>m_no</th>
                                                <th>title</th>
                                                <th>regdate</th>
                                                <th>updatedate</th>
                                                <th>status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="b" items="${list }">
                                        		<tr>
	                                        		<td>${b.b_no }</td>
	                                        		<td>${b.m_no }</td>
	                                                <td>${b.title }</td>
	                                                <td>${b.regdate }</td>
	                                                <td>${b.update_date }</td>
	                                                <td>
	                                                	<c:if test="${b.status eq 'Y'}">
	                                                		<button class="btn btn-danger" onclick="deleteBoard(${b.b_no})">삭제</button>
	                                                	</c:if>
	                                                	<c:if test="${b.status eq 'N'}">
	           	                                     		<button class="btn btn-primary" onclick="deleteCancleBoard(${b.b_no})">삭제취소</button>
	                                                	</c:if>
	                                                	<c:if test="${b.status eq 'D'}">
	                                                		신고
	                                                	</c:if>
	                                                </td>
												</tr>
											</c:forEach>
                                        </tbody>
                                        <!-- <tfoot>
                                        	<tr>
                                                <th>#</th>
                                                <th>title</th>
                                                <th>regdate</th>
                                                <th>updatedate</th>
                                                <th>dcount</th>
                                                <th>status</th>
                                            </tr>
                                        </tfoot> -->
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
	
	
	
	
	
	
	
	
	

	<form id="form" method='post'>
		<input type="hidden" name="b_no">
	</form>
	<script>
		function deleteBoard(b_no){
			var formm=$('#form').attr('action','deleteBoard.ad')
			formm.children('input').eq(0).val(b_no)
			formm.submit();
		}
		function deleteCancleBoard(b_no){
			var formm=$('#form').attr('action','deleteCancleBoard.ad')
			formm.children('input').eq(0).val(b_no)
			formm.submit();
		}
	</script>
</body>
</html>
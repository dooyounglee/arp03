<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ include file="../include/bhead.jsp"%>
<head>
<style>
	.col-lg-8{
	margin-left:auto;
	margin-right:auto;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Main wrapper -->
	<div id="main-wrapper">

		<!-- Topbar header - style you can find in pages.scss -->
		<header class="topbar">
			<%@ include file="../include/btopbarheader.jsp"%>
		</header>
		<!-- End Topbar header -->

		<!-- Left-sidebar -->
		<aside class="left-sidebar">
			<%@ include file="../include/bsidebar.jsp"%>
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
						<h3 class="text-themecolor mb-0 mt-0">쪽지 상세보기</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${cp }">Home</a></li>
							<li class="breadcrumb-item active">쪽지 상세보기</li>
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

				 <h3 class="card-title mb-0">${m.title}</h3>
				   <div>
                       <hr class="mt-0">
                   </div>
				 <input type="hidden" value="${ m.g_no }" name="m_no" >
				 <h5 > ${m.name}</h5>
				 <h5>${m.content }</h5>
				 <div id="btn" align="right">
				 	<button  class="btn btn waves-effect waves-light btn-rounded btn-outline-info"  onclick="location.href='listMsg.do';">목록으로</button>
				 </div>
				</div>
			</div>
		
		</div>
	</div>
</div>

<!-- footer -->
<footer class="footer">
	<%@ include file="../include/bfooter.jsp"%>
</footer>
<!-- End footer -->

<%@ include file="../include/bjs.jsp"%>

</body>
</html>
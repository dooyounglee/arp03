<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/bhead.jsp"%>
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
						<h3 class="text-themecolor mb-0 mt-0">쪽지함</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/${ cp }">Home</a></li>
							<li class="breadcrumb-item active">쪽지함</li>
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
								<h2 class="card-title mdi mdi-email">보낸 쪽지함</h2>
								<div align="right"><a class="btn waves-effect waves-light btn-info" id="ad"  href="sendMsgFrom.do" style="color:white">쪽지보내기</a></div>

								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>번호</th>
												<th>받은사람</th>
												<th>제목</th>
												<th>날짜</th>
												<th>수신확인</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ mList }" var="m">
												<tr>
													<td>${ m.ms_no }</td>
													<td>${ m.name }</td>
													<td width="300"><a
														href="detailMsg.do?ms_no=${m.ms_no}">${ m.title }</a></td>
													<td>${ m.s_date }</td>
													<c:if test="${m.r_date eq null}">
														<td>읽지않음</td>
													</c:if>
													<c:if test="${m.r_date ne null}">
														<td>읽음</td>
													</c:if>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



								</table>
								<button onclick="location.href='mainMsg.do';">목록으로</button>
</body>
<!-- footer -->
<footer class="footer">
	<%@ include file="../include/bfooter.jsp"%>
</footer>
<!-- End footer -->

<%@ include file="../include/bjs.jsp"%>

</html>
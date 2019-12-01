<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<%-- <table align="center" border="1" cellspacing="0" width="700"> 

<tr>
	<th>휴가번호</th>
	<th>강의번호</th>
	<th>강의명</th>
	<th>학생명</th>
	<th width="50">사유</th>
	<th width="100">휴가날짜</th>
	<th>작성일</th>
	<th>허가상태</th>

</tr>

<c:forEach items="${ list }" var="v">
	<tr>
		<td>${v.v_no}</td>
		<td>${v.lec_no }</td>
		<td>${v.title }</td>
		<td>${v.name }</td>
		<td><a href="vDetail.me?lec_no=${ v.lec_no }&v_no=${v.v_no}">${ v.vacation_title }</a></td>
		<td>${fn:substring(v.vacationdate , 0 ,10) }</td>
		<td>${v.application_date }</td>
		<td>${v.tstatus }</td>
		
	</tr>		
</c:forEach>
</table>
 --%>
 <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">학생휴가관리</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">학생휴가관리</li>
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
 
	<div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">학생 휴가 관리</h4>
                                <h6 class="card-subtitle">StudentVacation<code>.table-bordered</code>for borders on all sides of the
                                    table and cells.</h6><br>
                                <div class="table-responsive">
                                    <table class="table color-table info-table">
                                        <thead>
									<tr>
										<th width="100">휴가번호</th>
										<th>강의번호</th>
										<th>강의명</th>
										<th>학생명</th>
										<th width="100">사유</th>
										<th width="100">휴가날짜</th>
										<th>작성일</th>
										<th>허가상태</th>
									
									</tr>                                  			
                                  
                                        </thead>
                                        <tbody>
								<c:forEach items="${ list }" var="v">
									<tr>
										<td>${v.v_no}</td>
										<td>${v.lec_no }</td>
										<td>${v.title }</td>
										<td>${v.name }</td>
										<td><a href="vDetail.me?lec_no=${ v.lec_no }&v_no=${v.v_no}">${ v.vacation_title }</a></td>
										<td>${fn:substring(v.vacation_date , 0 ,10) }</td>
										<td>${v.application_date }</td>
										<td>${v.tstatus }</td>
										
									</tr>		
								</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
	
	
	
	
	            <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
	        <!-- End footer -->
	        </div>
	
			</div>
	        <!-- End of Page wrapper  -->
	        
			</div>
		<!-- End of Main wrapper -->
	<%@ include file="../include/bjs.jsp" %>

</body>
</html>
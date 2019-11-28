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


<%-- <table  align="center" border="1" cellspacing="0" width="700" method="post">
	<tr>
		<th>강의번호</th>
		<th>강의명</th>
		<th>시작일</th>
		<th>요일</th>
		<th>시작시간</th>
		<th>휴가신청</th>
	</tr>
	
	<c:forEach items="${list }" var="c">
	<tr>
		<td>${c.lec_no }</td>
		<td>${c.title }</td>
		<td>${c.startdate }</td>
		<td>${c.dayofweek}</td>
		<td>${c.starttime }</td>
		<td><a href="vinsertForm.me?m_no=${c.m_no }&lec_no=${c.lec_no}&title=${c.title}">휴가신청하기</a></td>
	</tr>
	</c:forEach>
	 --%>
<%-- 
	<div class="col-lg-6" align="center">
                        <div class="card" align="center">
                            <div class="card-body" align="center">
                                <h4 class="card-title">내가신청한휴가</h4>
                                <h6 class="card-subtitle"></h6>
                                <div class="table-responsive" align="center">
                                
                                    <table class="table color-table info-table">
                                        <thead align="center">
                                            <tr>
                                               <th>휴가번호</th>
                                               <th>강의번호</th>
                                               <th>이름</th>
                                               <th>과목명</th>
                                               <th>사유</th>
                                               <th>휴가날짜</th>
                                               <th>선생님</th>
											   <th>관리자</th>	
                                            </tr>
                                        </thead>
                                        <tbody align="center">
                                        <c:forEach items="${list }" var="c">
                                        <c:if test = "${mem.m_no eq c.m_no }">
										<tr>
											<td>${c.v_no }</td>
											<td>${c.lec_no }</td>
											<td>${c.name }</td>
											<td>${c.title }</td>
											<td><a href="vDetail.me?lec_no=${c.lec_no }&v_no=${c.v_no}">${c.vacation_title }</a></td>
											<td>${fn:substring(c.vacationdate,0 ,10) }</td>
											<td>${c.tstatus }</td>
											<td>${c.astatus }</td>
										</tr>
										</c:if>
										</c:forEach>
                                        
                                        </tbody>
                                    </table>
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
                        <h3 class="text-themecolor mb-0 mt-0">휴가신청하기</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">휴가신청하기</li>
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
                                <h4 class="card-title">휴가관리</h4><a class="btn btn-primary float-right" href="vinsertForm.me">휴가작성하기</a><br>
                                <h6 class="card-subtitle">Add vacation <code>.table</code></h6>
                                <div class="table-responsive">
                                    <table class="table color-table info-table">
                                        <thead>
                                               <tr>
                                               <th>휴가번호</th>
                                               <th>강의번호</th>
                                               <th>이름</th>
                                               <th>과목명</th>
                                               <th>사유</th>
                                               <th>휴가날짜</th>
                                               <th>선생님</th>
											   <th>관리자</th>	
                                            	</tr>
                                        </thead>
                                        <tbody >
                                        <c:forEach items="${list }" var="c">
                                        <c:if test = "${mem.m_no eq c.m_no }">
										<tr>
											<td>${c.v_no }</td>
											<td>${c.lec_no }</td>
											<td>${c.name }</td>
											<td>${c.title }</td>
											<td><a href="vDetail.me?lec_no=${c.lec_no }&v_no=${c.v_no}">${c.vacation_title }</a></td>
											<td>${fn:substring(c.vacationdate,0 ,10) }</td>
											<td>${c.tstatus }</td>
											<td>${c.astatus }</td>
										</tr>
										</c:if>
										</c:forEach>
                                        
                                        </tbody>
                                    </table>
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
		
		
	       <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
	        <!-- End footer -->
	
			</div>
	        <!-- End of Page wrapper  -->
	        
			</div>
		<!-- End of Main wrapper -->


	<%@ include file="../include/bjs.jsp" %>
	






</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../../../include/bhead.jsp"%>
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Preloader - style you can find in spinners.css -->
 	<%@ include file="../../../include/bpreloader.jsp" %> 
	<!-- End of Preloader - style you can find in spinners.css -->
	
	<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="../../../include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="../../../include/bsidebar.jsp" %>
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
                        <h3 class="text-themecolor mb-0 mt-0">Lecture List</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${cp }">Home</a></li>
                            <li class="breadcrumb-item"><a href="lectureList.ad">Lecture List</a></li>
                            <li class="breadcrumb-item"><a href="main.lec?lec_no=${lec.lec_no }">${lec.title }</a></li>
                            <li class="breadcrumb-item"><a href="list.ex">시험</a></li>
                            <li class="breadcrumb-item active">시험만들기</li>
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
                <div class="row">
                	
                	<!-- 수강페이지 메뉴 -->
                	<%@ include file="../../../include/blecturemenu.jsp" %>
                	
                    <div class="col-lg-10 col-xlg-10 col-md-8">
                        <div class="card">
                            <div class="card-body">
                            	
                            	<c:set var="mapping" value="make"/>
								<c:set var="e_no" value="0"/>	
								<c:if test="${!empty e }">
									<c:set var="mapping" value="edit"/>
									<c:set var="e_no" value="${e.e_no }"/>
								</c:if>
	
                                <h4 class="card-title">시험 만들기</h4>
                                <h6 class="card-subtitle">Just add <code>floating-labels</code> class to the form.</h6>
                                <form class="form-material mt-4" action="${mapping }.ex" method="post" autocomplete=off>
                                	<input type="hidden" name="e_no" value="${e_no }">
                                    <div class="form-group mb-5">
                                        <label for="input1">시험이름</label>
                                        <input type="text" class="form-control" id="input1" name="title" value="${e.title }">
                                        <span class="bar"></span>
                                    </div>
                                    <div class="form-group mb-5">
                                        <label for="input1">시험날짜</label>
                                        <input type="date" class="form-control" id="input1" name="examdate" value="${e.examdate.split(' ')[0] }">
                                        <span class="bar"></span>
                                    </div>
                                    <div class="form-group mb-5">
                                        <label for="input1">시험시간</label>
                                        <input type="time" class="form-control" id="input1">
                                        <span class="bar"></span>
                                    </div>
                                    <button class="btn btn-success">완료</button>
                                    <a class="btn btn-success" href="list.ex">목록</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->








		<!-- footer -->
        <footer class="footer">
            <%@ include file="../../../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../../../include/bjs.jsp" %>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../../../include/header.jsp"/>
	<h1>시험만들기</h1>

	<c:set var="mapping" value="make"/>
	<c:set var="e_no" value="0"/>	
	<c:if test="${!empty e }">
		<c:set var="mapping" value="edit"/>
		<c:set var="e_no" value="${e.e_no }"/>
	</c:if>
	
	<form action="${mapping }.ex" method="post" autocomplete=off>
		<input type="hidden" name="e_no" value="${e_no }">
		시험명:<input name="title" value="${e.title }"><br>
		시험날짜:<input type="date" name="examdate" value="${e.examdate.split(' ')[0] }"><br>
		총점:
		문제수:
		시험시간:
		<button>완료</button>
	</form>
	
	<jsp:include page="../../../include/footer.jsp"/>
</body>
</html>
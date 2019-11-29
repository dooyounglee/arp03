<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../include/bhead.jsp"%>
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
                        <h3 class="text-themecolor mb-0 mt-0">Forms</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Form</li>
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
                	<%@ include file="../include/blecturemenu.jsp" %>
                	
                    <div class="col-lg-9 col-xlg-10 col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">시험관리</h4>
                                <a class="btn btn-success float-left" href="daysurvey.ma">설문조사 만들기</a>
                                <div class="table-responsive">
                                    <table class="table table-hover no-wrap">
                                        <thead>
                                            <tr>
                                                <th>설문조사 제목</th>
                                                <th>작성일</th>
                                                <th>작성자</th>
                                                <th>강의명</th>
                                                <!-- 설문조사 인원/ 설문조사 총인원 있으면 좋을듯 -->
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
	
                                        <tbody>
                                        <c:forEach var="d" items="${ list}">
											<tr>
												<fmt:parseDate value="${d.enrolldate}" pattern="yyyy-MM-dd" var="e"/> 
												<fmt:formatDate value="${e}" pattern="yyyy-MM-dd" var = "a"/>
												<td>${d.title }</td>
												<td>${a }</td>
												<td>${d.name }</td>
												<td>${d.title_1 }</td>
												<input id="su_no" type="hidden" value="${d.su_no }">
											</tr>
										</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
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
            <%@ include file="../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../include/bjs.jsp" %>
	
	<script>
	$(document).ready(function(){
		$("td").mouseenter(function(){
			$(this).parent().children().css("cursor", "pointer");
		}).click(function(){
			var no=$(this).parent().children().eq(4).val();
			if("${mem.typee}"=='s'){
			location.href="detailsurvey.ma?su_no=" + no;
			}
			if("${mem.typee}"=='t'){
				location.href="detailsurveystudent.ma?su_no=" + no;
			}
		})
	
	});
	</script>
</body>
</html>
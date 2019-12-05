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
                        <h3 class="text-themecolor mb-0 mt-0">Survey</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${cp }">Home</a></li>
                            <li class="breadcrumb-item"><a href="lectureList.ad">Lecture List</a></li>
                            <li class="breadcrumb-item"><a href="main.lec?lec_no=${lec.lec_no }">${lec.title }</a></li>
                            <li class="breadcrumb-item active">설문조사</li>
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
                <!-- ============================================================== -->
                <div class="row">
                	
                	<!-- 수강페이지 메뉴 -->
                	<%@ include file="../include/blecturemenu.jsp" %>
                	
                    <!-- column -->
                    <div class="col-10">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">설문조사 목록</h4>
                                <c:if test="${mem.typee=='a' }">
                                <a class="btn btn-success float-left" href="daysurvey.ma">설문조사 만들기</a>
                                </c:if>
                                <div class="table-responsive">
								    <table id="zero_config" class="table table-striped table-bordered no-wrap">
								        <thead>
								           <tr>
                                                <th>설문조사 제목</th>
                                                <th>작성일</th>
                                                <th>작성자</th>
                                                <th>강의명</th>
                                                <c:if test="${mem.typee=='s' }">
                                                <th>설문조사 여부 </th>
                                                </c:if>
                                                <!-- 설문조사 인원/ 설문조사 총인원 있으면 좋을듯 -->
                                            </tr>
								        </thead>
								        <tbody>
								        	 <c:forEach var="d" items="${ list}">
											<tr>
												<input id="su_no" type="hidden" value="${d.su_no }">
												<fmt:parseDate value="${d.enrolldate}" pattern="yyyy-MM-dd" var="e"/> 
												<fmt:formatDate value="${e}" pattern="yyyy-MM-dd" var = "a"/>
												<td>${d.title }</td>
												<td>${a }</td>
												<td>${d.name }</td>
												<td>${d.title_1 }</td>
												<c:if test="${mem.typee=='s' }">
												<td>${d.issurvey }</td>
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
			var no=$(this).parent().children().eq(0).val();
			if("${mem.typee}"=='s'){
				if($(this).parent().children().eq(5).text()=="N"){
					location.href="detailsurvey.ma?su_no=" + no;
				}
			}
			if("${mem.typee}"=='t'||"${mem.typee}"=='a'){
				location.href="detailsurveystudent.ma?su_no=" + no;
			}
		})
	});
	</script>
</body>
</html>
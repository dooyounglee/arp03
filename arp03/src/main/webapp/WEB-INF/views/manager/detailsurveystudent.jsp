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
<!--=========================<jsp:include page="../include/header.jsp"/>-->
<fmt:parseDate value="${ssq}" pattern="yyyy-MM-dd" var="e"/> 
<fmt:formatDate value="${e}" pattern="yyyy-MM-dd" var = "d"/>
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
                <c:if test="${mem.typee=='a' }">
                    <div class="col-lg-9 col-xlg-10 col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">설문조사 인원</h4>
                                <div class="table-responsive">
                                    <table class="table table-hover no-wrap">
                                        <tbody>
                                        <tr>
											<td>설문조사 완료한 사람들</td>
										</tr>
										<c:forEach var="Y" items="${Ysq }">
										<tr>
											<td>${Y.name }#${Y.m_no }</td>
										</tr>
										</c:forEach>
										<tr>
										<td>설문조사 안한 사람들</td>
										</tr>
										<c:forEach var="N" items="${Nsq }">
										<tr>
										<td> ${N.name }#${N.m_no }</td>
										</tr>
										</c:forEach>
										<input type="hidden" value="${su_no }" name="su_no">
										<tr>
										<td><button id="result" class="btn btn-success waves-effect waves-light" type="button" >설문조사 결과보기</button>
										<a class="btn btn-inverse waves-effect waves-light" href="selectsurvey.ma?lec_no=${lec.lec_no}">뒤로가기</a></td>
										
										</tr>
										
                                        </tbody>
                                    </table>
									
								</div>
                            </div>
                        </div>
                    </div>
                </c:if>
                 
                  <c:if test="${mem.typee=='t' }">
	                    <div class="col-lg-9 col-xlg-10 col-md-8">
	                        <div class="card">
	                            <div class="card-body">
	                                <h4 class="card-title">설문조사 인원</h4>
	                                <div class="table-responsive">
	                                    <table class="table table-hover no-wrap">
	                                        <tbody>
	                                        <tr>
												<td>설문조사 완료한 사람들</td>
											</tr>
											
											<tr>
												<td>${Ysq.size()}명</td>
											</tr>
											
											<tr>
											<td>설문조사 안한 사람들</td>
											</tr>
											
											<tr>
											<td>${Nsq.size() }명</td>
											</tr>
											
											<input type="hidden" value="${su_no }" name="su_no">
											<tr>
											<td><button id="result" class="btn btn-success waves-effect waves-light" type="button" >설문조사 결과보기</button>
											<a class="btn btn-inverse waves-effect waves-light" href="selectsurvey.ma?lec_no=${lec.lec_no}">뒤로가기</a></td>
											
											</tr>
											
	                                        </tbody>
	                                    </table>
									</div>
	                            </div>
	                        </div>
	                    </div>
	             
                </c:if>
                </div>
				<script>
                  	$(document).ready(function(){
                   		$("#result").click(function(){
           					if(${Ysq[0]!= null }){
								location.href='resultsurvey.ma?su_no=${su_no}'; 
							}
                   		})
               		});
       			 </script>
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

</body> 
</html>
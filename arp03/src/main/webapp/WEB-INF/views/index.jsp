<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="include/bhead.jsp"%>
		
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Preloader - style you can find in spinners.css -->
 	<%@ include file="include/bpreloader.jsp" %> 
	<!-- End of Preloader - style you can find in spinners.css -->

	<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="include/bsidebar.jsp" %>
        </aside>
        <!-- End of Left-sidebar -->
        
        <!-- Page wrapper  -->
        <div class="page-wrapper">
        
            <!-- Container fluid  -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor">Home</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">Home</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center" style="padding-left:30%;">
                        <jsp:include page="question/qRealTimeFree.jsp"></jsp:include>
                        <!-- <div class="d-flex m-t-10 justify-content-end">
                            <div class="d-flex m-r-20 m-l-10 hidden-md-down">
                                <div class="chart-text m-r-10">
                                    <h6 class="m-b-0"><small>THIS MONTH</small></h6>
                                    <h4 class="m-t-0 text-info">$58,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="monthchart"></div>
                                </div>
                            </div>
                            <div class="d-flex m-r-20 m-l-10 hidden-md-down">
                                <div class="chart-text m-r-10">
                                    <h6 class="m-b-0"><small>LAST MONTH</small></h6>
                                    <h4 class="m-t-0 text-primary">$48,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="lastmonthchart"></div>
                                </div>
                            </div>
                            <div class="">
                                <button class="right-side-toggle waves-effect waves-light btn-success btn btn-circle btn-sm pull-right m-l-10"><i
                                        class="ti-settings text-white"></i></button>
                            </div>
                        </div> -->
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
                    <!-- Column -->
                    <div class="col-lg-6 col-md-6">
                        <div class="card">
                            <div class="card-body">
                            	<h3 class="card-title">공지사항</h3>
                                <a class="btn btn-success float-right" href="nlist.ad">더보기</a>
                                <table class="table table-hover">
                                	<thead>
                                		<tr>
		                                	<th></th>
	                                	</tr>
                                	</thead>
                                	<tbody>
                                		<c:forEach var="n" begin="0" end="4" items="${nlist }">
                                			<tr>
			                                	<td><a href="ndetail.ad?n_no=${ n.n_no }">${ n.title }</a></td>
		                                	</tr>
                                		</c:forEach>
                                	</tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">자유게시판</h3>
                                <a class="btn btn-success float-right" href="blist.do">더보기</a>
                                <c:if test="${empty mem}">
                               	로그인 해주세요.
                               	</c:if>
                               	<c:if test="${!empty mem}">
                               		<table class="table table-hover">
	                                	<thead>
	                                		<tr>
			                                	<th>title</th>
			                                	<th>writer</th>
		                                	</tr>
	                                	</thead>
	                                	<tbody>
	                                		<c:forEach var="b" begin="0" end="4" items="${blist }">
	                                			<tr>
				                                	<td><a href="bdetail.do?b_no=${ b.b_no }">${ b.title } <b>[${ b.rcount }]</b></a></td>
				                                	<td>${b.name }</td>
			                                	</tr>
	                                		</c:forEach>
	                                	</tbody>
	                                </table>
                               	</c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->

            </div>
            <!-- End Container fluid  -->
            
            <!-- footer -->
            <footer class="footer">
                <%@ include file="include/bfooter.jsp" %>
            </footer>
            <!-- End footer -->
        
        </div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->


	<%@ include file="include/bjs.jsp" %>
	






<%-- 	<jsp:include page="include/header.jsp"></jsp:include>
index

	<script>
        function nwindow(){
            var url="test";
            window.open(url,"","width=400,height=400,left=600");
        }
        function dwindow(){
            var url="insert.de";
            window.open(url,"","width=400,height=400,left=600");
        }
    </script>
    <input type="button" value="자식을 불러라"  onclick="nwindow()"/>
    <input type="text" value="뭘주려나..." name="get" id="get"/><br>
    
    <input type="button" value="신고"  onclick="dwindow()"/>
    
    
	<jsp:include page="include/footer.jsp"></jsp:include> --%>
</body>
</html>
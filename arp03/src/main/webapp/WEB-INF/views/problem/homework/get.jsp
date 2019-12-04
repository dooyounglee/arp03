<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../../include/bhead.jsp"%>
	
	<!-- 수식 -->
	<script type="text/x-mathjax-config">
      MathJax.Hub.Config({
        tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
      });
    </script>
	<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
	<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
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
                        <h3 class="text-themecolor mb-0 mt-0">Homework</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${cp }">Home</a></li>
                            <li class="breadcrumb-item active">Homework</li>
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
                                <h4 class="card-title">숙제 상세보기</h4>
                                <button class="btn btn-success" onclick="add()">추가하기</button><br>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>문제</th>
                                                <th>제거</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:if test="${empty list }">
                                        		<tr><td colspan="3">문제를 추가해 주세요.</td></tr>
                                        	</c:if>
                                        	<c:forEach var="p" items="${list }">
                                        		<tr>
	                                        		<td>${p.p_no }</td>
	                                                <td><a href="get.pro?p_no=${p.p_no }">${p.problem }</a></td>
	                                                <td><button class="btn btn-danger" onclick="del(${p.p_no })">제거</button></td>
												</tr>
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
		<input type="hidden" name="p_no">
		<input type="hidden" name="hw_no">
	</form>
	<script>
		function del(p_no){
			var formm=$('#form').attr('action','delProblem.hw')
			formm.children('input').eq(0).val(p_no)
			formm.children('input').eq(1).val('${hw.hw_no}')
			formm.submit();
		}
	</script>
	
	
	
	
<%-- ${hw }
<button onclick="add()">추가하기</button><br> --%>
<%-- <div id="problemArea">
	<div id="problemContent">
		<c:forEach var="p" items="${list }">
			${p }<button onclick="del(${p.p_no })">제거</button><br>
		</c:forEach>
	</div>
</div> --%>
<script>
	function add(){
		var url="add.hw?hw_no=${hw.hw_no}";
        window.open(url,34,"width=400,height=400,left=600");
	}
	
</script>
</body>
</html>
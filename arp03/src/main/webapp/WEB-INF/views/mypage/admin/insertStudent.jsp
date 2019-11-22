<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../../include/bhead.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
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
                <!-- Row -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-body">
                            <h3 class="mb-0">학생등록</h3>
                            <p class="text-muted mb-4 font-13"> Bootstrap Elements </p>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <form action="insertMember.ad" method="post" autocomplete=off>
                                    	<input type="hidden" name="typee" value="s">
                                        <div class="form-group">
                                            <label for="id">Email</label>
                                            <input type="text" class="form-control" name="email">
                                        </div>
                                        <button type="submit" class="btn btn-success waves-effect waves-light mr-2">등록</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card card-body">
                            <h3 class="mb-0">선생님등록</h3>
                            <p class="text-muted mb-4 font-13"> Bootstrap Elements </p>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <form action="insertMember.ad" method="post" autocomplete=off>
                                    	<input type="hidden" name="typee" value="t">
                                        <div class="form-group">
                                            <label for="id">이름</label>
                                            <input class="form-control" name="name">
                                        </div>
                                        <div class="form-group">
                                            <label for="pass">Email</label>
                                            <input class="form-control" name="email">
                                        </div>
                                        <div class="form-group">
                                            <label for="pass">Phone</label>
                                            <input class="form-control" name="phone">
                                        </div>
                                        <button type="submit" class="btn btn-success waves-effect waves-light mr-2">등록</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card card-body">
                            <h3 class="mb-0">매니저등록</h3>
                            <p class="text-muted mb-4 font-13"> Bootstrap Elements </p>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <form action="insertMember.ad" method="post" autocomplete=off>
                                        <div class="form-group">
                                            <label for="id">이름</label>
                                            <input class="form-control" name="name">
                                        </div>
                                        <div class="form-group">
                                            <label for="pass">Email</label>
                                            <input class="form-control" name="email">
                                        </div>
                                        <div class="form-group">
                                            <label for="pass">Phone</label>
                                            <input class="form-control" name="phone">
                                        </div>
                                        <button type="submit" class="btn btn-success waves-effect waves-light mr-2">등록</button>
                                    </form>
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../../include/header.jsp"/>
	
	<h2>학생등록</h2>
	<form action="insertMember.ad" method="post" autocomplete=off>
		<input type="hidden" name="typee" value="s">
		email:<input name="email"><br>
		수강할 강의:<input name="lec_no">이건근데, 따로 꽂아줘야 할듯. 한 학생당 한개만 하는게 아니라서.<br>
		<button>등록</button>
	</form>
	<br>
	
	<h2>티쳐등록</h2>
	<form action="insertMember.ad" method="post" autocomplete=off>
		<input type="hidden" name="typee" value="t">
		이름:<input name="name"><br>
		email:<input name="email"><br>
		phone:<input name="phone"><br>
		<button>등록</button>
	</form>
	
	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>
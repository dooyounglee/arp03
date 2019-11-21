<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <!-- Row -->
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="card card-body">
                            <h3 class="mb-0">id찾기</h3>
                            <p class="text-muted mb-4 font-13"> 회원번호 / email / phone 을 입력하세요.</p>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <form action="findId.me" method="post" autocomplete=off>
                                        <div class="form-group">
                                            <label for="id">ID</label>
                                            <input type="text" class="form-control" name="email" id="email" placeholder="회원번호 / email / phone">
                                            <input type="hidden" name="m_no" id="m_no">
                                        </div>
                                        <button type="submit" class="btn btn-success waves-effect waves-light mr-2">찾기</button>
                                    </form>
                                    <script>
										$('#email').on('input',function(){
											var num=$(this).val()
											if(isNaN(num)){
												num='0'
											}
											$('#m_no').val(num)
										})
									</script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="card card-body">
                            <h3 class="mb-0">pw찾기</h3>
                            <p class="text-muted mb-4 font-13">비번은 우리도 모릅니다. 임시 비번으로 바꾸고 입력하신 이메일로 알려줄께요.</p>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <form action="findPw.me" method="post" autocomplete=off>
                                        <div class="form-group">
                                            <label for="id">Email</label>
                                            <input type="text" class="form-control" name="email" placeholder="Enter Email">
                                        </div>
                                        <button type="submit" class="btn btn-success waves-effect waves-light mr-2">임시비번 바꾸기</button>
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
            <%@ include file="../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../include/bjs.jsp" %>
	
	
	
	
	
	


	<jsp:include page="../include/header.jsp"/>
	
	<h1>회원번호로 id찾기</h1>
	회원번호 or email or phone
	<form action="findId.me" method="post" autocomplete=off>
		<input name="email" id="email">
		<input type="hidden" name="m_no" id="m_no">
		<button>찾기</button>
	</form>
	<script>
		$('#email').on('input',function(){
			var num=$(this).val()
			if(isNaN(num)){
				num='0'
			}
			$('#m_no').val(num)
		})
	</script>
	
	<h1>pw찾기</h1>
	<form action="findPw.me" method="post" autocomplete=off>
		비번은 우리도 모릅니다. 임시 비번으로 바꾸고 입력하신 이메일로 알려줄께요.<br>
		email:<input name="email"><button>임시비번바꾸기</button>
	</form>
	
	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
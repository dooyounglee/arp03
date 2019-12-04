<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../include/bhead.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
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
        
        
        
        
        
        	<!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Account Update</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/${cp }">Home</a></li>
                            <li class="breadcrumb-item active">Account Update</li>
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
                    <div class="col-md-6 offset-3">
                        <div class="card">
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="settings" role="tabpanel">
                                    <div class="card-body">
                                    	<h4 class="card-title">비번 수정</h4>
                                        <form action="findChangePw.me" method="post" class="form-horizontal form-material" autocomplete=off>
                                        	<input type="hidden" name="m_no" value="${m.m_no }">
                                            <div class="form-group">
                                                <label class="col-md-12">New Password</label>
                                                <div class="col-md-12">
                                                    <input class="form-control form-control-line" name="pw">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Confirm Password</label>
                                                <div class="col-md-12">
                                                    <input class="form-control form-control-line" id="pw">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <button type="button" class="btn btn-success" onclick="changePw(this)">Change Password</button>
                                                </div>
                                            </div>
                                        </form>
                                        <script>
                                        	function changePw(this_){
                                        		if($('#newPw').val()=="" || $('input[name="newPw"]').eq(0).val()==""){
                                        			alert("빈칸은 안돼요.")
                                        			return;
                                        		}else if($('#newPw').val()!=$('input[name="newPw"]').eq(0).val()){
                                        			alert('새로운 비번이 달라요.')
                                        			return;
                                        		}
                                        		$(this_).closest('form').submit()
                                        	}
                                        </script>
                                    </div>
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
	
	
	
	
	
	
	
	
	
	
	
	
<%-- 	<jsp:include page="../include/header.jsp"/>
	
	<h1>내정보</h1>
	${mem }

	<h1>수정</h1>
	<form action="update.me" method="post" autocomplete=off>
		<input type="hidden" name="m_no" value="${mem.m_no }">
		학생/선생번호:<input value="${mem.m_no }" disabled><br>
		id:<input value="${mem.id }" disabled><br>
		이름:<input name="name" value="${mem.name }"><br>
		email:<input name="email" value="${mem.email }"><br>
		phone:<input name="phone" value="${mem.phone }"><br>
		<button>수정</button>
	</form>
	
	<h1>비번변경</h1>
	<form action="changePw.me" method="post" autocomplete=off>
		<input type="hidden" name="m_no" value="${mem.m_no }">
		현재:<input name="pw"><br>
		새 비번:<input name="newPw"><br>
		<button>변경</button>
	</form>
	
	<h1>탈퇴</h1>
	<form action="leave.me" method="post" autocomplete=off>
		<input type="hidden" name="m_no" value="${mem.m_no }">
		<button>탈퇴</button>
	</form>
	<jsp:include page="../include/footer.jsp"/> --%>
</body>
</html>
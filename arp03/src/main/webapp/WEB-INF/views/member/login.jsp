<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <div class="col-lg-6 col-md-6 offset-3">
                        <div class="card card-body">
                            <h3 class="mb-0">Login</h3>
                            <p class="text-muted mb-4 font-13"> Bootstrap Elements </p>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <form action="login.me" method="post">
                                        <div class="form-group">
                                            <label for="id">ID</label>
                                            <input type="text" class="form-control" name="id" id="id" placeholder="Enter Username">
                                        </div>
                                        <div class="form-group">
                                            <label for="pass">Password</label>
                                            <input type="password" class="form-control" name="pw" id="pass" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="checkbox checkbox-success">
                                                <input name="remember" id="remember" type="checkbox">
                                                <label for="remember"> 자동로그인 </label>
                                                <input id="idSaveCheck" type="checkbox">
                                                <label for="idSaveCheck"> id/pw 기억하기 </label>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-success waves-effect waves-light mr-2">login</button>
                                        <button type="button" class="btn btn-inverse waves-effect waves-light" onclick="location.href='find.me'">id/pw찾기</button>
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


	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<form action="login.me" method="post" autocomplete=off>
		id:<input name="id" id="id"><br>
		pw:<input name="pw" id="pass"><button>로그인</button><br>
		<input type="checkbox" name="remember">자동로그인 | <input type="checkbox" id="idSaveCheck"> 아이디/비번 기억하기<br>
	</form>
	
	<script>
	$("#id").val(Cookies.get('id'));      
	$("#pass").val(Cookies.get('pass'));      
    if($("#id").val() != ""){
        $("#idSaveCheck").attr("checked", true);
    }
    
    $("#idSaveCheck").change(function(){
        if($("#idSaveCheck").is(":checked")){
            Cookies.set('id', $("#id").val(), { expires: 7 });
            Cookies.set('pass', $("#pass").val(), { expires: 7 });
        }else{
              Cookies.remove('id');
              Cookies.remove('pass');
        }
    });
    
    $("#id,#pass").keyup(function(){
        if($("#idSaveCheck").is(":checked")){
            Cookies.set('id', $("#id").val(), { expires: 7 });
            Cookies.set('pass', $("#pass").val(), { expires: 7 });
        }
    });
	</script>
	
	
	<table border=1>
		<tr>
			<th>id</th>
			<th>pw</th>
		</tr>
	<c:forEach var="m" items="${list }">
		<tr>
			<td>${m.id }
			<td>${m.pw }
		</tr>
	</c:forEach>
	</table>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
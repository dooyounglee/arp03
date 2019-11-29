<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/bhead.jsp"%>
<meta charset="UTF-8">
<title>나의 쪽지함</title>
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
        <!-- Page wrapper  -->

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
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title mdi mdi-email">보낸 쪽지함</h4>
						<div align="center">
						<a id="sMsg" onclick="view(this.id)" style="cursor:pointer; color:blue">보낸 쪽지</a> 	|
						<a id="gMsg" onclick="view(this.id)" style="cursor:pointer; color:blue">받은 쪽지</a>
						</div>
						
						<div align="right"><a class="btn waves-effect waves-light btn-info" id="ad"  href="sendMsgFrom.do" style="color:white">쪽지보내기</a></div>
						<br><br>
						<div>
                        <iframe id="ifsMsg"  src="listMsg.do" width="100%" height="400px"  frameborder="0" scrolling="no" frameborder="0" scrolling="no"   ></iframe>
                        <iframe id="ifgMsg"  src="listSendMsg.do" width="100%" height="400px"  frameborder="0" scrolling="no"   style="display:none"></iframe>
                      <!--   onload="resizeIframe(this)" -->
                         </div>
				
					
						<button class="btn waves-effect waves-light btn-info" onclick="location.href='mainMsg.do';" >목록으로</button>
					</div>
				</div>
			</div>
		</div>

<script>
	
	
	function view(data){
		  
	
		if(data == "sMsg"){
		   		 $("#ifsMsg").show();
		         $("#ifgMsg").hide();
		         $(".card-title").text("보낸쪽지함");
		}else{
				$("#ifsMsg").hide();
	        	$("#ifgMsg").show();
	        	$(".card-title").text("받은쪽지함");
		}
	}

	
/* 	  function resizeIframe(obj) {
		    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
		  } */

		  
	/* 	  $("#ad").click(function(){
			  window.open('sendMsgFrom.do', "", width=200, height=100);
			  });
	   */
	
		 
	
		
	
	
</script>

   			<!-- footer -->
            <footer class="footer">
                <%@ include file="../include/bfooter.jsp" %>
            </footer>
            <!-- End footer -->
            
            <%@ include file="../include/bjs.jsp" %>



</body>
</html>
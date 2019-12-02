<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
 <%@ include file="../include/bhead.jsp"%> 
<html>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<meta charset="UTF-8">
<title>Send Message</title>
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
	                            <h3 class="card-title mdi mdi-email">답장 보내기</h3>
	                     <c:forEach items="${ msg }" var="m">
	                      <form action="insertMsg.do" >
	                            <div class="form-group">
	                                <input class="form-control" name="title" placeholder="제목을 입력해주세요" value="${m.title }"required>
	                            </div>
	                            <div class="form-group">
	                           		 <input type="hidden" value="${ mem.m_no }" name="s_no">
	                            	<input type="hidden"  name="g_no" id="g_no" value="${ m.s_no }">
	                                <input class="form-control"  name="name" id="g_list" placeholder="ex) 강보람-5"  value="${m.name }"required>
	                                    
	                                
	                                 <%--   <input type="checkbox" id="me" name="me" value="${mem.name}-${mem.m_no}">나에게 쓰기<br> --%>
	                            </div>
	                            <div class="form-group">
	                                <textarea class="textarea_editor form-control" name="content" rows="15"
	                                    placeholder="내용을 입력해주세요" required></textarea>
	                            </div>
	                     
	                            <button type="submit" onclick="sub()" class="btn btn-success mt-3"><i
	                                    class="fa fa-envelope-o"></i> Send</button>
	                            <button type="button" class="btn btn-inverse mt-3" onclick="history.back();"><i class="fa fa-times"></i>
	                                Discard</button>
	           					</form>
	           					</c:forEach>
	                        </div>
	                       </div>
	                    </div>
	                  </div>
	                </div>
	                
              
<%--                  
<form action="insertMsg.do">
<h3>쪽지보내기</h3>
제목 : <input type="text" name="title"><br>
<input type="hidden" value="${ mem.m_no }" name="s_no">
<input type="hidden"  name="g_no" id="g_no">
받는사람 : <input type="text" name="name" id="g_list" style="width:250px" placeholder="이름뒤에 -와 회원번호를 입력해주세요"><input type="checkbox" id="me" name="me" value="${mem.name}-${mem.m_no}">나에게 쓰기<br>
<textarea rows="3" cols="50" name="content">
</textarea>

<button onclick="abc()">보내기</button>
</form> --%>


<script>

$(document).ready(function() {
	$("#g_list").autocomplete({
		source : function(request, response) {

			$.ajax({

				url : "autocomplete",
				type : "post",
				dataType : "json",
				data: request,

				success : function(data) {

					var result = data;
					response(result);
				},

				error : function(data) {
					alert("에러가 발생하였습니다.")
				}
			});
		}
	});
});





	function sub(){
		
	
		var gno = $("#g_no").val();
		console.log(gno);
		wsa.send(gno);
		submit();

}

	

</script>

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
	
<!-- 	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>   -->
	
</body>
</html>


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
	                            <h3 class="card-title mdi mdi-email">쪽지 보내기</h3>
	                   				   <form action="insertMsg.do" >
	                            <div class="form-group">
	                                <input class="form-control" name="title" placeholder="제목을 입력해주세요" required>
	                            </div>
	                            <div class="form-group">
	                            
	                           		 <input type="hidden" value="${ mem.m_no }" name="s_no">
	                            	<input type="hidden"  name="g_no" id="g_no">
	                                    
	                               	   <label style="color:black">받는사람 </label>
	                               	   <p id="memId" style="color:black"></p>
	                                 <button type="button" class="btn btn-info" data-toggle="modal"
                                        data-target="#bs-example-modal-lg">회원선택</button>
	                                 
	                                 <!-- 모달 창 -->
		                                <div class="modal fade" id="bs-example-modal-lg" tabindex="-1" role="dialog"
		                                    aria-labelledby="myLargeModalLabel" aria-hidden="true">
		                                    <div class="modal-dialog modal-lg">
		                                        <div class="modal-content">
		                                            <div class="modal-header">
		                                              
		                                                <button type="button" class="close" data-dismiss="modal"
		                                                    aria-hidden="true">×</button>
		                                            </div>
		                                            <div class="modal-body">
		                                            
		                                                  <div class="card">
									                            <div class="card-body">
									                                <h4 class="card-title">회원선택</h4>
									                                <h6 class="card-subtitle">Member</h6>
									                                <div class="table-responsive">
									                                <table id="zero_config" class="table no-wrap">
				                                                         <thead>
				                                                            <tr>
				                                                               <th>회원번호</th>
				                                                               <th>구분</th>
				                                                               <th>이름</th>
				
				                                                            </tr>
				                                                         </thead>
				                                                         <tbody>
				                                                            <c:forEach items="${ list }" var="m">
				                                                               <tr>
				                                                                  <td>${m.m_no }</td>
				                                                                  
				                                                                  <c:if test="${m.typee eq 's'}">
				                                                                  <td>학생</td>
				                                                                  </c:if>
				                                                                  
				                                                                   <c:if test="${m.typee eq 't'}">
				                                                                  <td>선생님</td>
				                                                                  </c:if>
				                                                                  
				                                                            
				                                                                  <td style="cursor:pointer" class="nameGet">${m.name }</td>
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
		                                        </div><!-- /.modal-content -->
		                                    </div><!-- /.modal-dialog -->
		                                </div><!-- /.modal -->
	                                
	                          

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
	                        </div>
	                       </div>
	                    </div>
	                  </div>
	                </div>
	                
              
<script>

$(".nameGet").on("click", function(){
	var name = $(this).text();
	var mno = $(this).prev().prev().text();
	var str = name.concat("#", mno);
	console.log(str);
	
	$("#memId").text(str);
	$("#g_no").val(mno);
	
	$('.modal').modal("hide"); 
	
	
})
	



function abc(){
	//....
	var gno = $("#g_no").val();
	ws.send(gno);
    submit(); 
}


function select(){
	window.open("","","width=400");
}
</script>



<script>

/* $(document).ready(function() {
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
}); */





$("#g_list").change(function(){
	var name = $(this).val();
	console.log(name);
	var mno =name.split("-")[1];
	console.log(mno);
	
	$("#g_no").val(mno);
	
});

$("#basic_checkbox_1").on("click", function(){
	var me = $(this).val();
	console.log(me);
	var mno =me.split("-")[1];
	$("#g_list").val(me);
	console.log(mno);
	$("#g_no").val(mno);

	
})

 $("#basic_checkbox_1").click(function(){ 
       if($("#basic_checkbox_1").prop("checked")){ 
          $("input[name=basic_checkbox_1]").prop("checked",true);
	        var me = $(this).val();
	      	console.log(me);
	      	var mno =me.split("-")[1];
	      	$("#g_list").val(me);
	      	console.log(mno);
	      	$("#g_no").val(mno);
	        $("#g_list").prop("readonly",true);
          
      }else{
         $("input[name=basic_checkbox_1]").prop("checked",false); 
         $("#g_list").val("");
         $("#g_no").val("");
         $("#g_list").prop("readonly",false);
      }    
 })


	function sub(){
		
	
		var gno = $("#g_no").val();
		console.log(gno);
		wsa.send(gno);
		submit();
		
		
		/* alert("전송되었습니다");
		opener.location.reload();	// window창 닫히면서 부모창 새로고침
		window.close();
 		submit();  */
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


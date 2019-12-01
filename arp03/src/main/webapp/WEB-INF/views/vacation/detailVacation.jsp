<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>




</style>
<%--  <script src="${pageContext.request.contextPath}/resources/js/signature_pad.min.js" type="text/javascript"></script>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/css.css"> --%>

<%@ include file="../include/bhead.jsp"%>
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
	<!-- End of Left-sidebar -->
	
	<%-- 
		
		<c:if test="${mem.typee eq 't' }">
		<button onclick="location.href='sVlist.te';">리스트로돌아가기</button>
		<c:if test ="${v.tstatus eq 'N' }">
	 
		<!-- <button type="button" class="btn btn-info" data-toggle="modal" data-target="#bs-example-modal-lg">허가</button> -->
		<!--<button id="sign">사인하기</button>  -->
		<a onclick="window.open('companiForm.me?lec_no=${v.lec_no}&v_no=${v.v_no }',width=300, height=300)" style="cursor:pointer">반려</a>
		</c:if>
		<!-- iframe으로 가져오기 -->
		<!-- <div class="modal fade" id="bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="display: none;" aria-hidden="true">
	                                    <div class="modal-dialog modal-lg">
	                                        <div class="modal-content">
	                                            <div class="modal-header">
	                                                <h4 class="modal-title" id="myLargeModalLabel">싸인하기</h4>
	                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                                            </div>
	                                            <div class="modal-body">
	 												<iframe id="sof" name="sof" src="signature-pad.te" width="100%" height="400" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
	                                            </div>
	                                        </div>/.modal-content
	                                    </div>/.modal-dialog
	                                </div> -->
		</c:if>
		<br><br>
	
		<c:if test="${mem.typee eq 's' }">
		<button onclick="location.href='vlist.me';" align="center">리스트로 돌아가기</button>
		 
		<c:if test="${v.tstatus eq 'N'}">
		<a href="vdelete.me?lec_no=${ v.lec_no }&v_no="${v.v_no }">삭제하기</a>
		</c:if>
		<c:if test="${v.tstatus eq 'B'}">
		<a href="vdelete.me?v_no=${ v.v_no }" >삭제하기</a>	
		</c:if>
		</c:if> --%>
		
	
		
<%-- 		</c:forEach> --%>
	
	
	
	<div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">휴가상세보기</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/arp">Home</a></li>
                            <li class="breadcrumb-item active"><a href="vlist.me">휴가신청하기</a></li>
                            <li class="breadcrumb-item active">휴가상세보기</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-12 align-self-center d-none d-md-block">
                        <div class="d-flex mt-2 justify-content-end">
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                   
                                </div>
                                <div class="spark-chart">
                                </div>
                            </div>
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                   
                                </div>
                                <div class="spark-chart">
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
                    <div class="col-12" align="center">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="card-title">휴가상세보기</h2><br>
                                <h6 class="card-subtitle"> vacation <code>.table</code></h6>
                                <div class="table-responsive">
                                    <table class="table color-table info-table">
                                        <thead>
                                           
                                  
                          <%--                    <c:if test="${mem.typee eq 's' }">
                                               <th></th>
                                              </c:if>
                                             <c:if test="${mem.typee eq 't' }">
                                             	<th colspan="2" textalign="center">결제</th>
                                             </c:if>	 --%>
                                           
                                        </thead>
                                        <tbody >
                                     	<c:forEach items="${list}" var="v">  
										<tr>
											
											
					
									
										</c:forEach>
																			
			
                                        </tbody>
     				                                
                                    </table>
       	
				
				<c:forEach items="${list}" var="v" >  
				<div class="col-md-3 col-xs-10 col-sm-2 no-padding" style="display:inline-block" >
								 
								 <input type="hidden" name="lec_no" value="${v.lec_no }">
								 <input type="hidden" name="v_no" value="${v.v_no }">
								 
                                        <div class="pricing-box featured-plan">
                                            <div class="pricing-body"  >
                                                   
                                                <div class="pricing-header">
                                                    <h4 class="price-lable text-white bg-warning">${v.lec_no }</h4>
                                                    <h4 class="text-center">강의명</h4>
                                                    <h1 class="text-center"><span class="price-sign"></span>${v.title }</h1>
                                                  <c:if test="${mem.typee eq 's' }">  
                                                    <c:if test="${v.status eq 'N'}">
                                                    <p class="uppercase badge badge-danger">처리중</p>
                                                    </c:if>
                                                    <c:if test="${v.tstatus eq 'B' }">
                                                     <p class="uppercase badge badge-warning">반려</p>
                                                    </c:if>
                                                    <c:if test="${v.status eq 'Y'}">
                                                    <p class="uppercase badge badge-info">처리완료</p>
                                                    </c:if>
                                                   </c:if> 
                                                </div>
                                                <div class="price-table-content">
                                                    <div class="price-row"><i class="mdi mdi-calendar-check"></i>${fn:substring(v.vacation_date,0,10) }</div>
                                                    <div class="price-row"><i class="icon-note"></i> ${v.reason }</div>
                                                     <div class="price-row"><i class="ti-user">학생 : </i>${v.name }</div>
                                                     <div class="price-row">
                                                  <c:if test="${v.tstatus eq 'N'}">
                                                  		<i class="ti-user">선생님 :</i>  처리중
                                                  </c:if>
                                                  <c:if test="${v.tstatus eq 'B' }">
                                                  		<i class="ti-user">선생님 :</i>  반려
                                                  </c:if>
                                                  <c:if test="${v.tstatus eq 'Y' }">
                                                  		<i class="ti-user">선생님 :</i>  승인
                                                  </c:if>
                                                
                                                    </div>
                                                    <div class="price-row">
                                                 <c:if test="${mem.typee eq 't' }">
                                              	   <c:if test="${v.tstatus eq 'N' }">
													<td>
														<a onclick="location.href='permission.te?lec_no=${ v.lec_no }&v_no=${v.v_no }&vacation_date=${fn:substring(v.vacation_date , 0 ,10)}'" style="cursor:pointer">허가</a>
													</td>
													<td>	
														<a onclick="window.open('companiForm.me?lec_no=${v.lec_no}&v_no=${v.v_no }&vacation_date=${fn:substring(v.vacation_date , 0 ,10)}',width=300, height=300)" style="cursor:pointer">반려</a>
													</td>
													</c:if>	
												</c:if>          
												 <c:if test="${mem.typee eq 's' }">
													 <c:if test="${v.tstatus eq 'B' }">
												 	 사유 : ${v.companion_reason }
													 </c:if> 
                                                 </c:if>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                         
                                        </div>
                                         <br>
                                    </div>
                                   
										</tr>
                              </c:forEach>
                                 
                                </div>	
										<c:if test="${mem.typee eq 's' }">
									`<a href="vdelete.me?v_no=${v.v_no }" class="btn waves-effect waves-light btn-rounded btn-outline-warning" style="float:right;" >삭제하기</a>
										</c:if>	
										<c:if test="${mem.typee eq 't' }">		
                                 <button onclick="location.href='sVlist.te';" class="btn waves-effect waves-light btn-rounded btn-outline-info" style="float:right;">리스트로돌아가기</button>
                                 		</c:if>
                                 		<c:if test="${mem.typee eq 's' }">		
                                 <button onclick="location.href='vlist.me';" class="btn waves-effect waves-light btn-rounded btn-outline-info"style="float:right;">리스트로돌아가기</button>
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
	
	
		<%-- <c:if test="${mem.typee eq 't' }">
		<button onclick="location.href='sVlist.te';">리스트로돌아가기</button>
		<c:if test ="${v.tstatus eq 'N' }">
	 	<a onclick="location.href='permission.te?lec_no=${ v.lec_no }&v_no=${v.v_no }'" style="cursor:pointer">허가</a> 
		<!-- <button type="button" class="btn btn-info" data-toggle="modal" data-target="#bs-example-modal-lg">허가</button> -->
		<!--<button id="sign">사인하기</button>  -->
		<a onclick="window.open('companiForm.me?lec_no=${v.lec_no}&v_no=${v.v_no }',width=300, height=300)" style="cursor:pointer">반려</a>
		</c:if> --%>
		<!-- iframe으로 가져오기 -->
		<!-- <div class="modal fade" id="bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="display: none;" aria-hidden="true">
	                                    <div class="modal-dialog modal-lg">
	                                        <div class="modal-content">
	                                            <div class="modal-header">
	                                                <h4 class="modal-title" id="myLargeModalLabel">싸인하기</h4>
	                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                                            </div>
	                                            <div class="modal-body">
	 												<iframe id="sof" name="sof" src="signature-pad.te" width="100%" height="400" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
	                                            </div>
	                                        </div>/.modal-content
	                                    </div>/.modal-dialog
	                                </div> -->
		
		<br><br>
	            <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
	        <!-- End footer -->
	
			</div>
	        <!-- End of Page wrapper  -->
	        
			</div>
		<!-- End of Main wrapper -->
	<%@ include file="../include/bjs.jsp" %>
	
	 <!--  헤더 제이쿼리 충돌 방지  -->
	
	
	<!-- <script>
	
	var jq132 = jQuery.noConflict();

	
	</script> -->
	
<script>

/* $("#signText").click(function(){
	alert("ㅋㅋㅋ");
})


function myvacation() {
	  window.print("#tb");
	  
	}
		
	var canvas = $("#signature-pad canvas")[0];
	var sign = new SignaturePad(canvas, {
	    minWidth: 1,
	    maxWidth: 5,
	    penColor: "rgb(0, 0, 0)"
	});
	 
	$("[data-action]").on("click", function(){
	    if ( $(this).data("action")=="clear" ){
	        sign.clear();
	    }
	    else if ( $(this).data("action")=="save" ){
	        if (sign.isEmpty()) {
	            alert("사인해 주세요!!");
	        } else {
	            $.ajax({
	                url : "save.jsp",
	                method : "post",
	                dataType : "json",
	                data : {
	                    sign : sign.toDataURL()
	                },
	                success : function(r){
	                    alert("저장완료 : " + r.filename);
	                    sign.clear();
	                },
	                error : function(res){
	                    console.log(res);
	                }
	            });
	        }
	    }
	});
	 
	 
	function resizeCanvas(){
	    var canvas = $("#signature-pad canvas")[0];
	
	    var ratio =  Math.max(window.devicePixelRatio || 1, 1);
	    canvas.width = canvas.offsetWidth * ratio;
	    canvas.height = canvas.offsetHeight * ratio;
	    canvas.getContext("2d").scale(ratio, ratio);
	}
 	 
	$(window).resize( function(){
	    resizeCanvas();
	});
	 
	resizeCanvas();


	
 */



</script>
	

</body>
</html>
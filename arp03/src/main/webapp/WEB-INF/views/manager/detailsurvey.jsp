<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../include/bhead.jsp"%>
</head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<body class="fix-header card-no-border logo-center">
<%-- <jsp:include page="../include/header.jsp"/> --%>
<fmt:parseDate value="${ssq}" pattern="yyyy-MM-dd" var="e"/> 
<fmt:formatDate value="${e}" pattern="yyyy-MM-dd" var = "d"/>
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
               
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                	
                	<!-- 수강페이지 메뉴 -->
                	<%@ include file="../include/blecturemenu.jsp" %>
                	
                    <div class="col-lg-9 col-xlg-10 col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">설문조사하기</h4>
                                <div class="table-responsive">
                                	<form action="insertcompletesurvey.ma">
                                
                                    <table class="table table-hover no-wrap">
                                    	<thead>
                                    		<tr>
                                    			<input type="hidden" name="lec_no" value="${lec.lec_no}" >
                                    			<input type="hidden" name="su_no" value="${ssu}">
												<td ><p>${lec.lec_no}</p></td>
												<td ><p>${mem.name }</p></td>
												<td><p>${title }</p></td>
												<td><p>${d}</p></td>
												<td><p>점수</p></td>
                                    		</tr>
                                    	</thead>
                                        <tbody>
                                        	<c:forEach items="${s }" var="a" varStatus="status">
                                        		<tr>
													<td colspan="1"><p>질문 ${status.count} : ${a.question }</p></td>
													<td colspan="4">
														 <div class="row mr-0">
														 	<div class="col-md-12">
														 	 	<h4 class="card-title">만족도조사</h4>
														 		<%-- <div id="rlarudtn[${status.index}]"></div> --%>
														 		<input  id="rlarudtn${status.index}" name="answer">
														 	</div>
														 </div>
										            </td>
												</tr>
											</c:forEach>
												
											<button class="btn btn-success" type="submit">설문완료</button>
                                        </tbody>
                                    </table>
                                    </form>
                                   <script>
                                    $(document).ready(function(){
                                    	console.log("222");
                                   
                                    	for(var i=0; i<${s.size()}; i++){
                                    		console.log("rlarudtn"+i);
		                                    $("#rlarudtn"+i).attr("value", $("#irs-hidden-input").val()).ionRangeSlider({
		                                        grid: true,
		                                        min: 1,
		                                        max: 5,
		                                        from: 3,
		                                        prefix: "만족도 "
		                                    })
		                                  
                                    }
                                    });
                                    /* 	for(var i=0; i<${s.size()}; i++){
                            		console.log("rlarudtn["+i+"]");
                                    $("#rlarudtn["+i+"]").ionRangeSlider({
                                        grid: true,
                                        min: 1,
                                        max: 5,
                                        from: 3,
                                        prefix: "만족도 ",
                                        max_postfix: "+"
                                    })
                                    range_16[${stauts.index}]
                                    #range_16["+i+"]
                            	} */
                                    </script> 
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                
                
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
	<td><input type="range" id="answer[${status.index }]"
	class="inputrange" name="answer[${status.index }]" placeholder="답변" 
	min="1" max="5" step="0.5" required oninput="document.getElementById('value[${status.index}]').innerHTML=this.value;"></td>
	<td><span id="value[${status.index}]">0</span> </td>

</body>
</html>
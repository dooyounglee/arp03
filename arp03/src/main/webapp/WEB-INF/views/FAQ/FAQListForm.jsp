<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

/* ul,li{

display:inline;

} */

</style>
<body>
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




  <%-- <div class="col-lg-12" align="center" style="margin:auto">
                        <div class="card" align="center">
                            <div class="card-body" align="center">
                                <div class="table-responsive">
                                    <table class="table color-table info-table">
                                        <thead align="center">
                                         <tr>
											<th>category</th>
											<th colspan="3" width="300">Question</th>
										</tr>
										
										
                                        </thead>
                                         <c:forEach items="${ list }" var="f">
                                        <tbody align="center"> 
                                        <tr>
                                        	<td>
                                        	<c:if test ="${f.category eq '수강' }">
                                        		<span class="badge badge-danger">${f.category }</span>
                                        	</c:if>
                                        	<c:if test="${ f.category eq '로그인' }">
												<span class="badge badge-warning">${f.category }</span>
                                        	</c:if>	
                                    		<c:if test="${ f.category eq '홈페이지' }">
                                    			<span class="badge badge-info">${f.category }</span>
                                    		</c:if>
											</td>
											<td colspan="3"  class="question" style="cursor:pointer">${ f.question }</td>
										</tr>       	
                                            <tr>
												<td colspan="3" style="display:none" style="cursor:pointer" class="table-active">
													${f.answer } 
													<c:if test="${ mem.id eq 'admin' }">
													<a href="fdelete.ad?faq_no=${ f.faq_no }" >삭제하기</a>
													</c:if>
												</td>
											</tr>
                                        </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
 --%>
<div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                 <div class="row page-titles">
                    <div class="col-md-3 col-10 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">FAQ</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/arp">Home</a></li>
                            <li class="breadcrumb-item active">FAQ</li>
                        </ol>
                    </div>
               
                    <div class="col-md-7 col-12 align-self-center d-none d-md-block">
                        <div class="d-flex mt-2 justify-content-end">
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <!-- h6 class="mb-0"><small>THIS MONTH</small></h6>
                                    <h4 class="mt-0 text-info">$58,356</h4> --></div>
                                <div class="spark-chart">
                                   <%--  <div id="monthchart"><canvas width="60" height="35" style="display: inline-block; width: 60px; height: 35px; vertical-align: top;"></canvas></div> --%>
                                </div>
                            </div>
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <!-- <h6 class="mb-0"><small>LAST MONTH</small></h6>
                                    <h4 class="mt-0 text-primary">$48,356</h4> --></div>
                                <div class="spark-chart">
                                   <%--  <div id="lastmonthchart"><canvas width="60" height="35" style="display: inline-block; width: 60px; height: 35px; vertical-align: top;"></canvas></div> --%>
                                </div>
                            </div>
                            <div class="">
                                <button class="right-side-toggle waves-effect waves-light btn-success btn btn-circle btn-sm pull-right ml-2"><i class="ti-settings text-white"></i></button>
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
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                
                                <!-- Accordian-part -->
                                <div id="accordian-part">
                                    <div id="accordian-3">
								<c:if test="${ mem.id eq 'admin' }">
								<button class="btn waves-effect waves-light btn-rounded btn-danger" onclick="location.href='finsertForm.ad';">작성하기</button>
								</c:if>
								<h2 align="center">FAQ 입니다</h2>                                    
                <nav align="center">
				<ul align="center" >
					<a href="flist.ad" class="btn waves-effect waves-light btn-rounded btn-outline-secondary">전체</a>
					<a href="fcategory.ad?category=수강"  class="btn waves-effect waves-light btn-rounded btn-outline-danger">수강</a>
					<a href="fcategory.ad?category=로그인" class="btn waves-effect waves-light btn-rounded btn-outline-warning">로그인</a>
					<a href="fcategory.ad?category=홈페이지" class="btn waves-effect waves-light btn-rounded btn-outline-info">홈페이지</a>
					<a href="fcategory.ad?category=기타" class="btn waves-effect waves-light btn-rounded btn-outline-primary">기타</a>
				</ul>
				</nav><br><br>                                         
                                         <table class="table color-table info-table">
                                        <thead align="center">
                                         <tr>
											<th>category</th>
											<th colspan="3" width="300">Question</th>
										</tr>
										
										
                                        </thead>
                                         <c:forEach items="${ list }" var="f">
                                        <tbody align="center"> 
                                        <tr>
                                        	<td>
                                        	<c:if test ="${f.category eq '수강' }">
                                        		<span class="badge badge-danger">${f.category }</span>
                                        	</c:if>
                                        	<c:if test="${ f.category eq '로그인' }">
												<span class="badge badge-warning">${f.category }</span>
                                        	</c:if>	
                                    		<c:if test="${ f.category eq '홈페이지' }">
                                    			<span class="badge badge-info">${f.category }</span>
                                    		</c:if>
                                    		<c:if test="${ f.category eq '기타' }">
                                    			<span class="badge badge-primary">${f.category }</span>
                                    		</c:if>
											</td>
											<td colspan="3"  class="question" style="cursor:pointer">${ f.question }</td>
										</tr>       	
                                            <tr>
												<td colspan="3" style="display:none" style="cursor:pointer" class="table-active">
													${f.answer } 
													<c:if test="${ mem.id eq 'admin' }">
													<a href="fdelete.ad?faq_no=${ f.faq_no }" >삭제하기</a>
													</c:if>
												</td>
											</tr>
                                        </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                                    </div>
                                </div>
                                <!-- End accordian-part -->
                            </div>
                        </div>
                    </div>
                </div>
                 




     <footer class="footer">
            <%@ include file="../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->


	<%@ include file="../include/bjs.jsp" %>
	
<script>

$(function(){
	
		$(".question").on("click" , function(){
			
			var this_answer=$(this).parent().next().children().eq(0); // 질문의 답변
			
			if($(this_answer).css("display")=="table-cell"){
				
				$(".table-active").hide()
			}else{
				$(".table-active").hide()
				$(this_answer).show()
				
				
			}
			/* //다 접기
			var this_answer=$(this).parent().next().children().eq(0);
			$(".answer").each(function(index,item){
				if($(this)!=this_answer)alert("ddd")
			})
			this_answer.toggle() */
		});
	
		$(".answer").on("click" , function(){
			
			
		});
	
});


</script>
</body>
</html>
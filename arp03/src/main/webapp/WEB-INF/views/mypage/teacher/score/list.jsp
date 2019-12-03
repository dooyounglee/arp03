<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../../../include/bhead.jsp"%>
</head>
<body class="fix-header card-no-border logo-center">

	<!-- Preloader - style you can find in spinners.css -->
 	<%@ include file="../../../include/bpreloader.jsp" %> 
	<!-- End of Preloader - style you can find in spinners.css -->
	
	<!-- Main wrapper -->
	<div id="main-wrapper">
	
        <!-- Topbar header - style you can find in pages.scss -->
        <header class="topbar">
        	<%@ include file="../../../include/btopbarheader.jsp" %>
        </header>
        <!-- End Topbar header -->
        
        <!-- Left-sidebar -->
        <aside class="left-sidebar">
        	<%@ include file="../../../include/bsidebar.jsp" %>
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
                        <h3 class="text-themecolor mb-0 mt-0">Lecture List</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${cp }">Home</a></li>
                            <li class="breadcrumb-item"><a href="lectureList.ad">Lecture List</a></li>
                            <li class="breadcrumb-item"><a href="main.lec?lec_no=${lec.lec_no }">${lec.title }</a></li>
                            <li class="breadcrumb-item active">점수</li>
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
                <div class="row">
                	
                	<!-- 수강페이지 메뉴 -->
                	<%@ include file="../../../include/blecturemenu.jsp" %>
                	
                    <div class="col-lg-10 col-xlg-10 col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">시험 점수 관리</h5>
                                <h6 class="card-subtitle">Just click on the table cell you want to edit.</h6>
                                <div class="table-responsive">
                                    <table class="table striped editable-table no-wrap">
                                        <thead>
                                        	<tr>
	                                        	<th></th>
												<c:forEach var="e" items="${elist }">
													<th width="100px">${e.title }</th>
												</c:forEach>
												<th>총합</th>
											</tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="m" items="${mlist }">
												<tr>
													<td>${m.name }#${m.m_no }</td>
													
													<c:set var="sum" value="0"/>
													<c:forEach var="e" items="${elist }">
														
														<!-- score선택 -->
														<c:set var="loop_flag" value="false" />
														<c:set var="score" value=""/>
														<c:forEach var="s" items="${slist }">
															<c:if test="${not loop_flag }">
																<c:if test="${s.m_no eq m.m_no && s.e_no eq e.e_no }">
																	<c:set var="score" value="${s.score }"/>
																	<c:set var="sum" value="${sum+score }"/>
																	<c:set var="loop_flag" value="true" />
																</c:if>
															</c:if>
														</c:forEach>
														<!-- End of score선택 -->
														
														<td>
															<c:if test="${score eq 0 }">
																<c:set var="score" value=""/>
															</c:if>
															<c:if test="${mem.typee eq 's' }">
																${score }
															</c:if>
															<c:if test="${mem.typee eq 't' }">
																<input style="border:0px;width:100px" data-e_no="${e.e_no }" data-m_no="${m.m_no }" value="${score }">
															</c:if>
															<%-- ${score } --%>
														</td>
													</c:forEach>
														<td class=sum>${sum }</td>
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">숙제 점수 관리</h5>
                                <h6 class="card-subtitle">Just click on the table cell you want to edit.</h6>
                                <div class="table-responsive">
                                    <table class="table striped editable-table no-wrap">
                                        <thead>
                                        	<tr>
	                                        	<th></th>
												<c:forEach var="h" items="${hlist }">
													<c:if test="${h.status eq 'N' }">
													<th width="100px">${h.title }(${h.total })</th>
													</c:if>
												</c:forEach>
												<th>총합</th>
											</tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="m" items="${mlist }">
												<tr>
													<td>${m.name }#${m.m_no }</td>
													
													<c:set var="sum" value="0"/>
													<c:forEach var="hw" items="${hlist }">
														<c:if test="${hw.status eq 'N' }">
														
															<!-- score선택 -->
															<c:set var="scoreh" value="0"/>
															<c:forEach var="sh" items="${shlist }">
																	<c:if test="${sh.m_no eq m.m_no && sh.hw_no eq hw.hw_no }">
																		<c:set var="scoreh" value="${sh.cnt }"/>
																		<c:set var="sum" value="${sum+scoreh }"/>
																	</c:if>
															</c:forEach>
															<!-- End of score선택 -->
															
															<td>
																<c:if test="${mem.typee eq 't' }">
																<a href="checkAnswer.hw?hw_no=${hw.hw_no }&m_no=${m.m_no}">${scoreh }</a>
																</c:if>
																<c:if test="${mem.typee eq 's' }">
																${scoreh }
																</c:if>
															</td>
														</c:if>
													</c:forEach>
														<td class=sum>${sum }</td>
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
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
            <%@ include file="../../../include/bfooter.jsp" %>
        </footer>
        <!-- End footer -->

		</div>
        <!-- End of Page wrapper  -->
        
	</div>
	<!-- End of Main wrapper -->
	
	<%@ include file="../../../include/bjs.jsp" %>
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../../../include/header.jsp"/>
	<h1>성적</h1>
	<table border=1>
		<thead>
			<tr>
				<th></th>
				<c:forEach var="e" items="${elist }">
					<th width="100px">${e.title }</th>
				</c:forEach>
				<th>총합</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${mlist }">
				<tr>
					<td>${m.m_no }</td>
					
					<c:set var="sum" value="0"/>
					<c:forEach var="e" items="${elist }">
						
						<!-- score선택 -->
						<c:set var="loop_flag" value="false" />
						<c:set var="score" value=""/>
						<c:forEach var="s" items="${slist }">
							<c:if test="${not loop_flag }">
								<c:if test="${s.m_no eq m.m_no && s.e_no eq e.e_no }">
									<c:set var="score" value="${s.score }"/>
									<c:set var="sum" value="${sum+score }"/>
									<c:set var="loop_flag" value="true" />
								</c:if>
							</c:if>
						</c:forEach>
						<!-- End of score선택 -->
						
						<td>
							<c:if test="${score eq 0 }">
								<c:set var="score" value=""/>
							</c:if>
							<input style="width:100px" data-e_no="${e.e_no }" data-m_no="${m.m_no }" value="${score }">
						</td>
					</c:forEach>
						<td class=sum>${sum }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<script>
		//합
		$('table input').on('input',function(){
			var this_=$(this)
			var score=$(this_).val()
			if(isNaN(score) || score==""){
				score=0;
			}
	
			//총점
			var tds=this_.closest('tr').children('td')
			var sum_=this_.closest('tr').children('td.sum')
			var sum=0;
			for(i=1;i<tds.length-1;i++){
				var n=$(tds).eq(i).children().eq(0).val()
				if(n=='')n=0;
				sum+=parseInt(n)
			}
			$(sum_).text(sum)
			
		})
		
		$('table input').on('input',function(){
			var this_=$(this)
			var score=$(this_).val()
			if(isNaN(score) || score==""){
				score=0;
			}
			
			//db저장
			$.ajax({
				url:'insert.sc',
				type:'post',
				data:{
					e_no:$(this_).data('e_no'),
					m_no:$(this_).data('m_no'),
					score:score,
				},
				success:function(data){
					
				},
			})
		})
	</script>
	
	<jsp:include page="../../../include/footer.jsp"/>
</body>
</html>
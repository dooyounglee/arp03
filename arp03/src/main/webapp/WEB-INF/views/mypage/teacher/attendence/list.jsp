<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head태그. header.jsp말고 -->
	<%@ include file="../../../include/bhead.jsp"%>
<style>
	select {
		border:0;
		border-radius:0; /* 아이폰 사파리 보더 없애기 */
		-webkit-appearance:none; /* 화살표 없애기 for chrome*/
		-moz-appearance:none; /* 화살표 없애기 for firefox*/
		appearance:none /* 화살표 없애기 공통*/
	}
</style>
</head>
<body class="fix-header card-no-border logo-center">

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
                <div class="row">
                	
                	<!-- 수강페이지 메뉴 -->
                	<%@ include file="../../../include/blecturemenu.jsp" %>
                	
                    <div class="col-lg-9 col-xlg-10 col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Simple Editable table</h5>
                                <h6 class="card-subtitle">Just click on the table cell you want to edit.</h6>
                                <div class="table-responsive">
                                    <table class="table striped editable-table no-wrap">
                                        <thead>
                                        	<tr>
	                                        	<th></th>
												<c:forEach var="d" items="${dlist }">
													<th width="100px">${d.classdate.substring(5,10) }</th>
												</c:forEach>
												<th>출석률</th>
											</tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="m" items="${mlist }">
												<tr>
													<td>${m.m_no }</td>
													<c:forEach var="d" items="${dlist }" varStatus="i">
													
														<!-- attendence선택 -->
														<c:set var="attendence" value="0"/>
														<c:set var="checked1" value=""/>
														<c:set var="checked2" value=""/>
														<c:set var="checked3" value=""/>
														<c:set var="checked4" value=""/>
														<c:forEach var="a" items="${alist }">
															<c:if test="${a.m_no == m.m_no && a.nth == i.count }">
																<c:set var="attendence" value="${a.content }"/>
																	<c:if test="${attendence eq '0' }">
																		<c:set var="checked1" value="selected"/>
																	</c:if>
																	<c:if test="${attendence eq 'O' }">
																		<c:set var="checked2" value="selected"/>
																	</c:if>
																	<c:if test="${attendence eq '/' }">
																		<c:set var="checked3" value="selected"/>
																	</c:if>
																	<c:if test="${attendence eq 'X' }">
																		<c:set var="checked4" value="selected"/>
																	</c:if>
															</c:if>
														</c:forEach>
														<!-- End of attendence선택 -->
													
													<td>
														<c:if test="${mem.typee eq 's' }">
														${attendence }
														</c:if>
														<c:if test="${mem.typee eq 't' }">
														<select class="att" style="width:20px;" data-d_no="${i.count }" data-m_no="${m.m_no }">
															<option value="0" ${checked1 }>----</option>
															<option value="O" ${checked2 }>O</option>
															<option value="/" ${checked3 }>/</option>
															<option value="X" ${checked4 }>X</option>
														</select>
														</c:if>
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
	<%-- <table border=1>
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
	</table> --%>
	
	<script>
		$('.att').on('input',function(){
			var this_=$(this)
			var score=$(this_).val()
			
			if(isNaN(score) || score=="0"){
				score=0;
			}
			
			
			//db저장
			$.ajax({
				url:'insert.at',
				type:'post',
				data:{
					nth:$(this_).data('d_no'),
					m_no:$(this_).data('m_no'),
					content:$(this_).val(),
				},
				success:function(data){
					
				},
			})
		})
	</script>
	
	<jsp:include page="../../../include/footer.jsp"/>
</body>
</html>
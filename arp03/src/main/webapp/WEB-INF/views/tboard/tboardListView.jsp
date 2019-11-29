<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/bhead.jsp"%>
 <style>

	#page{
		margin-left:auto;
		margin-right:auto;
	}
	#btn{
		margin-left:94%;
	}

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
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
		
						<h4 class="card-title">게시판 리스트</h4>
		
					
					<%-- <c:if test="${ !empty mem }"> --%>
								<div class="table-responsive">
								<button onclick="location.href='insertTBoardFrom.do';" class="btn waves-effect waves-light btn-info" id="btn">글쓰기</button>
									<table class="table color-table muted-table">
										<thead>
											<tr>
												<th>번호</th>
												<th width="300">제목</th>
												<th>작성자</th>
												<th>작성일</th>
												<th>조회수</th>
												<th>첨부파일</th>
											</tr>
										<thead>
											<c:forEach items="${ list }" var="b">
												<tr>
													<td>${ b.b_no }</td>
													<c:if test="${ b.imageStatus eq 'Y' }">
													<td><a href="tbdetail.do?b_no=${ b.b_no }">${ b.title }
													<img src="resources/image/imgIcon.jpg" width="17px" height="17px" /></a></td>
													</c:if>
													<c:if test="${ b.imageStatus eq 'N' }">
														<td><a href="tbdetail.do?b_no=${ b.b_no }">${ b.title }</a></td>
													</c:if>
													<td>${ b.name }</td>
													<td>${b.regdate }</td>
													<td>${ b.vcount }</td>
													<c:if test="${ b.fileStatus eq 'Y' }">
														<td>O</td>
													</c:if>
													<c:if test="${ b.fileStatus eq 'N' }">
														<td></td>
													</c:if>
												</tr>
											</c:forEach>
		
										</table>
											<!-- 페이징 처리 -->
									
						
							</div>
						</div>
							<div id="page" >
									<ul class="pagination" >
									<c:if test="${ pi.currentPage eq 1 }">
										<li class="page-item"><a class="page-link">이전</a></li>
									</c:if> 
									<c:if test="${ pi.currentPage ne 1 }">
										<c:url value="tblist.do" var="before">
											<c:param name="currentPage" value="${ pi.currentPage-1 }" />
										</c:url>
										<li class="page-item"><a class="page-link" href="${ before }">이전</a></li>
									</c:if>
									
									<c:forEach begin="${ pi.startPage }"
														end="${ pi.endPage }" var="p">
											<c:if test="${ p eq pi.currentPage }">
													<li class="page-item"><a class="page-link">${ p }</a></li>
													
											</c:if>
											<c:if test="${ p ne pi.currentPage }">
													<c:url value="tblist.do" var="page">
														<c:param name="currentPage" value="${ p }" />
													</c:url>
												<li class="page-item"><a class="page-link" href="${ page }"> ${ p }</a></li>
											</c:if>
									</c:forEach> 
									
									<c:if test="${ pi.currentPage eq pi.maxPage }">
											<li class="page-item"><a class="page-link">다음</a></li>
									</c:if> 
									<c:if test="${ pi.currentPage ne pi.maxPage }">
											<c:url value="tblist.do" var="after">
													<c:param name="currentPage" value="${ pi.currentPage+1 }" />
											</c:url>
										<li class="page-item"><a class="page-link" href="${ after }"> 다음</a></li>
									</c:if>
									</ul>
									</div>
					
							
						</div>		
					</div>
				</div>
			</div>

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
	
	
	

	

	</div>
	
</body></html>
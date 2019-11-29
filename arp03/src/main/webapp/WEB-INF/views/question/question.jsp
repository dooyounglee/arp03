<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판</title>
	<%@ include file="../include/bhead.jsp"%>
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
                        <div class="d-flex mt-2 justify-content-end" align="right;">
                           
                            <%@ include file="qRealTime.jsp" %>
                            
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
                <!-- 수강페이지 메뉴 -->
                	<%@ include file="../include/blecturemenu.jsp" %>
                   
                    <div class="col-lg-10">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" align="center">${ lec.lec_no }번 강의_${ lec.title } 게시판</h4>
                                <h6 class="card-subtitle" align="center" style="color:black;">
                                	총 게시글 갯수 : ${ pi.listCount }&nbsp;&nbsp;&nbsp;페이지 : ${ pi.currentPage } / ${ pi.maxPage }
	                                 &nbsp;&nbsp;
	                                 <c:if test="${ !empty mem }">
										<span><button class="btn waves-effect waves-light btn-info" style="cursor:pointer;" onclick="location.href='qWriteForm.qu'">글쓰기</button></span>
									 </c:if>
                                </h6>
                                <div class="table-responsive">
                                    <table class="table color-bordered-table muted-bordered-table">
                                        <thead>
                                            <tr align="center">
												<th>번호</th>
												<th>제목</th>
												<th>회원이름</th>
												<th>작성일</th>
												<th>조회수</th>
												<th>첨부파일</th>
												<th>답변여부</th>
											</tr>
                                        </thead>
                                        <tbody>
                                        	<c:if test="${ empty qList }">
												<tr align="center">
													<td colspan="7">아직 게시글이 없습니다.</td>
												</tr>
											</c:if>
											
											<c:forEach items="${ qList }" var="q">
												<tr align="center">
													<td>${ q.q_no }</td>
													<td>
														<a href="qdetail.qu?q_no=${ q.q_no }">${ q.title }</a>
													</td>
													<td>${ q.name }</td>
													<td>${ q.regdate }</td>
													<td>${ q.vcount }</td>
													
													<c:if test="${ q.fileox eq 'Y' }">
														<td><img width="15" src="resources/siraFile/클립2.svg"></td>
													</c:if>
													<c:if test="${ q.fileox ne 'Y' }">
														<td>${ q.fileox } </td>
													</c:if>
													<td>${ q.isreply }</td>
												</tr>
											</c:forEach>
											
											
						<c:if test="${ !empty qList }">
							<!-- 페이징 -->
							<tr align="center" height="20">
								<td colspan="7">
									<!-- 이전 -->
									<c:if test="${ pi.currentPage eq 1 }">
										 이전 &nbsp;
									</c:if>
									<c:if test="${ pi.currentPage ne 1 }">
										<c:url value="question.qu" var="before">
											<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
											<c:param name="lec_no" value="${ lec.lec_no }"/>
										</c:url>
										<a href="${ before }"> 이전 </a>
									</c:if>
									<!-- 페이지 -->
										<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
											<c:if test="${ p eq pi.currentPage }">
												<font color="red" size="4"> ${ p } </font>
											</c:if>
											<c:if test="${ p ne pi.currentPage }">
												<c:url value="question.qu" var="page">
													<c:param name="currentPage" value="${ p }"/>
													<c:param name="lec_no" value="${ lec.lec_no }"/>
												</c:url>
												<a href="${ page }"> ${ p } </a>
											</c:if>
										</c:forEach>
									<!-- 다음 -->
									<c:if test="${ pi.currentPage eq pi.maxPage }">
										 다음 &nbsp;
									</c:if>
									<c:if test="${ pi.currentPage ne pi.maxPage && pi.currentPage eq 1 && pi.maxPage ne 0 }">
										<c:url value="question.qu" var="after">
											<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
											<c:param name="lec_no" value="${ lec.lec_no }"/>
										</c:url>
										<a href="${ after }"> 다음 </a>
									</c:if>
								</td>
							</tr>
						</c:if>
                                            <!-- <tr>
                                                <td>1</td>
                                                <td>Nigam</td>
                                                <td>Eichmann</td>
                                                <td>@Sonu</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Deshmukh</td>
                                                <td>Prohaska</td>
                                                <td>@Genelia</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Roshan</td>
                                                <td>Rogahn</td>
                                                <td>@Hritik</td>
                                            </tr> -->
                                        </tbody>
                                    </table>
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

<%-- 	<jsp:include page="../include/footer.jsp"/> --%>
</body>
</html>
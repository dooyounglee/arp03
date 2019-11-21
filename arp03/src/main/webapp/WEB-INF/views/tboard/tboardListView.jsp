<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/bhead.jsp"%>
<style>
	.col-lg-10{
	margin-left:auto;
	margin-right: auto;
	margin-top: auto;
	margin-bottom: auto;
	}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<%-- 	<!-- Preloader - style you can find in spinners.css -->
	<%@ include file="../include/bpreloader.jsp" %>
	<!-- End of Preloader - style you can find in spinners.css --> --%>



	<!-- Topbar header - style you can find in pages.scss -->
	<header class="topbar">
		<%@ include file="../include/btopbarheader.jsp"%>
	</header>
	<!-- End Topbar header -->

	<!-- Left-sidebar -->
	<aside class="left-sidebar">
		<%@ include file="../include/bsidebar.jsp"%>
	</aside>
	<!-- End of Left-sidebar -->

	<div class="page-wrapper">
	
	
	
	
	             <div class="row page-titles">
                 
                    <div class="col-md-7 col-4 align-self-center">
                        <div clarss="d-flex m-t-10 justify-content-end">
                            <div class="d-flex m-r-20 m-l-10 hidden-md-down">
                                
                            </div>
                            <div class="">
                                <button class="right-side-toggle waves-effect waves-light btn-success btn btn-circle btn-sm pull-right m-l-10"><i class="ti-settings text-white"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
		
		

	
	             <div class="row page-titles">
                 
                    <div class="col-md-7 col-4 align-self-center">
                        <div clarss="d-flex m-t-10 justify-content-end">
                            <div class="d-flex m-r-20 m-l-10 hidden-md-down">
                                
                            </div>
                            <div class="">
                                <button class="right-side-toggle waves-effect waves-light btn-success btn btn-circle btn-sm pull-right m-l-10"><i class="ti-settings text-white"></i></button>
                            </div>
                        </div>
                    </div>
                </div>

		<h1 align="center">게시판 리스트</h1>

		<c:if test="${ !empty mem }">
			<button onclick="location.href='insertTBoardFrom.do';">글쓰기</button>
		</c:if>
		<div class="row">
			<div class="col-lg-12">
			<!-- 	<div class="card"> -->
					<div class="card-body" align="center">
						<div class="table-responsive">
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
												<td><a href="tbdetail.do?b_no=${ b.b_no }">${ b.title }<img
														src="resources/image/imgIcon.jpg" width="17px"
														height="17px" /></a></td>
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


									<!-- 페이징 처리 -->
									<tr align="center" height="20">
										<td colspan="6">
											<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">
					[이전] 
				</c:if> <c:if test="${ pi.currentPage ne 1 }">
												<c:url value="tblist.do" var="before">
													<c:param name="currentPage" value="${ pi.currentPage-1 }" />
												</c:url>
												<a href="${ before }">[이전] </a>
											</c:if> <!-- [페이지] --> <c:forEach begin="${ pi.startPage }"
												end="${ pi.endPage }" var="p">
												<c:if test="${ p eq pi.currentPage }">
													<font color="red" size="4"> [${ p }] </font>
												</c:if>
												<c:if test="${ p ne pi.currentPage }">
													<c:url value="tblist.do" var="page">
														<c:param name="currentPage" value="${ p }" />
													</c:url>
													<a href="${ page }"> ${ p } </a>
												</c:if>
											</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage eq pi.maxPage }">
					 [다음]
				</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
												<c:url value="tblist.do" var="after">
													<c:param name="currentPage" value="${ pi.currentPage+1 }" />
												</c:url>
												<a href="${ after }"> [다음]</a>
											</c:if>
										</td>
									</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	

	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/bhead.jsp"%>
<style>
	.col-lg-10,#page{
	margin-left:auto;
	margin-right: auto;

	}
	.card{
	margin-left:auto;
	margin-right: auto;
		/* width:1000px; */
	}
	.table{text-align:center;}
</style>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
</head>
<body class="fix-header card-no-border logo-center">
	
	<%@ include file="../include/bpreloader.jsp" %>
	
	<div id="main-wrapper">
	
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
	
		<div class="container-fluid">
	
	             <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">자유게시판</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/${cp }">Home</a></li>
                            <li class="breadcrumb-item active">자유게시판</li>
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
	
	<div class="row">
	<div class="col-12">
                        <div class="card">
                            <div class="card-body">
	
	<h3 align="center" style="color:black">자유 게시판</h3>
	
	<h6 align="center">총 게시글 갯수 : ${pi.listCount} 페이지 : 
	<c:if test="${ pi.listCount eq 0 }">
		0
	</c:if>
	<c:if test="${ pi.listCount ne 0 }">
		${ pi.currentPage }
	</c:if>
		 / ${ pi.maxPage } 
		<button class="btn waves-effect waves-light btn-info" onclick="location.href='binsertForm.do';">글쓰기</button>
	</h6>
	
	<div class="row">
			<div class="col-lg-12">
					
						<div class="table-responsive">
	<table align="center" cellspacing="0" width="700" class="table color-table muted-table">
		<thead>
		<tr>
			<th>번호</th>
			<th width="300">제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		</thead>
		<c:forEach items="${ list }" var="b">
			<tr>
				<td>${ b.b_no }</td>
				<td><a href="bdetail.do?b_no=${ b.b_no }">${ b.title }</a></td>
				<td>익명</td>
				<td>${ b.regdate }</td>
				<td>${ b.vcount }</td>
			</tr>
		</c:forEach>
		
		<c:if test="${pi.listCount eq 0}">
			<tr>
			<td align="center" colspan="5">존재하는 게시글이 없습니다.</td>
			</tr>
		</c:if>
		</table>
		</div>
		
		</div>
		<!-- 페이징 처리 -->
		<div id="page" align="center">
		<ul class="pagination">
		<c:if test="${pi.listCount ne 0}">
		<!-- <tr align="center" height="20">
			<td colspan="5"> -->
				<!-- 이전 -->
				<c:if test="${ pi.currentPage eq 1 }">
					<li class="page-item"><a class="page-link">이전</a></li>
				</c:if>
				<c:if test="${ pi.currentPage ne 1 }">
					<c:url value="blist.do" var="prev">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<li class="page-item"><a class="page-link" href="${ prev }">이전</a></li>
				</c:if>
				<!-- 페이지 -->
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:if test="${ p eq pi.currentPage }">
						<li class="page-item"><a class="page-link">${ p }</a></li>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url value="blist.do" var="page">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<li class="page-item"><a class="page-link" href="${ page }"> ${ p } </a></li>
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${ pi.currentPage eq pi.maxPage }">
					<li class="page-item"><a class="page-link">다음</a></li>
				</c:if>
				<c:if test="${ pi.currentPage ne pi.maxPage }">
					<c:url value="blist.do" var="next">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<li class="page-item"><a class="page-link" href="${ next }">다음</a></li>
				</c:if>	
			<!-- </td>
		</tr> -->
		</c:if>
		</ul>
		</div>
		</div>
	</div>
	
	                            </div>
                        </div>
                        
                        </div>
                        
                        </div>
                         <!-- ============================================================== -->
            			<!-- End Container fluid  -->
            			<!-- ============================================================== -->
                        
                        <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
                        
                        
</div>
	</div>
	
	<%@ include file="../include/bjs.jsp" %>
</body>
</html>
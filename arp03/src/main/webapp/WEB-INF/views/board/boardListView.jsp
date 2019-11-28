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
		width:1000px;
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
		<c:if test="${ !empty mem }">
		<button class="btn waves-effect waves-light btn-info" onclick="location.href='binsertForm.do';">글쓰기</button>
		</c:if>
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
				<td>
					<c:if test="${ !empty mem }">
						<a href="bdetail.do?b_no=${ b.b_no }">${ b.title }</a>
					</c:if>
					<c:if test="${ empty mem }">
						${ b.title }
					</c:if>
				</td>
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
					<li class="page-item"><a class="page-link" href="${ prev }">[prev]</a></li>
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
					<li class="page-item"><a class="page-link" href="${ next }">[next]</a></li>
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
                        
                        <footer class="footer">
	            <%@ include file="../include/bfooter.jsp" %>
	        </footer>
                        
                        
</div>
	</div>
	
	<%@ include file="../include/bjs.jsp" %>
</body>
</html>